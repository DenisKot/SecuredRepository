using System.Web.Mvc;
using Application.Manager;
using Core.Domain;
using Moq;
using NUnit.Framework;
using SecuredPersistence.Controllers;

namespace Tests.Controllers.Employees.Impl
{
    [TestFixture]
    public class CreateMethodEmployeeControllerTest : BaseMethodEmployeesControllerTest
    {
        [Test]
        public void CreateViewTest()
        {
            var mock = new Mock<IManager<Employee>>();
            var controller = new EmployeesController(mock.Object);

            var result = controller.Create() as ViewResult;

            Assert.IsNotNull(result);
        }

        [Test]
        public void CreateNotValidTest()
        {
            var expectedEmployee = new Employee();
            this.PostNotValid(controller => controller.Create(expectedEmployee) as ViewResult, expectedEmployee);
        }

        [Test]
        public void CreateTest()
        {
            var expectedEmployee = new Employee();
            var mock = new Mock<IManager<Employee>>();
            var controller = new EmployeesController(mock.Object);

            var result = controller.Create(expectedEmployee) as RedirectToRouteResult;

            mock.Verify(m => m.Insert(It.Is<Employee>(x => x == expectedEmployee)), Times.Once);
            Assert.IsNotNull(result);
            Assert.AreEqual("Index", result.RouteValues["action"]);
        }
    }
}