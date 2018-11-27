using Castle.Windsor;
using Core;
using Moq;
using NUnit.Framework;
using SecuredPersistence.Controllers;

namespace Tests.AutoMockContainer
{
    public class AutoMockTest
    {
        [Test]
        public void Test()
        {
            var container = new WindsorContainer().Install(new AutoMoqInstaller());
            var sut = container.Resolve<HomeController>();

            var result = sut.Index();

            Assert.IsNotNull(result);
            container.Resolve<Mock<IUserSession>>().Verify(x => x.Id);
        }
    }
}