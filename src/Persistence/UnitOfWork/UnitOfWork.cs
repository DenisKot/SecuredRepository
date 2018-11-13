using System;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using Core;

namespace Persistence.UnitOfWork
{
    internal class UnitOfWork : IUnitOfWork
    {
        private readonly AppDbContext context;

        private DbContextTransaction dbContextTransaction;
        private bool disposed = false;

        public UnitOfWork(AppDbContext context)
        {
            this.context = context;
        }

        public void BeginTransaction()
        {
            this.dbContextTransaction = this.context.Database.BeginTransaction(IsolationLevel.ReadCommitted);
        }

        public void EndTransaction()
        {
            if (this.dbContextTransaction != null)
            {
                this.dbContextTransaction.Commit();
                this.dbContextTransaction = null;
            }
        }

        public void Rollback()
        {
            if (this.dbContextTransaction != null)
            {
                this.dbContextTransaction.Rollback();
                this.dbContextTransaction = null;
            }
        }

        public void Complete()
        {
            if (!this.disposed)
            {
                var changed = context.ChangeTracker.Entries().Where(x => x.State == EntityState.Modified|| x.State == EntityState.Added).Select(x => x.Entity).ToList();
                this.context.SaveChanges();
            }
        }

        public async Task CompleteAsync()
        {
            if (!this.disposed)
            {
                await this.context.SaveChangesAsync();
            }
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();

                    if (this.dbContextTransaction != null)
                    {
                        this.dbContextTransaction.Commit();
                        this.dbContextTransaction.Dispose();
                        this.dbContextTransaction = null;
                    }
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}