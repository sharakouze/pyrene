using ServiceStack;

namespace Tmpi.Pyrene.ServiceModel.Messages
{
    public abstract class DeleteByIdRequestBase : IReturnVoid
    {
        public int Id { get; set; }
    }
}
