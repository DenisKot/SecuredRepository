using System.Web.Mvc;
using Core;

namespace SecuredPersistence.Filters
{
    public class UnitOfWorkMvcActionFilter : IActionFilter
    {
        private readonly IUnitOfWork unitOfWork;

        public UnitOfWorkMvcActionFilter(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }

        public void OnActionExecuting(ActionExecutingContext filterContext)
        {
            this.unitOfWork.BeginTransaction();
        }

        public void OnActionExecuted(ActionExecutedContext filterContext)
        {
            this.unitOfWork.SaveChanges();
            this.unitOfWork.EndTransaction();
        }
    }
}