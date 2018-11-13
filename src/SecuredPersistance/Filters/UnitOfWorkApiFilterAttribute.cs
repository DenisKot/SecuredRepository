using System;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using Core;

namespace SecuredPersistence.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class UnitOfWorkApiFilterAttribute : ActionFilterAttribute, IExceptionFilter
    {
        private readonly IUnitOfWork unitOfWork;

        public UnitOfWorkApiFilterAttribute(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }

        public bool AllowMultiple { get; }

        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            this.unitOfWork.BeginTransaction();
            base.OnActionExecuting(actionContext);
        }

        public override Task OnActionExecutingAsync(HttpActionContext actionContext, CancellationToken cancellationToken)
        {
            this.unitOfWork.BeginTransaction();
            return base.OnActionExecutingAsync(actionContext, cancellationToken);
        }

        public override void OnActionExecuted(HttpActionExecutedContext actionExecutedContext)
        {
            this.unitOfWork.Complete();
            this.unitOfWork.EndTransaction();
            base.OnActionExecuted(actionExecutedContext);
        }

        public override Task OnActionExecutedAsync(HttpActionExecutedContext actionExecutedContext, CancellationToken cancellationToken)
        {
            this.unitOfWork.CompleteAsync();
            this.unitOfWork.EndTransaction();
            return base.OnActionExecutedAsync(actionExecutedContext, cancellationToken);
        }

        public Task ExecuteExceptionFilterAsync(HttpActionExecutedContext actionExecutedContext, CancellationToken cancellationToken)
        {
            // ToDo: Add logging and exception handling

            unitOfWork.Rollback();
            return Task.Run(() => { }, cancellationToken);
        }
    }
}