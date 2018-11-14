using System.Collections.Generic;

namespace SecuredPersistence.Models
{
    public class CustomPrincipalModel
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public IEnumerable<string> Permissions { get; set; }
    }
}