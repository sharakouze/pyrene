namespace Tmpi.Pyrene.ServiceModel.Messages
{
    public abstract class SelectRequest : IPaginableRequest, IFilterableRequest
    {
        public string Filter { get; set; }

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
