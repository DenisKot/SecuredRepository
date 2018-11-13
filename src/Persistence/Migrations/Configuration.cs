using Core.Domain;

namespace Persistence.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<Persistence.AppDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(Persistence.AppDbContext context)
        {
            context.Employees.Add(new Employee
            {
                FirstName = "Denys",
                SecondName = "Kotenko",
                Surname = "Valentinovich"
            });

            context.Employees.Add(new Employee
            {
                FirstName = "Vasya",
                SecondName = "Pupkin",
                Surname = "Viktorovich"
            });

            context.SaveChanges();
        }
    }
}
