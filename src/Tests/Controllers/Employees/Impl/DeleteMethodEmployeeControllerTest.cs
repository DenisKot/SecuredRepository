using System.Web.Mvc;
using Application.Manager;
using Core.Domain;
using Moq;
using NUnit.Framework;
using SecuredPersistence.Controllers;

namespace Tests.Controllers.Employees.Impl
{
    [TestFixture]
    public class DeleteMethodEmployeeControllerTest : BaseMethodEmployeesControllerTest
    {
        [Test]
        public void GetNullTest()
        {
            this.GetMethodWithNullParameter(controller => controller.Delete(null) as HttpStatusCodeResult);
        }

        [Test]
        public void GetNotFoundTest()
        {
            this.GetMethodNotFound(controller => controller.Delete(1) as HttpStatusCodeResult);
        }

        [Test]
        public void GetTest()
        {
            this.GetMethodWithFoundedEntity(controller => controller.Delete(1) as ViewResult);
        }

        [Test]
        public void PostDeleteConfirmedTest()
        {
            var mock = new Mock<IManager<Employee>>();
            var controller = new EmployeesController(mock.Object);

            var result = controller.DeleteConfirmed(1) as RedirectToRouteResult;

            mock.Verify(m => m.Delete(It.Is<int>(x => x == 1)), Times.Once);
            Assert.IsNotNull(result);
            Assert.AreEqual("Index", result.RouteValues["action"]);
        }
    }
}