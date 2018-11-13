using System.Data.Entity;
using Core.Domain;
using Crosscutting;

namespace Persistence
{
    public class AppDbContext : DbContext
    {
        public AppDbContext() : base("Default")
        {
        }

        public DbSet<Employee> Employees { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Employee>().Property(e => e.FirstName).HasMaxLength(StringLength.Normal).IsRequired();
            modelBuilder.Entity<Employee>().Property(e => e.SecondName).HasMaxLength(StringLength.Normal).IsRequired();
            modelBuilder.Entity<Employee>().Property(e => e.Surname).HasMaxLength(StringLength.Normal);
        }
    }
}