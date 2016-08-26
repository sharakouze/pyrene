using Funq;
using ServiceStack;
using Tmpi.Pyrene.ServiceInterface;

namespace ConsoleApplication1
{
    public class AppHost : AppHostHttpListenerBase
    {
        public AppHost()
            : base("ConsoleApplication1", typeof(GenSocieteService).Assembly) { }

        public override void Configure(Container container)
        {
        }
    }
}