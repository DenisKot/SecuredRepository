using System.Web.Mvc;
using Application.Manager;
using Core.Domain;
using Moq;
using NUnit.Framework;
using SecuredPersistence.Controllers;

namespace Tests.Controllers.Employees.Impl
{
    [TestFixture]
    public class EditMethodEmployeeControllerTest : BaseMethodEmployeesControllerTest
    {
        [Test]
        public void GetNullTest()
        {
            this.GetMethodWithNullParameter(controller => controller.Edit((int?)null) as HttpStatusCodeResult);
        }

        [Test]
        public void GetNotFoundTest()
        {
            this.GetMethodNotFound(controller => controller.Edit(1) as HttpStatusCodeResult);
        }

        [Test]
        public void GetTest()
        {
            this.GetMethodWithFoundedEntity(controller => controller.Edit(1) as ViewResult);
        }

        [Test]
        public void PostNotValidTest()
        {
            var expectedEmployee = new Employee();
            this.PostNotValid(controller => controller.Edit(expectedEmployee) as ViewResult, expectedEmployee);
        }

        [Test]
        public void PostTest()
        {
            var expectedEmployee = new Employee();
            var mock = new Mock<IManager<Employee>>();
            var controller = new EmployeesController(mock.Object);

            var result = controller.Edit(expectedEmployee) as RedirectToRouteResult;

            mock.Verify(m => m.Update(It.Is<Employee>(x => x == expectedEmployee)), Times.Once);
            Assert.IsNotNull(result);
            Assert.AreEqual("Index", result.RouteValues["action"]);
        }
    }
}