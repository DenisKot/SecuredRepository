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
        public ActionResult Register(CustomPrincipalModel principialsModel)
        {
            var permissions = new List<Permission>();

            foreach (var permission in principialsModel.Permissions)
            {
                permissions.Add(new Permission
                {
                    Name = permission
                });
            }

            var user = new User
            {
                Name = principialsModel.Name,
                Permissions = permissions
            };

            this.userManager.Insert(user, true);
            principialsModel.Id = user.Id;

            var serializer = new JavaScriptSerializer();
            var userData = serializer.Serialize(principialsModel);

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

            return this.RedirectToAction("Index", "Home");
        }
    }
}