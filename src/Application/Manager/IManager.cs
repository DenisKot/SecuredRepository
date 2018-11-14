using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Core;

namespace Application.Manager
{
    public interface IManager<TEntity>
        where TEntity: BaseEntity
    {
        TEntity Insert(TEntity instance, bool ignorePermissions = false);
        IEnumerable<TEntity> GetAll();
        TEntity GetById(object id);
        void Delete(object id);
        void Update(TEntity entityToUpdate);

        IEnumerable<TEntity> Get(
            Expression<Func<TEntity, bool>> filter = null,
            Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
            string includeProperties = "");
    }
}