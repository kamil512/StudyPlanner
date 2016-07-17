﻿using StudyPlanner.Domain.Abstract;
using StudyPlanner.Domain.Entities;
using StudyPlanner.Infrastructure.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using static StudyPlanner.WebUI.Infrastructure.Utilities;

namespace StudyPlanner.Infrastructure.Concrete
{
    public class FormsAuthProvider : IAuthProvider
    {
        private IRepository repository;

        public FormsAuthProvider(IRepository repository)
        {
            this.repository = repository;
        }

        public bool Authenticate(string username, string password)
        {
            User user = repository.Users.FirstOrDefault(u => u.UserName.ToLower() == username.ToLower());
            if (user != null && HashPassword(password, user.Salt) == user.Password)
            {
                FormsAuthentication.SetAuthCookie(username, false);
                return true;
            }
            return false;
        }

        public void SignOut()
        {
            FormsAuthentication.SignOut();
        }
    }
}