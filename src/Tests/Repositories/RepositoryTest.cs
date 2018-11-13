using System.Linq;
using Core.Domain;
using NUnit.Framework;
using Persistence.Repository;

namespace Tests.Repositories
{
    [TestFixture]
    public class RepositoryTest : BaseTest
    {
        [Test]
        public void InsertTest()
        {
            var count = this.context.Employees.Count();
            var repository = new Repository<Employee>(this.context);
            var employee = new Employee
            {
                FirstName = "FirstName",
                SecondName = "SecondName",
                Surname = "Surname"
            };

            repository.Insert(employee);
            this.context.SaveChanges();

            Assert.AreEqual(count + 1, this.context.Employees.Count());
        }

        [Test]
        public void UpdateTest()
        {
            var count = this.context.Employees.Count();
            var repository = new Repository<Employee>(this.context);
            var nameAfterChange = "Changed First Name";
            var employee = new Employee
            {
                FirstName = "FirstName",
                SecondName = "SecondName",
                Surname = "Surname"
            };

            repository.Insert(employee);
            this.context.SaveChanges();
            employee.FirstName = nameAfterChange;
            repository.Update(employee);
            this.context.SaveChanges();

            Assert.AreEqual(nameAfterChange, this.context.Employees.OrderBy(x => x.Id).Skip(count).First().FirstName);
        }
    }
}