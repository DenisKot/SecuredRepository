using System.Web.Mvc;

namespace SecuredPersistence.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
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
    }
}