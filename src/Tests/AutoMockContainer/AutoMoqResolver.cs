using Castle.Core;
using Castle.MicroKernel;
using Castle.MicroKernel.Context;
using Moq;

namespace Tests.AutoMockContainer
{
    public class AutoMoqResolver : ISubDependencyResolver
    {
        private readonly IKernel kernel;

        public AutoMoqResolver(IKernel kernel)
        {
            this.kernel = kernel;
        }

        public bool CanResolve(CreationContext context, ISubDependencyResolver contextHandlerResolver,
            ComponentModel model,
            DependencyModel dependency)
        {
            return dependency.TargetType.IsInterface;
        }

        public object Resolve(CreationContext context, ISubDependencyResolver contextHandlerResolver,
            ComponentModel model,
            DependencyModel dependency)
        {
            var mockType = typeof(Mock<>).MakeGenericType(dependency.TargetType);
            return ((Mock) this.kernel.Resolve(mockType)).Object;
        }
    }
}