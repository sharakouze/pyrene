namespace Tmpi.Pyrene.ServiceModel
{
    public interface IGetByIdRequest<T>
    {
        T Id { get; set; }
    }
}
