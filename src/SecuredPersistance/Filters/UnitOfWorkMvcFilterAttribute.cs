using System;
using System.Threading.Tasks;
using System.Web.Mvc;
using Core;
using SimpleInjector;

namespace SecuredPersistence.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class UnitOfWorkMvcFilterAttribute : ActionFilterAttribute, IExceptionFilter
    {
        private IUnitOfWork unitOfWork => this.container.GetInstance<IUnitOfWork>();
        private readonly Container container;

        public UnitOfWorkMvcFilterAttribute(Container container)
        {
            this.container = container;
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            this.unitOfWork.BeginTransaction();
            base.OnActionExecuting(filterContext);
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            this.unitOfWork.Complete();
            this.unitOfWork.EndTransaction();
            base.OnActionExecuted(filterContext);
        }

        public void OnException(ExceptionContext filterContext)
        {
            this.unitOfWork.Rollback();
        }
    }
}