using Funq;
using ServiceStack;
using Tmpi.Pyrene.ServiceInterface;

namespace ConsoleApplication1
{
    public class AppHost : AppHostBase
    {
        public AppHost()
            : base("WebApplication1", typeof(GenSocieteServices).Assembly) { }

        public override void Configure(Container container)
        {
        }
    }
}