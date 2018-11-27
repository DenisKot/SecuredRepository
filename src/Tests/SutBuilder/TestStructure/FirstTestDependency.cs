namespace Tests.SutBuilder.TestStructure
{
    public interface IFirstTestDependency
    {
        string DoSomething();
    }

    public class FirstTestDependency : IFirstTestDependency
    {
        public string DoSomething()
        {
            return "first";
        }
    }
}