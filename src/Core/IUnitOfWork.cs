using System;
using System.Threading.Tasks;

namespace Core
{
    public interface IUnitOfWork : IDisposable
    {
        void BeginTransaction();
        void EndTransaction();
        void Rollback();
        void Complete();
        Task CompleteAsync();
    }
}