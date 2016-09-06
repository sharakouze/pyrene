using Funq;
using ServiceStack;
using ServiceStack.Api.Swagger;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using ServiceStack.Text;
using System;
using System.Configuration;
using Tmpi.Pyrene.Services.ServiceInterface;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services
{
    public class AppHost : AppHostBase
    {
        public AppHost()
            : base("ConsoleApplication1", typeof(GenCompteurService).Assembly) { }

        public override void Configure(Container container)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PyreneModel"].ConnectionString;
            container.Register<IDbConnectionFactory>(c =>
                        new OrmLiteConnectionFactory(connectionString, SqlServerDialect.Provider));

            bool pluginSwagger = false;
            bool.TryParse(ConfigurationManager.AppSettings["PluginSwagger"], out pluginSwagger);
            if (pluginSwagger)
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