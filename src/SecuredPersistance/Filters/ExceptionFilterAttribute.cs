
using System.Web.Mvc;
using Application.Exception;

namespace SecuredPersistence.Filters
{
    public class ExceptionFilterAttribute : IExceptionFilter
    {
        public void OnException(ExceptionContext filterContext)
        {
            if (filterContext.Exception is AppValidationException)
            {
                var exception = filterContext.Exception as AppValidationException;
                var contentResult = new ContentResult();
                contentResult.Content = $"Validation Error! Details: {exception.Message}";

                filterContext.Result = contentResult;
                filterContext.ExceptionHandled = true;
            }
        }
    }
}