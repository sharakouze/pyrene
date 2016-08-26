namespace Tmpi.Pyrene.ServiceModel.Messages
{
    public interface IDeleteByIdRequest<T>
    {
        T Id { get; set; }
    }
}
