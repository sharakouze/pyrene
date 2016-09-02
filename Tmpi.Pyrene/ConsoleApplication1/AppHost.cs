using Funq;
using ServiceStack;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using Tmpi.Pyrene.ServiceInterface;

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
        }
    }
}