﻿using System;
using System.Threading.Tasks;
using System.Web.Mvc;
using Core;

namespace SecuredPersistence.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class UnitOfWorkMvcFilterAttribute : ActionFilterAttribute, IExceptionFilter
    {
        private readonly IUnitOfWork unitOfWork;

        public UnitOfWorkMvcFilterAttribute(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
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