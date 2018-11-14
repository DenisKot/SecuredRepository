using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Application.ValidatorSupport;
using Core;
using Crosscutting.Security;

namespace Application.Manager
{
    public class Manager<TEntity> : IManager<TEntity>
        where TEntity : BaseEntity
    {
        private readonly IValidatorSupport<TEntity> validator;
        private readonly IRepository<TEntity> repository;
        private readonly IUnitOfWork unitOfWork;

        public Manager(IValidatorSupport<TEntity> validator, IRepository<TEntity> repository, IUnitOfWork unitOfWork)
        {
            this.validator = validator;
            this.repository = repository;
            this.unitOfWork = unitOfWork;
        }

        public TEntity Insert(TEntity instance, bool ignorePermissions = false)
        {
            this.validator.Validate(instance, EntityOperationType.Create, ignorePermissions);
            this.repository.Insert(instance);
            this.unitOfWork.SaveChanges();

            return instance;
        }

        public IEnumerable<TEntity> GetAll()
        {
            this.validator.CheckPermission(EntityOperationType.Read);
            return this.repository.Get();
        }

        public TEntity GetById(object id)
        {
            this.validator.CheckPermission(EntityOperationType.Read);
            return this.repository.GetById(id);
        }

        public void Delete(object id)
        {
            this.validator.CheckPermission(EntityOperationType.Delete);
            this.repository.Delete(id);
        }

        public void Update(TEntity entityToUpdate)
        {
            this.validator.Validate(entityToUpdate, EntityOperationType.Update);
            this.repository.Update(entityToUpdate);
        }

        public IEnumerable<TEntity> Get(Expression<Func<TEntity, bool>> filter = null, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null, string includeProperties = "")
        {
            this.validator.CheckPermission(EntityOperationType.Read);
            return this.repository.Get(filter, orderBy, includeProperties);
        }
    }
}