using System.Reflection;
using Tmpi.Pyrene.Services.ServiceInterface;

namespace Tmpi.Pyrene.Services
{
    internal static class Licenses
    {
        public static Assembly[] GetAssembliesWithServices()
        {
            return new[] { typeof(GenCompteurService).Assembly };
        }
    }
}