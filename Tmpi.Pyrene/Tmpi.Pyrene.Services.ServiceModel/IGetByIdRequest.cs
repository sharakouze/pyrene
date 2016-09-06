namespace Tmpi.Pyrene.Services.ServiceModel
{
    public interface IGetByIdRequest<T>
    {
        T Id { get; set; }
    }
}
