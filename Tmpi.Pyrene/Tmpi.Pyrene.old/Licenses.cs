using System.Reflection;
using Tmpi.Pyrene.ServiceInterface;

namespace Tmpi.Pyrene
{
    internal static class Licenses
    {
        public static Assembly[] GetAssembliesWithServices()
        {
            return new[] { typeof(CompteurService).Assembly };
        }
    }
}