using ServiceStack;

namespace Tmpi.Pyrene.UI
{
    internal static class ServiceClientFactory
    {
        public static IServiceClient Create()
        {
            return new JsonHttpClient();
        }
    }
}