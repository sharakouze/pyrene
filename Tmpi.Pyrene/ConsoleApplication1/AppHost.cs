using Funq;
using ServiceStack;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using System;
using Tmpi.Pyrene.ServiceInterface;
using Tmpi.Pyrene.ServiceModel.Types;

namespace ConsoleApplication1
{
    public class AppHost : AppHostHttpListenerBase
    {
        public AppHost()
            : base("ConsoleApplication1", typeof(GenCompteurService).Assembly) { }

        public override void Configure(Container container)
        {
            string connstr = @"Server=(localdb)\MSSQLLocalDB;Database=TMPI_PYRENE;Integrated Security=True;MultipleActiveResultSets=True";
            container.Register<IDbConnectionFactory>(c =>
                        new OrmLiteConnectionFactory(connstr, SqlServerDialect.Provider));

            Plugins.Add(new ServiceStack.Api.Swagger.SwaggerFeature());

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

        }
    }
}