using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tmpi.Pyrene.Common
{
    /// <summary>
    /// Fournit des méthodes statiques permettant de manipuler des chaînes.
    /// </summary>
    public static class StringExtensions
    {
        /// <summary>
        /// Fractionne une chaîne en sous-chaînes.
        /// </summary>
        /// <param name="input"></param>
        /// <param name="separators">Collection de caractères qui délimite les sous-chaînes de cette chaîne.</param>
        /// <param name="qualifierStart"></param>
        /// <param name="qualifierEnd"></param>
        /// <param name="escapeChar"></param>
        /// <param name="removeEmptyEntries"></param>
        /// <param name="removeSeparators"></param>
        /// <returns></returns>
        public static string[] SplitWithQualifier(string input, IEnumerable<char> separators,
            char qualifierStart, char qualifierEnd, char escapeChar,
            bool removeEmptyEntries = false, bool removeSeparators = true, bool removeQualifiers = true)
        {
            if (input == null)
            {
                throw new ArgumentNullException(nameof(input));
            }
            if (separators == null)
            {
                throw new ArgumentNullException(nameof(separators));
            }

            var results = new List<string>();

            var buffer = new StringBuilder();
            int index = 0;

            bool escaped = false;
            int inQualifierCount = 0;

            while (index < input.Length)
            {
                char c = input[index];

                if (escaped)
                {
                    buffer.Append(c);
                    escaped = false;
                }
                else if (c == escapeChar)
                {
                    escaped = true;
                }
                else if (c == qualifierStart || c == qualifierEnd)
                {
                    if (qualifierStart == qualifierEnd)
                    {
                        inQualifierCount = inQualifierCount == 0 ? 1 : 0;
                    }
                    else
                    {
                        inQualifierCount++;
                    }
                }
                else if (c == qualifierEnd)
                {
                    inQualifierCount--;
                }
                else if (separators.Contains(c) && inQualifierCount == 0)
                {
                    if (!removeEmptyEntries || buffer.Length > 0)
                    {
                        string value = buffer.ToString();
                        buffer.Clear();

                        results.Add(value);
                    }
                    if (!removeSeparators)
                    {
                        results.Add(c.ToString());
                    }
                }
                else
                {
                    buffer.Append(c);
                }

                index++;
            }

            if (buffer.Length > 0)
            {
                string value = buffer.ToString();

                if (!removeEmptyEntries || !string.IsNullOrWhiteSpace(value))
                {
                    results.Add(value);
                }
            }

            return results.ToArray();
        }
    }
}
