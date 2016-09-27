using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TK.Business.Common;
using TK.Business.Dao;
using TK.Business.Model;
using System.Web.Mvc;

namespace TkSchoolNews.Controllers
{
    public partial class AdminController 
    {
        [Authorize]
        public ActionResult TblUserListIndex()
        {
            return View();
        }
        public JsonResult TblUserList()
        {
            var list = new TblUserDao().FindByAll();
            return Json(list, JsonRequestBehavior.AllowGet);
        }
    }
}