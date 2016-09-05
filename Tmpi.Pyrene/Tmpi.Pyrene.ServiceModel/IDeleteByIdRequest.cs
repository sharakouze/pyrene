namespace Tmpi.Pyrene.ServiceModel
{
    public interface IDeleteByIdRequest<T>
    {
        T Id { get; set; }
    }
}
