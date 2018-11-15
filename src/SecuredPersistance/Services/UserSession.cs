using System.Collections.Generic;
using System.Web;
using Core;
using SecuredPersistence.Models;

namespace SecuredPersistence.Services
{
    internal class UserSession : IUserSession
    {
        public int? Id => (HttpContext.Current.User as CustomPrincipal)?.Id;
        public IEnumerable<string> Permissions => (HttpContext.Current.User as CustomPrincipal)?.Permissions ?? new List<string>();
    }
}