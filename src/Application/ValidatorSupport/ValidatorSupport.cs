using System;
using System.Text;
using Application.Exception;
using Core;
using FluentValidation;

namespace Application.ValidatorSupport
{
    internal class ValidatorSupport<TEntity> : IValidatorSupport<TEntity>
        where TEntity: BaseEntity
    {
        private readonly IValidator<TEntity> validator;

        public ValidatorSupport(IValidator<TEntity> validator)
        {
            this.validator = validator;
        }

        public void Validate(TEntity instance)
        {
            var result = this.validator.Validate(instance);
            if (!result.IsValid)
            {
                var sb = new StringBuilder();
                foreach (var failure in result.Errors)
                {
                    Console.WriteLine("Property " + failure.PropertyName + " failed validation. Error was: " + failure.ErrorMessage);
                }

                throw new AppValidationException(sb.ToString());
            }
        }
    }
}