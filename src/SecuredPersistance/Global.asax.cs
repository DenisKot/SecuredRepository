using System;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Script.Serialization;
using System.Web.Security;
using SecuredPersistance;
using SecuredPersistence.App_Start;
using SecuredPersistence.Models;

namespace SecuredPersistence
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            SimpleInjectorInitializer.Initialize();

            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_PostAuthenticateRequest(Object sender, EventArgs e)
        {
            HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];

            if (authCookie != null)
            {
                try
                {
                    this.SetCurrentUser(authCookie);
                }
                catch
                {
                    // ignored
                }
            }
        }

        private void SetCurrentUser(HttpCookie authCookie)
        {
            FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie.Value);

            JavaScriptSerializer serializer = new JavaScriptSerializer();

            CustomPrincipalModel serializeModel = serializer.Deserialize<CustomPrincipalModel>(authTicket.UserData);

            CustomPrincipal newUser = new CustomPrincipal(authTicket.Name);
            newUser.Id = serializeModel.Id;
            newUser.Name = serializeModel.Name;
            newUser.Permissions = serializeModel.Permissions;

            HttpContext.Current.User = newUser;
        }
    }
}
