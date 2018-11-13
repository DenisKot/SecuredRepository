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
        void Insert(TEntity instance);
        IEnumerable<TEntity> GetAll();
        TEntity GetById(object id);
        void Delete(object id);
        void Update(TEntity entityToUpdate);
    }
}