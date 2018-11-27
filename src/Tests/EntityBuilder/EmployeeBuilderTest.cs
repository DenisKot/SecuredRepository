using Core.Domain;
using NUnit.Framework;

namespace Tests.EntityBuilder
{
    [TestFixture]
    public class EmployeeBuilderTest
    {
        [Test]
        public void EmployeeBuilderPropertiesTest()
        {
            var firstName = "SomeName";
            var secondName = "SomeSecondName";
            var surname = "SomeSurname";

            Employee employee = new EmployeeBuilder()
                .WithFirstName(firstName)
                .WithSecondName(secondName)
                .WithSurname(surname);

            Assert.AreEqual(firstName, employee.FirstName);
            Assert.AreEqual(secondName, employee.SecondName);
            Assert.AreEqual(surname, employee.Surname);
        }
    }
}