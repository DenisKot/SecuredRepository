﻿using System.Reflection;
using Application.Manager;
using Application.Manager.Validators;
using Application.ValidatorSupport;
using Core.Domain;
using FluentValidation;
using Persistence;
using SimpleInjector;

namespace Application
{
    public static class ApplicationModule
    {
        public static void Configure(Container container)
        {
            PersistenceModule.Configure(container);

            container.Register<IValidator<Employee>, EmployeeValidator>();

            container.Register<IManager<Employee>, Manager<Employee>>();

            container.Register<IValidatorSupport<Employee>, ValidatorSupport<Employee>>();

            //Assembly[] validationSupportAssemblies = new[] { typeof(ValidatorSupport<>).Assembly };
            //container.Register(typeof(IValidatorSupport<>), validationSupportAssemblies);


            //Assembly[] managerAssemblies = new[] { typeof(Manager<Employee>).Assembly };
            //container.Register(typeof(IManager<>), managerAssemblies);
        }
    }
}