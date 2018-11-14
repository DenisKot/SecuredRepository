using System.Collections.Generic;
using System.Security.Principal;

namespace SecuredPersistence.Models
{
    interface ICustomPrincipal : IPrincipal
    {
        int Id { get; set; }
        string Name { get; set; }
        IEnumerable<string> Permissions { get; set; }
    }
}