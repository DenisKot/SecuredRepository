using System.Data.Common;
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

        public AppDbContext(DbConnection connection) : base(connection, true)
        {
        }

        public DbSet<Employee> Employees { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Permission> Permissions { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Employee>().Property(e => e.FirstName).HasMaxLength(StringLength.Normal).IsRequired();
            modelBuilder.Entity<Employee>().Property(e => e.SecondName).HasMaxLength(StringLength.Normal).IsRequired();
            modelBuilder.Entity<Employee>().Property(e => e.Surname).HasMaxLength(StringLength.Normal);

            modelBuilder.Entity<User>().Property(e => e.Name).HasMaxLength(StringLength.Normal).IsRequired();
            modelBuilder.Entity<Permission>().HasRequired(x => x.User).WithMany(u => u.Permissions);
        }
    }
}