using ServiceStack;

namespace Tmpi.Pyrene.ServiceModel
{
    public abstract class DeleteByIdRequestBase : IReturnVoid
    {
        public int Id { get; set; }
    }
}
