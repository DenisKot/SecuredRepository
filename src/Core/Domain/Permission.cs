namespace Core.Domain
{
    public class Permission : BaseEntity
    {
        public virtual User User { get; set; }

        public string Name { get; set; }
    }
}