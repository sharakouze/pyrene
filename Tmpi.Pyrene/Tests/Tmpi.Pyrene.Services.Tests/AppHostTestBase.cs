using ServiceStack;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using ServiceStack.Testing;
using System;
using Tmpi.Pyrene.Services.ServiceInterface;
using Tmpi.Pyrene.Services.ServiceModel.Types;

namespace Tmpi.Pyrene.Services.Tests
{
    public abstract class AppHostTestBase : IDisposable
    {
        protected readonly ServiceStackHost appHost;

        public AppHostTestBase()
        {
            appHost = new BasicAppHost(typeof(GenCompteurService).Assembly)
            {
                ConfigureContainer = container =>
                {
                    //Add your IoC dependencies here
                    container.Register<IDbConnectionFactory>(c => new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider));

                    using (var db = container.TryResolve<IDbConnectionFactory>().Open())
                    {
                        db.DropAndCreateTable<GenCompteur>();
                        db.DropAndCreateTable<GenCompteurValeur>();

                        db.Insert(new GenCompteur { CodObjet = "Test compteur", LibObjet = "test" });
                    }
                }
            }
            .Init();
        }

        public void Dispose()
        {
            appHost.Dispose();
        }
    }
}
