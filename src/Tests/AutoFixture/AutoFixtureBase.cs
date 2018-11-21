using AutoFixture;
using AutoFixture.NUnit3;
using Core.Domain;
using NUnit.Framework;

namespace Tests.AutoFixture
{
    [TestFixture]
    public class AutoFixtureBase
    {
        private readonly Fixture fixture;

        public AutoFixtureBase()
        {
            this.fixture = new Fixture();
        }

        [Test]
        public void NumberTest()
        {
            var randomNumber = this.fixture.Create<int>();
            Assert.Greater(randomNumber, 0);
        }

        [Test]
        public void StringTest()
        {
            var randomString = this.fixture.Create<string>();
            Assert.IsNotNull(randomString);
        }

        [Test]
        public void ObjectTest()
        {
            var employee = this.fixture.Build<Employee>()
                .With(x => x.SecondName, "SecondName")
                .Without(x => x.Surname)
                .Create();

            Assert.IsNotNull(employee);
            Assert.Greater(employee.Id, 0);
            Assert.IsNotNull(employee.FirstName);
            Assert.AreEqual("SecondName", employee.SecondName);
            Assert.IsNull(employee.Surname);
        }

        [Test, Theory, AutoData]
        public void InjectPrimitivesTest(int randInt, string randText, Employee randEmployee)
        {
            Assert.Greater(randInt, 0);

            Assert.IsNotNull(randText);

            Assert.IsNotNull(randEmployee);
            Assert.Greater(randEmployee.Id, 0);
            Assert.IsNotNull(randEmployee.FirstName);
        }

        [Test, Theory]
        [InlineAutoData(12)]
        [InlineAutoData(53, "ok")]
        public void InjectDefinedTest(int integer, string text)
        {
            Assert.IsTrue(integer == 12 || integer == 53);
            Assert.IsTrue(integer == 12 || integer == 53 && text == "ok");
        }
    }
}