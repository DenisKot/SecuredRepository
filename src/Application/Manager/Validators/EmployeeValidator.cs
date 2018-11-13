using Core.Domain;
using Crosscutting;
using FluentValidation;

namespace Application.Manager.Validators
{
    public class EmployeeValidator : AbstractValidator<Employee>
    {
        public EmployeeValidator()
        {
            this.RuleFor(emp => emp.FirstName).NotEmpty().MaximumLength(StringLength.Normal);
            this.RuleFor(emp => emp.SecondName).NotEmpty().MaximumLength(StringLength.Normal);
            this.RuleFor(emp => emp.Surname).MaximumLength(StringLength.Normal);
        }
    }
}