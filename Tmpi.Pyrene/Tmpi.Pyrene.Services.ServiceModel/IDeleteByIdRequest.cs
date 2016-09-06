namespace Tmpi.Pyrene.Services.ServiceModel
{
    public interface IDeleteByIdRequest<T>
    {
        T Id { get; set; }
    }
}
