using System;
using System.Linq;
using System.Text;
using Application.Exception;
using Core;
using Crosscutting.Security;
using FluentValidation;

namespace Application.ValidatorSupport
{
    internal class EntityOperationEntityOperationValidator<TEntity> : IEntityOperationValidator<TEntity>
        where TEntity: BaseEntity
    {
        private readonly IValidator<TEntity> validator;
        private readonly IUserSession userSession;

        public EntityOperationEntityOperationValidator(IValidator<TEntity> validator, IUserSession userSession)
        {
            this.validator = validator;
            this.userSession = userSession;
        }

        public void Validate(TEntity instance, EntityOperationType entityOperationType, bool ignorePermissions = false)
        {
            if (!ignorePermissions)
            {
                this.CheckPermission(entityOperationType);
            }

            var result = this.validator.Validate(instance);
            if (!result.IsValid)
            {
                var sb = new StringBuilder();
                foreach (var failure in result.Errors)
                {
                    sb.AppendLine("Property " + failure.PropertyName + " failed validation. Error was: " + failure.ErrorMessage);
                }

                throw new AppValidationException(sb.ToString());
            }
        }

        public void CheckPermission(EntityOperationType entityOperationType)
        {
            var entityName = typeof(TEntity).Name;
            var permission = $"{entityName}.{entityOperationType}";

            if (!userSession.Permissions.Contains(permission))
            {
                var message = $"You have no permissions for operation {entityOperationType} of {entityName} entity";
                throw new AppValidationException(message);
            }
        }
    }
}