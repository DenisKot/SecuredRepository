using System.Configuration;
using Effort;
using NUnit.Framework;
using Persistence;

namespace Tests
{
    public class BaseTest
    {
        protected AppDbContext context;
        
        [OneTimeSetUp]
        public void Init()
        {
            //var connection = EntityConnectionFactory.CreateTransient("Default");
            var connection = DbConnectionFactory.CreateTransient();
            this.context = new AppDbContext(connection);
            this.context.Database.CreateIfNotExists();
        }

        [OneTimeTearDown]
        public void Dispose()
        {
            context.Dispose();
        }
    }
}