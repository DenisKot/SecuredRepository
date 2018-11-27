using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using Moq;
using SecuredPersistence.Controllers;

namespace Tests.AutoMockContainer
{
    public class AutoMoqInstaller : IWindsorInstaller
    {
        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
            container.Kernel.Resolver.AddSubResolver(
                new AutoMoqResolver(container.Kernel));
            container.Register(Component.For(typeof(Mock<>)));

            container.Register(Classes.FromAssemblyContaining<HomeController>()
                .Pick()
                .WithServiceSelf()
                .LifestyleTransient()
            );
        }
    }
}