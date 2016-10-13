using Funq;
using ServiceStack;
using ServiceStack.Api.Swagger;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using ServiceStack.Text;
using ServiceStack.Validation;
using System;
using System.Collections.Generic;
using System.Configuration;
using Tmpi.Pyrene.Services.ServiceModel.Types;

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


        public static void ConfigDbConnection(Container container, string connectionStringName)
        {
            //SqlServerDialect.Provider.RegisterConverter<short>(new SqlServerSmallintConverter());

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

            string connectionString = ConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;
            container.Register<IDbConnectionFactory>(
                c => new OrmLiteConnectionFactory(connectionString, SqlServerDialect.Provider)
                );
        }
    }
}