using System.Collections.Generic;
using System.Linq;

namespace Tmpi.Pyrene.Infrastructure.Messages
{
    /// <summary>
    /// Fournit des méthodes statiques permettant de manipuler des <see cref="IEnumerable{T}"/>.
    /// </summary>
    public static class EnumerableHelper
    {
        /// <summary>
        /// Indique si la collection spécifiée est <b>null</b> ou vide.
        /// </summary>
        /// <typeparam name="T">Type des objets de <paramref name="source"/>.</typeparam>
        /// <param name="source">Collection à tester.</param>
        /// <returns><b>true</b> si la collection est <b>null</b> ou vide ; sinon <b>false</b>.</returns>
        public static bool IsNullOrEmpty<T>(IEnumerable<T> source)
        {
            return source == null || !source.Any();
        }
    }
}
