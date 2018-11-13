using Application.Manager;
using Core;
using Core.Domain;

[assembly: WebActivator.PostApplicationStartMethod(typeof(SecuredPersistence.App_Start.SimpleInjectorInitializer), "Initialize")]

namespace SecuredPersistence.App_Start
{
    using System.Reflection;
    using System.Web.Http;
    using System.Web.Mvc;
    using Application;
    using SecuredPersistence.Filters;
    using SimpleInjector;
    using SimpleInjector.Integration.Web;
    using SimpleInjector.Integration.Web.Mvc;
    
    public static class SimpleInjectorInitializer
    {
        public static Container Initialize()
        {
            var container = new Container();
            container.Options.DefaultScopedLifestyle = new WebRequestLifestyle();
            
            InitializeContainer(container);

            container.RegisterMvcControllers(Assembly.GetExecutingAssembly());

            container.Verify();

            DependencyResolver.SetResolver(new SimpleInjectorDependencyResolver(container));

            return container;
        }
     
        private static void InitializeContainer(Container container)
        {
            ApplicationModule.Configure(container);

            container.Register<UnitOfWorkMvcFilterAttribute>(Lifestyle.Transient);
        }
    }
}