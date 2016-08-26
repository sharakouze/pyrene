namespace Tmpi.Pyrene.ServiceModel.Messages
{
    public interface IGetByIdRequest<T>
    {
        T Id { get; set; }
    }
}
