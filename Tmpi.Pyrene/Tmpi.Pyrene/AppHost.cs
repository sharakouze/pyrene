using Audit.Core;
using Funq;
using ServiceStack;
using ServiceStack.Api.Swagger;
using ServiceStack.Data;
using ServiceStack.OrmLite;
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

        #region ConfigurationManager
        private T GetAppSettingOrDefault<T>(string key, T defaultValue = default(T))
        {
            string str = ConfigurationManager.AppSettings[key];
            if (string.IsNullOrEmpty(str))
            {
                return defaultValue;
            }

            Type type = typeof(T);
            if (type.IsEnum)
            {
                return (T)Enum.Parse(type, str, true);
            }
            return (T)Convert.ChangeType(str, type);
        }

        private string GetConnectionStringOrLast(string key, out string providerName)
        {
            ConnectionStringSettings settings = null;

            if (string.IsNullOrEmpty(key))
            {
                int count = ConfigurationManager.ConnectionStrings.Count;
                if (count > 0)
                {
                    settings = ConfigurationManager.ConnectionStrings[count - 1];
                }
            }
            else
            {
                settings = ConfigurationManager.ConnectionStrings[key];
            }

            if (settings == null)
            {
                throw new Exception(string.Format("La chaîne de connexion '{0}' est introuvable.", key));
            }

            providerName = settings.ProviderName;
            return settings.ConnectionString;
        }
        #endregion

        private void ConfigHost()
        {
            var enableFeatures = Feature.All.Remove(Feature.Soap);

            bool jsvFeatureEnabled = GetAppSettingOrDefault("HostConfig.JsvFeature", false);
            if (!jsvFeatureEnabled)
            {
                enableFeatures = enableFeatures.Remove(Feature.Jsv);
            }

            bool debugMode = GetAppSettingOrDefault("HostConfig.DebugMode", false);
#if DEBUG
            debugMode = true;
#endif
            SetConfig(new HostConfig
            {
                DebugMode = debugMode,
                EnableFeatures = enableFeatures,
            });
        }

        /// <summary>
        /// Configure la sérialisation CSV.
        /// </summary>
        private void ConfigCsvSerialization()
        {
            string itemDelimiterString = GetAppSettingOrDefault<string>("CsvConfig.ItemDelimiterString");
            CsvConfig.ItemDelimiterString = itemDelimiterString ?? string.Empty;

            string itemSeparatorString = GetAppSettingOrDefault<string>("CsvConfig.ItemSeparatorString");
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
            var dateHandler = GetAppSettingOrDefault("JsConfig.DateHandler", DateHandler.ISO8601);
            JsConfig.DateHandler = dateHandler;

            JsConfig.ExcludeDefaultValues = true;
        }

        /// <summary>
        /// Configure OrmLite.
        /// </summary>
        /// <param name="container"></param>
        private void ConfigOrmLite(Container container)
        {
            string connectionStringName = GetAppSettingOrDefault<string>("OrmLiteConfig.ConnectionStringName");

            string providerName;
            string connectionString = GetConnectionStringOrLast(connectionStringName, out providerName);

            //SqlServerDialect.Provider.RegisterConverter<short>(new SqlServerSmallintConverter());

            container.Register<IDbConnectionFactory>(c => new OrmLiteConnectionFactory(connectionString, SqlServerDialect.Provider));

            int commandTimeout = GetAppSettingOrDefault("OrmLiteConfig.CommandTimeout", 30);
            OrmLiteConfig.CommandTimeout = commandTimeout;

            ConfigOrmLiteFilters();
        }

        /// <summary>
        /// Configure les filtres OrmLite.
        /// </summary>
        private void ConfigOrmLiteFilters()
        {
            OrmLiteConfig.InsertFilter = (dbCmd, row) =>
            {
                var auditRow = row as IAuditable;
                if (auditRow != null)
                {
                    auditRow.DatCreation = DateTime.UtcNow;
                    auditRow.CleCreateur = 123465;
                }
            };

            OrmLiteConfig.UpdateFilter = (dbCmd, row) =>
            {
                var auditRow = row as IAuditable;
                if (auditRow != null)
                {
                    auditRow.DatEdition = DateTime.UtcNow;
                    auditRow.CleEditeur = 123456;
                }
            };
        }

        /// <summary>
        /// Configure le plugin CORS.
        /// </summary>
        private void ConfigCorsPlugin()
        {
            bool corsFeatureEnabled = GetAppSettingOrDefault("Plugins.CorsFeature", false);
            if (corsFeatureEnabled)
            {
                var allowOriginWhitelist = new[] { CorsFeature.DefaultOrigin };

                string text = GetAppSettingOrDefault<string>("Plugins.CorsFeature.AllowOriginWhitelist");
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
            bool swaggerFeatureEnabled = GetAppSettingOrDefault("Plugins.SwaggerFeature", false);
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
            bool validationFeatureEnabled = GetAppSettingOrDefault("Plugins.ValidationFeature", true);
            if (validationFeatureEnabled)
            {
                Plugins.Add(new ValidationFeature());
                container.RegisterValidators(ServiceAssemblies);
            }
        }

        /// <summary>
        /// Configure Audit.NET.
        /// </summary>
        private void ConfigAuditNet()
        {
            Audit.Core.Configuration.CreationPolicy = EventCreationPolicy.Manual;
        }

        public override void Configure(Container container)
        {
            ConfigHost();

            ConfigOrmLite(container);

            ConfigCorsPlugin();
            ConfigSwaggerPlugin();
            ConfigValidationPlugin(container);

            ConfigCsvSerialization();
            ConfigJsonSerialization();

            ConfigAuditNet();
        }
    }
}