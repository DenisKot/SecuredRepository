using System.Collections.Generic;
using System.Web.Mvc;
using Application.Manager;
using Core.Domain;
using Moq;
using NUnit.Framework;
using SecuredPersistence.Controllers;

namespace Tests.Controllers.Employees.Impl
{
    [TestFixture]
    public class ReadMethodEmployeeControllerTest : BaseMethodEmployeesControllerTest
    {
        [Test]
        public void IndexTest()
        {
            var list = new List<Employee>();
            var mock = new Mock<IManager<Employee>>();
            mock.Setup(m => m.GetAll()).Returns(list);
            var controller = new EmployeesController(mock.Object);

            var result = controller.Index() as ViewResult;

            Assert.IsNotNull(result);
            Assert.IsNotNull(result.Model);
            Assert.AreEqual(list, result.Model);
        }

        [Test]
        public void DetailsNullTest()
        {
            this.GetMethodWithNullParameter(controller => controller.Details(null) as HttpStatusCodeResult);
        }

        [Test]
        public void DetailsNotFoundTest()
        {
            this.GetMethodNotFound(controller => controller.Details(1) as HttpStatusCodeResult);
        }

        [Test]
        public void DetailsTest()
        {
            this.GetMethodWithFoundedEntity(controller => controller.Details(1) as ViewResult);
        }
    }
}