using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Security;
using Application.Manager;
using Core.Domain;
using SecuredPersistence.Models;

namespace SecuredPersistence.Controllers
{
    public class AccountController : Controller
    {
        private readonly IManager<User> userManager;

        public AccountController(IManager<User> userManager)
        {
            this.userManager = userManager;
        }

        [HttpPost]
        public ActionResult Register(CustomPrincipalModel principalsModel)
        {
            var permissions = new List<Permission>();

            foreach (var permission in principalsModel.Permissions)
            {
                permissions.Add(new Permission
                {
                    Name = permission
                });
            }

            var user = new User
            {
                Name = principalsModel.Name,
                Permissions = permissions
            };

            this.userManager.IgnorePermissions = true;
            this.userManager.Insert(user);
            principalsModel.Id = user.Id;

            var serializer = new JavaScriptSerializer();
            var userData = serializer.Serialize(principalsModel);

            FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(
                1,
                user.Name,
                DateTime.Now,
                DateTime.Now.AddMinutes(15),
                false,
                userData);

            string encTicket = FormsAuthentication.Encrypt(authTicket);
            HttpCookie faCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
            this.Response.Cookies.Add(faCookie);

            CustomPrincipal newUser = new CustomPrincipal(authTicket.Name)
            {
                Id = principalsModel.Id,
                Name = principalsModel.Name,
                Permissions = principalsModel.Permissions
            };

            System.Web.HttpContext.Current.User = newUser;

            return this.RedirectToAction("Index", "Employees");
        }
    }
}