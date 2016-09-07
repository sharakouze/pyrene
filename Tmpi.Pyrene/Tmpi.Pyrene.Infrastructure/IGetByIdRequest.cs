namespace Tmpi.Pyrene.Infrastructure
{
    public interface IGetByIdRequest<T>
    {
        T Id { get; set; }
    }
}
