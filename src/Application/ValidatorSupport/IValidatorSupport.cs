using Core;

namespace Application.ValidatorSupport
{
    public interface IValidatorSupport<TEntity>
        where TEntity : BaseEntity
    {
        void Validate(TEntity instance);
    }
}