using Core.Domain;

namespace Tests.EntityBuilder
{
    internal class EmployeeBuilder
    {
        private string firstName;
        private string secondName;
        private string surname;

        public EmployeeBuilder()
        {
            this.firstName = "Denys";
            this.secondName = "Kotenko";
            this.surname = "Valentinovich";
        }

        public EmployeeBuilder WithFirstName(string firstName)
        {
            this.firstName = firstName;
            return this;
        }

        public EmployeeBuilder WithSecondName(string secondName)
        {
            this.secondName = secondName;
            return this;
        }

        public EmployeeBuilder WithSurname(string surname)
        {
            this.surname = surname;
            return this;
        }

        public Employee Build()
        {
            return new Employee
            {
                FirstName = this.firstName,
                SecondName = this.secondName,
                Surname = this.surname
            };
        }

        public static implicit operator Employee(EmployeeBuilder builder)
        {
            return builder.Build();
        }
    }
}