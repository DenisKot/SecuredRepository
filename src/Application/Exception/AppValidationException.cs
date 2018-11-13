namespace Application.Exception
{
    public class AppValidationException : System.Exception
    {
        public AppValidationException(string message) : base(message)
        {
        }
    }
}