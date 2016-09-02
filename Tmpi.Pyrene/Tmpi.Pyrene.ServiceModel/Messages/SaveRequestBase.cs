using ServiceStack;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    public abstract class SaveRequestBase<T> : IReturn<T>
    {
        public int? Id { get; set; }

        public T Entity { get; set; }
    }
}
