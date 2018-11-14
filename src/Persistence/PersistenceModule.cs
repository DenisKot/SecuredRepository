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
            container.Register<AppDbContext>(() => new AppDbContext(), new WebRequestLifestyle());
            container.Register<IUnitOfWork, UnitOfWork.UnitOfWork>(new WebRequestLifestyle());

            container.Register<IRepository<Employee>, Repository<Employee>>();
            container.Register<IRepository<Permission>, Repository<Permission>>();
            container.Register<IRepository<User>, Repository<User>>();

            //Assembly[] assemblies = new[] { typeof(Repository<>).Assembly };

            //container.Register(typeof(IRepository<>), assemblies);
        }
    }
}