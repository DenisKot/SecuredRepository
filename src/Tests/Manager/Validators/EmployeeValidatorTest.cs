using System.Linq;
using Application.Manager.Validators;
using Core.Domain;
using FluentValidation;
using NUnit.Framework;

namespace Tests.Manager.Validators
{
    [TestFixture]
    public class EmployeeValidatorTest
    {
        private const string LongText = "Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.";
        private const string ValidationLengthErrorCode = "MaximumLengthValidator";

        [Test]
        public void FirstNameLengthValidationTest()
        {
            var validator = new EmployeeValidator();
            var employee = new Employee {FirstName = LongText, SecondName = "SecondName", Surname = "Surname"};

            var result = validator.Validate(employee);

            Assert.IsFalse(result.IsValid);
            Assert.IsTrue(result.Errors.Count == 1);
            Assert.IsTrue(result.Errors.First().ErrorCode == ValidationLengthErrorCode);
        }

        [Test]
        public void SecondNameLengthValidationTest()
        {
            var validator = new EmployeeValidator();
            var employee = new Employee {FirstName = "FirstName", SecondName = LongText, Surname = "Surname"};

            var result = validator.Validate(employee);

            Assert.IsFalse(result.IsValid);
            Assert.IsTrue(result.Errors.Count == 1);
            Assert.IsTrue(result.Errors.First().ErrorCode == ValidationLengthErrorCode);
        }
    }
}