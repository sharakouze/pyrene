using System;
using System.Collections.Generic;
using Tmpi.Pyrene.Infrastructure.Messages;

namespace Tmpi.Pyrene.Core.Models.Messages
{
    public enum BaseResultType
    {
        Undefined = 0,

        Entity,
        Simple,
        PrimaryKey,
    }

    public class SelectSociete : IPaginableRequest, IFilterableRequest
    {
        public IEnumerable<int> CleSocieteList { get; set; } = new List<int>();

        public string Filter { get; set; }

        public BaseResultType ResultType { get; set; }

        /// <summary>
        /// Implémente <see cref="IPaginableRequest.Skip" />.
        /// </summary>
        public int Skip { get; set; }

        /// <summary>
        /// Implémente <see cref="ISortableRequest.Sort" />.
        /// </summary>
        public string[] Sort { get; set; }

        /// <summary>
        /// Implémente <see cref="IPaginableRequest.Take" />.
        /// </summary>
        public int Take { get; set; }
    }
}
