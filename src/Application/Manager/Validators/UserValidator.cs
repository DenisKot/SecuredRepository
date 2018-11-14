using Core.Domain;
using Crosscutting;
using FluentValidation;

namespace Application.Manager.Validators
{
    public class UserValidator : AbstractValidator<User>
    {
        public UserValidator()
        {
            this.RuleFor(emp => emp.Name).NotEmpty().MaximumLength(StringLength.Normal);
        }
    }
}