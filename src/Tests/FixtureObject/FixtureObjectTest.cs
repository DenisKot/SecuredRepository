using NUnit.Framework;

namespace Tests.FixtureObject
{
    public class FixtureObjectTest
    {
        [Test]
        public void TestFixture()
        {
            var fixture = new EmployeesControllerFixture();
            var sut = fixture.CreateSut();

            var result = sut.Index();

            Assert.IsNotNull(result);
            fixture.employeeManager.AsMock().Verify(x => x.GetAll());
        }
    }
}