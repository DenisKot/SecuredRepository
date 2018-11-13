using System.Reflection;
using Core;
using Core.Domain;
using Persistence.Repository;
using SimpleInjector;
using SimpleInjector.Integration.Web;

namespace Persistence
{
    public class PersistenceModule
    {
        public static void Configure(Container container)
        {
            container.Register<AppDbContext>();
            container.Register<IUnitOfWork, UnitOfWork.UnitOfWork>();

            container.Register<IRepository<Employee>, Repository<Employee>>();

            //Assembly[] assemblies = new[] { typeof(Repository<>).Assembly };

            //container.Register(typeof(IRepository<>), assemblies);
        }
    }
}