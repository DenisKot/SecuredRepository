using System.Collections.Generic;

namespace Core
{
    public interface IUserSession
    {
        int? Id { get; }
        IEnumerable<string> Permissions { get; }
    }
}