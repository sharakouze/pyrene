using Funq;
using ServiceStack;
using ServiceStack.Api.Swagger;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using ServiceStack.Text;
using System;
using System.Configuration;
using Tmpi.Pyrene.Infrastructure.Types;

namespace Tmpi.Pyrene.Services
{
    public class AppHost : AppHostBase
    {
        public AppHost()
            : base("Tmpi.Pyrene.Services", Licenses.GetAssembliesWithServices())
        {
        }

        public override void Configure(Container container)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PyreneModel"].ConnectionString;
            container.Register<IDbConnectionFactory>(c =>
                        new OrmLiteConnectionFactory(connectionString, SqlServerDialect.Provider));

            bool pluginSwaggerEnabled = false;
            bool.TryParse(ConfigurationManager.AppSettings["PluginSwaggerEnabled"], out pluginSwaggerEnabled);
            if (pluginSwaggerEnabled)
            {
                Plugins.Add(new SwaggerFeature());
            }

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

            JsConfig.DateHandler = ServiceStack.Text.DateHandler.ISO8601;
        }
    }
}