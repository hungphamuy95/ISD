using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using TK.Business.Dao;
using TK.Business.Data;

namespace TkSchoolNews.Controllers
{
    public partial class AdminController
    {
        [Authorize]
        public ActionResult TblUnitListIndex()
        {
            return View();
        }
        public JsonResult TblUnitList()
        {
            var list = new TblUnitDao().FindByAll();
            var result= Json(list, JsonRequestBehavior.AllowGet);
            return result;
        }
        public JsonResult TblUnitCreate(string id, string name, string phone, string fax, string email, string address, bool? status=false)
        {
            TblUnit o = new TblUnit();
            o.UnitId = id;
            o.Name = name;
            o.Phone = phone;
            o.Fax = fax;
            o.Email = email;
            o.Status = status;
            o.Address = address;
            new TblUnitDao().Create(o);
            return Json(JsonRequestBehavior.AllowGet);
        }
        public JsonResult TblUnitDelete(string id)
        {
            TblUnit o = new TblUnit();
            o.UnitId = id;
            new TblUnitDao().Delete(o);
            return Json(JsonRequestBehavior.AllowGet);
        }
    }
}