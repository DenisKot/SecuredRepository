using Moq;
using Tests.SutBuilder.TestStructure;

namespace Tests.SutBuilder
{
    public class SutServiceTestBuilder
    {
        private IFirstTestDependency firstTestDependency;
        private ISecondTestDependency secondTestDependency;

        public SutServiceTestBuilder()
        {
            this.firstTestDependency = new Mock<IFirstTestDependency>().Object;
            this.secondTestDependency = new Mock<ISecondTestDependency>().Object;
        }

        public SutServiceTestBuilder WithFirstDependency(IFirstTestDependency dependency)
        {
            this.firstTestDependency = dependency;
            return this;
        }

        public SutServiceTestBuilder WithSecondDependency(ISecondTestDependency dependency)
        {
            this.secondTestDependency = dependency;
            return this;
        }

        public SutServiceTestBuilder WithRealDependencies()
        {
            this.firstTestDependency = new FirstTestDependency();
            this.secondTestDependency = new SecondTestDependency();
            return this;
        }

        public SutService Build()
        {
            return new SutService(this.firstTestDependency, this.secondTestDependency);
        }
    }
}