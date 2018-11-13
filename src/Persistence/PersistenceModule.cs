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

            //Assembly[] assemblies = new[] { typeof(Repository<>).Assembly };

            //container.Register(typeof(IRepository<>), assemblies);
        }
    }
}