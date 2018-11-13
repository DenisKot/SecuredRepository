using System.ComponentModel.DataAnnotations;

namespace Core
{
    public abstract class BaseEntity
    {
        [Key]
        public int Id { get; set; }
    }
}