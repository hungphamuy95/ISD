using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TK.Business.Common;
using TK.Business.Model;
using TK.Business.Dao;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace TkSchoolNews.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        [AllowAnonymous]
        [HttpGet]
        public ActionResult Login(string returnurl)
        {
            ViewBag.returnurl = returnurl;
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult Login(LoginModel model)
        {
            if(ModelState.IsValid)
            {
                var o = new TblUserDao().FindByUserName(model.username);
                    if (o == null)
                {
                    ModelState.AddModelError(string.Empty, "tên đăng nhập không tồn tại");
                    return View();
                }
                    else
                {
                    if (Membership.ValidateUser(model.username, model.password))
                    {
                        FormsAuthentication.SetAuthCookie(model.username, model.rememberme);
                        var usersession = new UserLogin();
                        usersession.username = new TblUserDao().FindByName(model.username).Username;
                        Session.Add(CommonConstants.USER_SESSION, usersession.username);
                        return RedirectToAction("Index", "Admin");
                    }
                    ModelState.AddModelError(string.Empty, "mật khẩu không đúng");
                    return View();
                }
                
            }
            else
            {
                return View();
            }
        }
        public ActionResult Logoff()
        {
            Session.Abandon();
            Session.Clear();
            FormsAuthentication.SignOut();
            Session.RemoveAll();
            
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            
            HttpCookie cookie2 = new HttpCookie("ASP.NET_SessionId", "");
            cookie2.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie2);

            FormsAuthentication.RedirectToLoginPage();
            return RedirectToAction("Login", "Account");
        }
        #region helper
        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
            public enum ManageMessageId
        {
            ChangePasswordSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
        }

        


    }
        #endregion
    }
