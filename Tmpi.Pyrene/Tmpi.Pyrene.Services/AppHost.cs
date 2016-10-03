using Funq;
using ServiceStack;
using ServiceStack.Api.Swagger;
using ServiceStack.Text;
using ServiceStack.Validation;
using System;
using System.Linq;
using System.Configuration;

namespace Tmpi.Pyrene.Services
{
    public class AppHost : AppHostBase
    {
        public AppHost()
            : base("Tmpi.Pyrene.Services", Licenses.GetAssembliesWithServices())
        {
        }

        /// <summary>
        /// Configure la sérialisation CSV.
        /// </summary>
        private void ConfigCsv()
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
        private void ConfigJson()
        {
            JsConfig.DateHandler = DateHandler.ISO8601;
            JsConfig.ExcludeDefaultValues = true;
        }

        public override void Configure(Container container)
        {
            var currentFeatures = this.Config.EnableFeatures;
            SetConfig(new HostConfig()
            {
#if DEBUG
                DebugMode = true,
#else
                DebugMode = false,
#endif
                EnableFeatures = currentFeatures.Remove(Feature.Soap),
            });

            ConfigCsv();
            ConfigJson();

            AppHostHelper.ConfigDbConnection(container, "PyreneModel");

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

            bool validationFeatureEnabled = true;
            bool.TryParse(ConfigurationManager.AppSettings["Plugins.ValidationFeature"], out validationFeatureEnabled);
            if (validationFeatureEnabled)
            {
                Plugins.Add(new ValidationFeature());
                container.RegisterValidators(ServiceAssemblies);
            }

            bool swaggerFeatureEnabled = false;
            bool.TryParse(ConfigurationManager.AppSettings["Plugins.SwaggerFeature"], out swaggerFeatureEnabled);
            if (swaggerFeatureEnabled)
            {
                Plugins.Add(new SwaggerFeature()
                {
                    RouteSummary =
                    {
                        { "/GenCompteur", "Compteurs de numérotation" },
                        { "/GenExercice", "Exercices budgétaires" },
                        { "/GenFourn", "Fournisseurs" },
                        { "/GenMandat", "Mandats" },
                        { "/GenPersonne", "Utilisateurs" },
                        { "/GenSecteur", "Secteurs" },
                        { "/GenService", "Services" },
                        { "/GenSociete", "Sociétés" },
                        { "/GenTVA", "TVA" },
                    }
                });
            }
        }
    }
}