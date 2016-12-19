using Funq;
using ServiceStack;
using ServiceStack.Api.Swagger;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using ServiceStack.Razor;
using ServiceStack.Text;
using ServiceStack.Validation;
using System;
using System.Configuration;
using Tmpi.Pyrene.ServiceModel.Types;

namespace Tmpi.Pyrene
{
    public class AppHost : AppHostBase
    {
        public AppHost()
            : base("Tmpi.Pyrene.Services", Licenses.GetAssembliesWithServices())
        {
        }

        private void ConfigHost()
        {
            var enableFeatures = Feature.All.Remove(Feature.Soap);

            bool jsvFeatureEnabled = false;
            bool.TryParse(ConfigurationManager.AppSettings["HostConfig.JsvFeature"], out jsvFeatureEnabled);
            if (!jsvFeatureEnabled)
            {
                enableFeatures = enableFeatures.Remove(Feature.Jsv);
            }

            SetConfig(new HostConfig
            {
                //#if DEBUG
                //                DebugMode = true,
                //#else
                //                DebugMode = false,
                //#endif
                EnableFeatures = enableFeatures,
            });
        }

        /// <summary>
        /// Configure la sérialisation CSV.
        /// </summary>
        private void ConfigCsvSerialization()
        {
            string itemDelimiterString = ConfigurationManager.AppSettings["CsvConfig.ItemDelimiterString"];
            CsvConfig.ItemDelimiterString = itemDelimiterString ?? string.Empty;

            string itemSeparatorString = ConfigurationManager.AppSettings["CsvConfig.ItemSeparatorString"];
            if (!string.IsNullOrEmpty(itemSeparatorString))
            {
                CsvConfig.ItemSeperatorString = itemSeparatorString;
            }
        }

        /// <summary>
        /// Configure la sérialisation JSON.
        /// </summary>
        private void ConfigJsonSerialization()
        {
            JsConfig.DateHandler = DateHandler.ISO8601;
            JsConfig.ExcludeDefaultValues = true;
        }

        /// <summary>
        /// Configure OrmLite.
        /// </summary>
        /// <param name="container"></param>
        private void ConfigOrmLite(Container container)
        {
            ConnectionStringSettings settings = null;

            string connectionStringName = ConfigurationManager.AppSettings["OrmLiteConfig.ConnectionStringName"];
            if (string.IsNullOrWhiteSpace(connectionStringName))
            {
                int count = ConfigurationManager.ConnectionStrings.Count;
                if (count > 0)
                {
                    settings = ConfigurationManager.ConnectionStrings[count - 1];
                }
            }
            else
            {
                settings = ConfigurationManager.ConnectionStrings[connectionStringName];
            }

            if (settings == null)
            {
                throw new Exception(string.Format("La chaîne de connexion '{0}' est introuvable.", connectionStringName));
            }

            string connectionString = settings.ConnectionString;
            container.Register<IDbConnectionFactory>(c => new OrmLiteConnectionFactory(connectionString, SqlServerDialect.Provider));

            //SqlServerDialect.Provider.RegisterConverter<short>(new SqlServerSmallintConverter());

            int commandTimeout = 30;
            int.TryParse(ConfigurationManager.AppSettings["OrmLiteConfig.CommandTimeout"], out commandTimeout);
            OrmLiteConfig.CommandTimeout = commandTimeout;

            ConfigOrmLiteFilters();
        }

        private void ConfigOrmLiteFilters()
        {
            OrmLiteConfig.InsertFilter = (dbCmd, row) =>
            {
                var auditRow = row as IAuditable;
                if (auditRow != null)
                {
                    auditRow.DatCreation = DateTime.UtcNow;
                    auditRow.CleCreateur = 123;
                }
            };

            OrmLiteConfig.UpdateFilter = (dbCmd, row) =>
            {
                var auditRow = row as IAuditable;
                if (auditRow != null)
                {
                    auditRow.DatEdition = DateTime.UtcNow;
                    auditRow.CleEditeur = 123;
                }
            };
        }

        /// <summary>
        /// Configure le plugin CORS.
        /// </summary>
        private void ConfigCorsPlugin()
        {
            bool corsFeatureEnabled = false;
            bool.TryParse(ConfigurationManager.AppSettings["Plugins.CorsFeature"], out corsFeatureEnabled);
            if (corsFeatureEnabled)
            {
                var allowOriginWhitelist = new[] { CorsFeature.DefaultOrigin };

                string text = ConfigurationManager.AppSettings["Plugins.CorsFeature.AllowOriginWhitelist"];
                if (!string.IsNullOrWhiteSpace(text))
                {
                    allowOriginWhitelist = text.Split(new[] { ' ', ',', ';' }, StringSplitOptions.RemoveEmptyEntries);
                }

                CorsFeature corsFeature = null;

                if (allowOriginWhitelist.Length == 1)
                {
                    corsFeature = new CorsFeature(allowOriginWhitelist[0]);
                }
                else
                {
                    corsFeature = new CorsFeature(allowOriginWhitelist);
                }

                Plugins.Add(corsFeature);
            }
        }

        /// <summary>
        /// Configure le plugin Swagger.
        /// </summary>
        private void ConfigSwaggerPlugin()
        {
            bool swaggerFeatureEnabled = false;
            bool.TryParse(ConfigurationManager.AppSettings["Plugins.SwaggerFeature"], out swaggerFeatureEnabled);
            if (swaggerFeatureEnabled)
            {
                Plugins.Add(new SwaggerFeature
                {
                    RouteSummary = SwaggerConfig.GetRouteSummary()
                });
            }
        }

        /// <summary>
        /// Configure le plugin Validation.
        /// </summary>
        /// <param name="container"></param>
        private void ConfigValidationPlugin(Container container)
        {
            Plugins.Add(new ValidationFeature());
            container.RegisterValidators(ServiceAssemblies);
        }

        /// <summary>
        /// Configure le plugin Razor.
        /// </summary>
        private void ConfigRazorPlugin()
        {
            Plugins.Add(new RazorFormat());
        }

        public override void Configure(Container container)
        {
            ConfigHost();

            ConfigOrmLite(container);

            ConfigCorsPlugin();
            ConfigSwaggerPlugin();
            ConfigValidationPlugin(container);
            ConfigRazorPlugin();

            ConfigCsvSerialization();
            ConfigJsonSerialization();
        }
    }
}