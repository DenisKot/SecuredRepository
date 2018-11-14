using Core;
using Crosscutting.Security;

namespace Application.ValidatorSupport
{
    public interface IValidatorSupport<TEntity>
        where TEntity : BaseEntity
    {
        void Validate(TEntity instance, EntityOperationType entityOperationType, bool ignorePermissions = false);

        void CheckPermission(EntityOperationType entityOperationType);
    }
}