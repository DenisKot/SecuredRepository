using System.Collections.Generic;
using System.Web.Mvc;
using Core;
using Core.Domain;
using Crosscutting.Security;

namespace SecuredPersistence.Controllers
{
    public class HomeController : Controller
    {
        private readonly IUserSession userSession;

        public HomeController(IUserSession userSession)
        {
            this.userSession = userSession;
        }

        public ActionResult Index()
        {
            this.ViewBag.Permissions = this.GetPermissions();
            this.ViewBag.IsAuthorized = this.userSession.Id.HasValue;

            return this.View();
        }

        public ActionResult About()
        {
            this.ViewBag.Message = "Your application description page.";

            return this.View();
        }

        public ActionResult List()
        {
            return this.View();
        }

        private IList<SelectListItem> GetPermissions()
        {
            var nameOfEntity = nameof(Employee);
            return new List<SelectListItem>
            {
                new SelectListItem {Text = $"{nameOfEntity} {EntityOperationType.Create}", Value = $"{nameOfEntity}.{EntityOperationType.Create}"},
                new SelectListItem {Text = $"{nameOfEntity} {EntityOperationType.Read}", Value = $"{nameOfEntity}.{EntityOperationType.Read}"},
                new SelectListItem {Text = $"{nameOfEntity} {EntityOperationType.Delete}", Value = $"{nameOfEntity}.{EntityOperationType.Delete}"},
                new SelectListItem {Text = $"{nameOfEntity} {EntityOperationType.Update}", Value = $"{nameOfEntity}.{EntityOperationType.Update}"},
            };
        }
    }
}