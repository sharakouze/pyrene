using Funq;
using ServiceStack;

namespace Tmpi.Pyrene.Services
{
    public class AppHost : AppHostBase
    {
        public AppHost()
            : base(AppHostHelper.ServiceName, Licenses.GetAssembliesWithServices())
        {
        }

        public override void Configure(Container container)
        {
            var currentFeatures = this.Config.EnableFeatures;
            SetConfig(new HostConfig()
            {
#if DEBUG
                DebugMode = true,
#else
                DebugMode = false,
#endif
                EnableFeatures = currentFeatures.Remove(Feature.Soap),
            });

            AppHostHelper.ConfigCsv();

            AppHostHelper.ConfigJson();

            AppHostHelper.ConfigDbConnection(container, "PyreneModel");

            AppHostHelper.ConfigPlugins(Plugins);
        }
    }
}