namespace Tmpi.Pyrene.Infrastructure
{
    public interface IDeleteByIdRequest<T>
    {
        T Id { get; set; }
    }
}
