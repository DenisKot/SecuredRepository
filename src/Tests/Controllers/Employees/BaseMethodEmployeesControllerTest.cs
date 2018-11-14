using System;
using System.Net;
using System.Web.Mvc;
using Application.Manager;
using Core.Domain;
using Moq;
using NUnit.Framework;
using SecuredPersistence.Controllers;

namespace Tests.Controllers.Employees
{
    public abstract class BaseMethodEmployeesControllerTest
    {
        protected void GetMethodWithNullParameter(Func<EmployeesController, HttpStatusCodeResult> func)
        {
            var mock = new Mock<IManager<Employee>>();
            var controller = new EmployeesController(mock.Object);
            var expected = (int)HttpStatusCode.BadRequest;

            var result = func(controller);

            Assert.IsNotNull(result);
            Assert.AreEqual(expected, result.StatusCode);
        }

        protected void GetMethodNotFound(Func<EmployeesController, HttpStatusCodeResult> func)
        {
            var mock = new Mock<IManager<Employee>>();
            mock.Setup(m => m.GetById(It.IsAny<int>())).Returns<Employee>(null);
            var controller = new EmployeesController(mock.Object);
            var expected = (int)HttpStatusCode.NotFound;

            var result = func(controller);

            Assert.IsNotNull(result);
            Assert.AreEqual(expected, result.StatusCode);
        }

        protected void GetMethodWithFoundedEntity(Func<EmployeesController, ViewResult> func)
        {
            var expectedEmployee = new Employee();
            var mock = new Mock<IManager<Employee>>();
            mock.Setup(m => m.GetById(It.Is<int>(x => x == 1))).Returns(expectedEmployee);
            var controller = new EmployeesController(mock.Object);

            var result = func(controller) as ViewResult;

            Assert.IsNotNull(result);
            Assert.AreEqual(expectedEmployee, result.Model);
        }

        protected void PostNotValid(Func<EmployeesController, ViewResult> func, Employee expectedEmployee)
        {
            var mock = new Mock<IManager<Employee>>();
            var controller = new EmployeesController(mock.Object);
            controller.ModelState.AddModelError("test", "test");

            var result = func(controller);

            Assert.IsNotNull(result);
            Assert.AreEqual(expectedEmployee, result.Model);
        }
    }
}