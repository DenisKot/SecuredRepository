using System.Web.Mvc;
using Application.Manager;
using Core.Domain;

namespace SecuredPersistence.Controllers
{
    public class HomeController : Controller
    {
        private readonly IManager<Employee> manager;

        public HomeController(IManager<Employee> manager)
        {
        }

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