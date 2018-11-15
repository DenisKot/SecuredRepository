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
        private readonly IEntityOperationValidator<TEntity> entityOperationValidator;
        private readonly IRepository<TEntity> repository;
        private readonly IUnitOfWork unitOfWork;

        public Manager(IEntityOperationValidator<TEntity> entityOperationValidator, IRepository<TEntity> repository, IUnitOfWork unitOfWork)
        {
            this.entityOperationValidator = entityOperationValidator;
            this.repository = repository;
            this.unitOfWork = unitOfWork;
        }

        public bool IgnorePermissions { get; set; } = false;

        public TEntity Insert(TEntity instance)
        {
            this.entityOperationValidator.Validate(instance, EntityOperationType.Create, this.IgnorePermissions);
            this.repository.Insert(instance);
            this.unitOfWork.SaveChanges();

            return instance;
        }

        public IEnumerable<TEntity> GetAll()
        {
            this.entityOperationValidator.CheckPermission(EntityOperationType.Read);
            return this.repository.Get();
        }

        public TEntity GetById(object id)
        {
            this.entityOperationValidator.CheckPermission(EntityOperationType.Read);
            return this.repository.GetById(id);
        }

        public void Delete(object id)
        {
            this.entityOperationValidator.CheckPermission(EntityOperationType.Delete);
            this.repository.Delete(id);
        }

        public void Update(TEntity entityToUpdate)
        {
            this.entityOperationValidator.Validate(entityToUpdate, EntityOperationType.Update);
            this.repository.Update(entityToUpdate);
        }

        public IEnumerable<TEntity> Get(Expression<Func<TEntity, bool>> filter = null, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null, string includeProperties = "")
        {
            this.entityOperationValidator.CheckPermission(EntityOperationType.Read);
            return this.repository.Get(filter, orderBy, includeProperties);
        }
    }
}