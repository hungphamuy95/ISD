using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TK.Business.Dao;
using TK.Business.Model;
using TK.Business.Data;
using TK.Business.Common;

namespace TkSchoolNews.Controllers
{
    public partial class AdminController : Controller
    {
        //tạo thông báo cho người dùng
        protected void SetAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }
            else if (type == "error")
            {
                TempData["AlertType"] = "alert-danger";
            }
        }

        //ghi log hệ thống
        public log4net.ILog logger = log4net.LogManager.GetLogger("TkSchoolNews");
        public const string ControllerName = "Admin";
        public string GetUserName()
        {
            return HttpContext.User.Identity.Name;
        }
        [Authorize]

        public ActionResult Index()
        {
            ViewBag.UserName = GetUserName();
            return View();
        }
        [Authorize]
        [HttpGet]
        public ActionResult ChangePassword()
        {
            try
            {
                return View();
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::ChangePassword::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }

        }
        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePassword model)
        {
            try
            {
                var compare = new TblUserDao().FindById(GetUserName());
                if (ModelState.IsValid)
                {
                    if (compare.password != new Encryted().MD5Hash(model.password))
                    {
                        SetAlert("mật khẩu cũ bạn nhập không đúng", "error");
                    }
                    else
                    {
                        TblUser o = new TblUser();
                        o.Username = GetUserName();
                        o.Password = new Encryted().MD5Hash(model.newpassword);
                        new TblUserDao().Update(o);
                        SetAlert("đổi mật khẩu thành công", "success");
                        return RedirectToAction("ChangePassword");
                    }
                }
                return View();
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::ChangePassword::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
    }
}