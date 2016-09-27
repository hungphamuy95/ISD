using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TK.Business.Dao;
using TK.Business.Common;
using TK.Business.Data;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using TK.Business.Model;

namespace TkSchoolNews.Controllers
{
    public partial class AdminController
    {
        [Authorize]
        public ActionResult TblNewsDraffListIndex()
        {
            try
            {
                var list = new TblNewsDraffDao().FindByAll();
                return View(list);
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblNewsDraffListIndex::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        public JsonResult TblNewsDraffList()
            {
            try
            {
                var list = new TblNewsDraffDao().FindByAll();
                var res = Json(list, JsonRequestBehavior.AllowGet);
                return res;
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblNewsDraffCreate::" + ex.Message);
                return Json(JsonRequestBehavior.AllowGet);
            }
        }
    
        public JsonResult TblGroupNewsList()
        {
            try
            {
                var list = new TblGroupNewsDao().FindByAll();
                var res = Json(list, JsonRequestBehavior.AllowGet);
                return res;
            }
            
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblGroupNewsList::" + ex.Message);
                return Json(JsonRequestBehavior.AllowGet);
            }
        }
        public JsonResult TblListFile()
        {
            try
            {
                var list = new TblFileDao().FindByAll();
                var res = Json(list, JsonRequestBehavior.AllowGet);
                return res;
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblGroupNewsList::" + ex.Message);
                return Json(JsonRequestBehavior.AllowGet);
            }
        }
        [Authorize]
        [HttpPost]
        public ActionResult TblNewsDraffCreate(string title, TblNewsDraffModel model, List<string> fileattach, string image= "/Images/defaultimage.jpg", string groupname= "TRƯỜNG HỌC", bool ishome=false, bool isevent=false, bool isweek=false)
        {
            try
            {
                TblNewsDraff o = new TblNewsDraff();
                TblFileNewsDraff obj = new TblFileNewsDraff();
                o.Title = title;
                o.GroupNewsId = new TblGroupNewsDao().FindByName(groupname).GroupNewsId;
                o.ShortContent = model.shortcontent;
                o.Content = model.content;
                o.BigImage = image;
                o.IsHome = ishome;
                o.IsEvent = isevent;
                o.IsWeek = isweek;
                o.CreateUser = this.GetUserName();
                o.CreateDate = DateTime.Now;
                o.Metatitle = (new Rewrite().RemoveUnicode(title)).Replace(" ","-").Replace("?", "").Replace(":", "").Replace(",", "").Replace("\"", string.Empty).Trim().Replace("'", "").Replace("/", "").Replace("[", "").Replace("]", "").Replace("(", "").Replace(")", "").Replace("[^0-9a-zA-Z]+", "").ToLower();
                new TblNewsDraffDao().Create(o);
                var res = new TblNewsDraffDao().FindByTitle(title);
                foreach(var item in fileattach)
                {
                    obj.NewsId = res.NewsId;
                    obj.FileId = new TblFileDao().FindByName(item).Id;
                    new TblFileNewsDraffDao().Create(obj);
                }
               return Json(JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblNewsDraffCreate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [Authorize]
        public ActionResult TblNewsDraffDelete(long id)
        {
            try
            {
                TblNewsDraff o = new TblNewsDraff();
                o.NewsId = id;
                new TblNewsDraffDao().Delete(o);
                return Json(JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblNewsDraffDelete::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [Authorize]
        [HttpGet]
        public ActionResult TblNewsDraffUpdate(long id, long? selectedid=null)
        {
            try
            {
                var list = new TblNewsDraffDao().FindById(id);
                ViewBag.groupnews = new SelectList(new TblGroupNewsDao().FindByAll(), "GroupNewsId", "Name", selectedid);
                ViewBag.file = new SelectList(new TblFileDao().FindByAll(), "Id", "Name", selectedid);
                ViewBag.FileAttach = new TblFileDao().FindByNewsId(id);
                ViewBag.cmt = new TblCommentDao().FindByNewsId(id);                     
                return View(list);
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblNewsDraffUpdate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [Authorize]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult TblNewsDraffUpdate(long id, TblNewsDraffModel model, List<string> fileattach)
        {
            try
            {
                TblNewsDraff o = new TblNewsDraff();
                o.NewsId = id;
                o.Title = model.title;
                o.GroupNewsId = model.groupnews;
                o.ShortContent = model.shortcontent;
                o.Content = model.content;
                o.BigImage = model.image;
                o.IsHome = model.ishome;
                o.IsEvent = model.isevent;
                o.IsWeek = model.isweek;
                o.EditUser = GetUserName();
                o.EditDate = DateTime.Now;
                string urlseo= (new Rewrite().RemoveUnicode(model.title)).Replace(" ","-").Replace("?", "").Replace(":", "").Replace(",", "").Replace("\"", string.Empty).Trim().Replace("'", "").Replace("/", "").Replace("[", "").Replace("]", "").Replace("(", "").Replace(")", "").Replace("[^0-9a-zA-Z]+", "").ToLower();
                o.Metatitle = urlseo;
                new TblNewsDraffDao().Update(o);
                SetAlert("cập nhật thành công", "success");
                return RedirectToAction("TblNewsDraffUpdate");
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblNewsDraffUpdate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
    }
}