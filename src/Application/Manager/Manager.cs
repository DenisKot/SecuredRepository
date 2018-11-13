using System.Collections.Generic;
using Application.ValidatorSupport;
using Core;

namespace Application.Manager
{
    public class Manager<TEntity> : IManager<TEntity>
        where TEntity : BaseEntity
    {
        private readonly IValidatorSupport<TEntity> validator;
        private readonly IRepository<TEntity> repository;

        public Manager(IValidatorSupport<TEntity> validator, IRepository<TEntity> repository)
        {
            this.validator = validator;
            this.repository = repository;
        }

        public void Insert(TEntity instance)
        {
            this.validator.Validate(instance);
            this.repository.Insert(instance);
        }

        public IEnumerable<TEntity> GetAll()
        {
            return this.repository.Get();
        }

        public TEntity GetById(object id)
        {
            return this.repository.GetById(id);
        }

        public void Delete(object id)
        {
            this.repository.Delete(id);
        }

        public void Update(TEntity entityToUpdate)
        {
            this.repository.Update(entityToUpdate);
        }
    }
}