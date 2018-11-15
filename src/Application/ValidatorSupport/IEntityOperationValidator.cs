using Core;
using Crosscutting.Security;

namespace Application.ValidatorSupport
{
    public interface IEntityOperationValidator<TEntity>
        where TEntity : BaseEntity
    {
        void Validate(TEntity instance, EntityOperationType entityOperationType, bool ignorePermissions = false);

        void CheckPermission(EntityOperationType entityOperationType);
    }
}