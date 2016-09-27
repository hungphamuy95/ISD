using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TK.Business.Dao;
using TK.Business.Data;

namespace TkSchoolNews.Controllers
{
    public partial class AdminController
    {
        [Authorize]
        [HttpGet]
        [ValidateInput(false)]
        public ActionResult TblChartUpdate()
        {
            try {
                return View(new TblChartDao().FindByAll());
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblChartUpdate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [Authorize]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult TblChartUpdate(string src1, string src2, string src3, string src4, string src5)
        {
            try
            {
                TblChart o = new TblChart();
                o.src1 = src1;
                o.src2 = src2;
                o.src3 = src3;
                o.src4 = src4;
                o.src5 = src5;
                new TblChartDao().Update(o);
                SetAlert("cập nhật thành công", "success");
                return RedirectToAction("TblChartUpdate");
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblChartUpdate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
    }

}