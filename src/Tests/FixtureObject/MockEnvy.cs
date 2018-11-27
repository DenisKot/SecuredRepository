using Moq;

namespace Tests.FixtureObject
{
    internal static class MockEnvy
    {
        internal static Mock<T> AsMock<T>(this T obj) where T : class
        {
            return Mock.Get(obj);
        }
    }
}