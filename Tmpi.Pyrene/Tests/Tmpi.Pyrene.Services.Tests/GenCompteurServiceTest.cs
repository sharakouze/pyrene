using Tmpi.Pyrene.Services.ServiceInterface;
using Tmpi.Pyrene.Services.ServiceModel;
using Xunit;

namespace Tmpi.Pyrene.Services.Tests
{
    public class GenCompteurServiceTest : AppHostTestBase
    {
        [Fact]
        public void Should()
        {
            using (var service = appHost.TryResolve<GenCompteurService>())
            {
                var compteur = service.Get(new GetGenCompteur() { Id = 1 });

                Assert.Equal(compteur.CodObjet, "Test");
            }
        }
    }
}
