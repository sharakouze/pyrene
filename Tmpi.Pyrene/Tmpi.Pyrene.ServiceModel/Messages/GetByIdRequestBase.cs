using ServiceStack;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    public abstract class GetByIdRequestBase<T> : IReturn<T>, IGetByIdRequest<int>
    {
        public int Id { get; set; }
    }
}
