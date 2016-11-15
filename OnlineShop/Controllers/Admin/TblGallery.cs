using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TK.Business.Dao;
using TK.Business.Data;
using TK.Business.Model;
using TK.Business.Common;

namespace TkSchoolNews.Controllers
{
    public partial class AdminController 
    {
        [Authorize]
        public ActionResult TblGalleryListIndex()
        {
            try
            {
                ViewBag.photo = new TblGalleryDao().FindByAll();
                return View();
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblGalleryListIndex::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [Authorize]
        public JsonResult TblGalleryList()
        {
            try
            {
                var list = new TblGalleryDao().FindByAll();
                return Json(list, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblGalleryDelete::" + ex.Message);
                return Json(JsonRequestBehavior.AllowGet);
            }
        }
        [Authorize]
        public ActionResult TblGalleryDelete(long id)
        {
            try
            {
                TblGallery o = new TblGallery();
                o.Id = id;
                new TblGalleryDao().Delete(o);
                return Json(JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblGalleryDelete::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [Authorize]
        [HttpGet]
        public ActionResult TblGalleryCreate()
        {
            try
            {
                return View();
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblGalleryCreate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [Authorize]
        [HttpPost]
        public ActionResult TblGalleryCreate(TblGalleryModel model)
        {
            try
            {
                var check = new TblGalleryDao().FindByName(model.name);
                if (check != null)
                {
                    SetAlert("tên đã tồn tại, vui lòng nhập tên khác", "error");
                    return RedirectToAction("TblGalleryCreate", "Admin");
                }
                else
                {
                    TblGallery o = new TblGallery();
                    o.Name = model.name;
                    o.ImageUrl = model.url;
                    o.CreateUser = GetUserName();
                    o.Createdate = DateTime.Now;
                    o.SubName = new Rewrite().RemoveUnicode(model.name);
                    new TblGalleryDao().Create(o);
                    SetAlert("tạo mới thành công", "success");
                }
                return RedirectToAction("TblGalleryListIndex", "Admin");
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblGalleryCreate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [Authorize]
        [HttpGet]
        public ActionResult TblGalleryUpdate(long id)
        {
            try
            {
                var res = new TblGalleryDao().FindById(id);
                return View(res);
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblGalleryUpdate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [Authorize]
        [HttpPost]
        public ActionResult TblGalleryUpdate(long id, TblGallery model)
        {
            try
            {
                TblGallery o = new TblGallery();
                o.Id = id;
                o.Name = model.Name;
                o.ImageUrl = model.ImageUrl;
                o.SubName = new Rewrite().RemoveUnicode(model.Name);
                new TblGalleryDao().Update(o);
                SetAlert("cập nhật thành công", "success");
                return RedirectToAction("TblGalleryUpdate", "Admin");
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblGalleryUpdate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
    }
}