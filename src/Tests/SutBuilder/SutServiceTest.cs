using Moq;
using NUnit.Framework;
using Tests.SutBuilder.TestStructure;

namespace Tests.SutBuilder
{
    public class SutServiceTest
    {
        [Test]
        public void TestFirstDependency()
        {
            var expected = "Ok";
            var firstDependency = new Mock<IFirstTestDependency>();
            firstDependency.Setup(x => x.DoSomething()).Returns(expected);
            var sut = new SutServiceTestBuilder().WithFirstDependency(firstDependency.Object).Build();

            var result = sut.CallFirstDependency();

            Assert.AreEqual(expected, result);
        }

        [Test]
        public void TestSecondDependency()
        {
            var expected = "Ok";
            var secondDependency = new Mock<ISecondTestDependency>();
            secondDependency.Setup(x => x.WhoAmI()).Returns(expected);
            var sut = new SutServiceTestBuilder().WithSecondDependency(secondDependency.Object).Build();

            var result = sut.CallSecondDependency();

            Assert.AreEqual(expected, result);
        }

        [Test]
        public void TestRealDependency()
        {
            var sut = new SutServiceTestBuilder().WithRealDependencies().Build();

            var result = sut.CallBoth();

            Assert.AreEqual("first-second", result);
        }
    }
}