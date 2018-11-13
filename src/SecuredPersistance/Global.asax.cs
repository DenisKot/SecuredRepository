using System.Reflection;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using SecuredPersistance;
using SecuredPersistence.App_Start;
using SecuredPersistence.Filters;
using SimpleInjector;
using SimpleInjector.Integration.Web;
using SimpleInjector.Integration.Web.Mvc;

namespace SecuredPersistence
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            var container = SimpleInjectorInitializer.Initialize();

            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            //GlobalConfiguration.Configuration.Filters.Add(new UnitOfWorkApiFilterAttribute(container.GetInstance<IUnitOfWork>()));
            //GlobalConfiguration.Configuration.Filters.Add(new UnitOfWorkMvcActionFilter(container.GetInstance<IUnitOfWork>()));
            GlobalFilters.Filters.Add(container.GetInstance<UnitOfWorkMvcFilterAttribute>());
            GlobalFilters.Filters.Add(new ExceptionFilterAttribute());
        }
    }
}
