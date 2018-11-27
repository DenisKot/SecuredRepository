using Application.Manager;
using Core.Domain;
using Moq;
using SecuredPersistence.Controllers;
using Tests.SutBuilder.TestStructure;

namespace Tests.FixtureObject
{
    internal class EmployeesControllerFixture
    {
        internal IManager<Employee> employeeManager;

        public EmployeesControllerFixture()
        {
            this.employeeManager = new Mock<IManager<Employee>>().Object;
        }

        public EmployeesController CreateSut()
        {
            return new EmployeesController(this.employeeManager);
        }
    }
}