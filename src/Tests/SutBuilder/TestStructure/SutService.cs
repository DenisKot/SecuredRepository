namespace Tests.SutBuilder.TestStructure
{
    public class SutService
    {
        private readonly IFirstTestDependency firstTestDependency;
        private readonly ISecondTestDependency secondTestDependency;

        public SutService(IFirstTestDependency firstTestDependency, ISecondTestDependency secondTestDependency)
        {
            this.firstTestDependency = firstTestDependency;
            this.secondTestDependency = secondTestDependency;
        }
        
        public string CallFirstDependency()
        {
            return this.firstTestDependency.DoSomething();
        }

        public string CallSecondDependency()
        {
            return this.secondTestDependency.WhoAmI();
        }

        public string CallBoth()
        {
            return $"{this.firstTestDependency.DoSomething()}-{this.secondTestDependency.WhoAmI()}";
        }
    }
}