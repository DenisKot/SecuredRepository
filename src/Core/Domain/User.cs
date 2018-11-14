using System.Collections.Generic;

namespace Core.Domain
{
    public class User : BaseEntity
    {
        public User()
        {
            this.Permissions = new HashSet<Permission>();
        }

        public string Name { get; set; }

        public ICollection<Permission> Permissions { get; set; }
    }
}