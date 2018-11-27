namespace Tests.SutBuilder.TestStructure
{
    public interface ISecondTestDependency
    {
        string WhoAmI();
    }

    public class SecondTestDependency : ISecondTestDependency
    {
        public string WhoAmI()
        {
            return "second";
        }
    }
}