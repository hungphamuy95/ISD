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
        public ActionResult ErrorCommon()
        {
            return View();
        }
        public ActionResult AccessDeny()
        {
            return View();
        }
    }
}