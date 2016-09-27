using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TkSchoolNews.Controllers
{
    public class ErrorController : Controller
    {
        // GET: Error
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ErrorCommon(int? id)
        {
            if (id != null)
            Response.StatusCode = (int)id;
            else
            Response.Write("đã xảy ra lỗi");
            return View();
        }
        public ActionResult AccessDeny()
        {
            return View();
        }
    }
}