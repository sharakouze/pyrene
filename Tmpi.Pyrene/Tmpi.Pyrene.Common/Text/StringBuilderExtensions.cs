using System.Linq;
using System.Text;

namespace Tmpi.Pyrene.Common.Text
{
    public static class StringBuilderExtensions
    {
        /// <summary>
        /// Supprime d'un objet <see cref="StringBuilder"/>, toutes les occurrences situées à la fin d'un jeu de 
        /// caractères spécifiés dans un tableau.
        /// </summary>
        /// <param name="sb"></param>
        /// <param name="trimChars">Tableau de caractères Unicode à supprimer, ou <b>null</b>.</param>
        /// <returns></returns>
        public static StringBuilder TrimEnd(this StringBuilder sb, params char[] trimChars)
        {
            if (sb == null || sb.Length == 0)
            {
                return sb;
            }

            int i = sb.Length - 1;
            while (i >= 0)
            {
                if (trimChars == null || trimChars.Length == 0)
                {
                    if (!char.IsWhiteSpace(sb[i]))
                    {
                        break;
                    }
                }
                else if (!trimChars.Contains(sb[i]))
                {
                    break;
                }
                i--;
            }

            if (i < sb.Length - 1)
            {
                sb.Length = i + 1;
            }

            return sb;
        }
    }
}
