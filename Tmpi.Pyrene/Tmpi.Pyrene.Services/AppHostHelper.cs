using Funq;
using ServiceStack;
using ServiceStack.Api.Swagger;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using ServiceStack.Text;
using System;
using System.Collections.Generic;
using System.Configuration;
using Tmpi.Pyrene.Infrastructure.Types;

namespace Tmpi.Pyrene.Services
{
    public static class AppHostHelper
    {
        /// <summary>
        /// Obtient le nom du service.
        /// </summary>
        public static string ServiceName
        {
            get
            {
                return "Tmpi.Pyrene.Services";
            }
        }

        /// <summary>
        /// Configure la sérialisation CSV.
        /// </summary>
        public static void ConfigCsv()
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
        public static void ConfigJson()
        {
            JsConfig.DateHandler = DateHandler.ISO8601;
        }

        public static void ConfigDbConnection(Container container, string connectionStringName)
        {
            //SqlServerDialect.Provider.RegisterConverter<short>(new SqlServerSmallintConverter());

            OrmLiteConfig.InsertFilter = (dbCmd, row) =>
            {
                var auditRow = row as IAuditable;
                if (auditRow != null)
                {
                    auditRow.DatCreation = auditRow.DatModif = DateTime.UtcNow;
                }
            };

            OrmLiteConfig.UpdateFilter = (dbCmd, row) =>
            {
                var auditRow = row as IAuditable;
                if (auditRow != null)
                {
                    auditRow.DatModif = DateTime.UtcNow;
                }
            };

            string connectionString = ConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;
            container.Register<IDbConnectionFactory>(
                c => new OrmLiteConnectionFactory(connectionString, SqlServerDialect.Provider)
                );
        }

        public static void ConfigPlugins(List<IPlugin> plugins)
        {
            bool swaggerEnabled = false;
            bool.TryParse(ConfigurationManager.AppSettings["Plugins.SwaggerEnabled"], out swaggerEnabled);
            if (swaggerEnabled)
            {
                plugins.Add(new SwaggerFeature());
            }
        }
    }
}