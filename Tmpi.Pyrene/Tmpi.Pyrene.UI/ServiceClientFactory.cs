using ServiceStack;
using System.Configuration;

namespace Tmpi.Pyrene.UI
{
    internal static class ServiceClientFactory
    {
        public static IServiceClient Create()
        {
            string uri = ConfigurationManager.AppSettings["ServiceUrl"];
            return new JsonHttpClient(uri);
        }
    }
}