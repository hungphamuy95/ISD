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
                //var list = new TblNewsDraffDao().FindByAll();
                return View();
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblNewsDraffListIndex::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [Authorize]
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
        [Authorize]
        public JsonResult SearchResult(string searchquery, string cate)
        {
            if (searchquery == null || searchquery=="" )
            {
                var fullllist = new TblNewsDraffDao().FindByCate(cate);
                return Json(fullllist, JsonRequestBehavior.AllowGet);
            }
            var list = new TblNewsDraffDao().FindByTitle(searchquery, cate);
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        [Authorize]
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
        [Authorize]
        public ActionResult TblFileNewsDraffList()
        {
            try
            {
                return Json(new TblFileDao().FindByModel(), JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblFileNewsDraffList::" + ex.Message);
                return Json(JsonRequestBehavior.AllowGet);
            }
        }
        [Authorize]
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
        [HttpGet]
        public ActionResult TblNewsDraffCreate(string returnrurl)
        {
            ViewBag.returnurl = returnrurl;
            return View();
        }
        [Authorize]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult TblNewsDraffCreate(TblNewsDraffCreateModel model ,string fileattach , string hinhanh, string groupname="TIN TỨC", bool ishome=false)
        {

            try { 
            if (ModelState.IsValid)
            {
                    var check = new TblNewsDraffDao().CheckTitle(model.title);
                    if (check != null)
                    {
                        SetAlert("tin này đã tồn tại, bạn không thể tạo mới", "error");
                        return RedirectToAction("TblNewsDraffCreate");
                    }
                    else
                    {
                        TblNewsDraff o = new TblNewsDraff();
                        TblFileNewsDraff obj = new TblFileNewsDraff();
                        o.Title = model.title;
                        o.GroupNewsId = new TblGroupNewsDao().FindByName(groupname).GroupNewsId;
                        o.ShortContent = model.shortcontent;
                        o.Content = model.content;
                        o.BigImage = hinhanh;
                        o.IsHome = ishome;
                        o.IsEvent = model.isevent;
                        o.IsWeek = model.isweek;
                        o.CreateUser = this.GetUserName();
                        o.CreateDate = DateTime.Now;
                        o.Metatitle = (new Rewrite().RemoveUnicode(model.title)).Replace("?", "").Replace(":", "").Replace(",", "").Replace("\"", string.Empty).Trim().Replace("'", "").Replace("/", "").Replace("[", "").Replace("]", "").Replace("(", "").Replace(")", "").Replace(".", "").Replace(" ", "-").ToLower();
                        var test = new Rewrite().RemoveUnicode(model.title).ToLower();
                        o.SubTitle = test;
                        o.ReleaseDate = DateTime.Now;
                        new TblNewsDraffDao().Create(o);
                        var res = new TblNewsDraffDao().FindByTitleFile(model.title);

                        if (fileattach != "")
                        {
                            obj.NewsId = res.NewsId;
                            obj.FileId = new TblFileDao().FindByName(fileattach).Id;
                            new TblFileNewsDraffDao().Create(obj);
                        }
                        SetAlert("tạo thành công", "success");
                        return RedirectToAction("TblNewsDraffListIndex");
                    }
            }
            return View();
            
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
        public ActionResult TblNewsDraffUpdate(string id)
        {
            try
            {
                long numberid;
                bool check = Int64.TryParse(id, out numberid);
                if (check == true)
                {
                    var list = new TblNewsDraffDao().FindById(numberid);
                    ViewBag.FileAttach = new TblFileDao().FindByNewsId(numberid);
                    ViewBag.Cmt = new TblCommentDao().FindByNewsId(numberid);
                    if (list == null)
                    {
                        return RedirectToAction("AccessDeny", "Error");
                    }
                    return View(list);
                }
                return RedirectToAction("AccessDeny", "Error");
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
        public ActionResult TblNewsDraffUpdate(long id, TblNewsDraffModel model, string fileattach)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    TblNewsDraff o = new TblNewsDraff();
                    TblFileNewsDraff obj = new TblFileNewsDraff();
                    o.NewsId = id;
                    o.Title = model.title;
                    o.ShortContent = model.shortcontent;
                    o.Content = model.content;
                    o.BigImage = model.image;
                    o.IsHome = model.ishome;
                    o.IsEvent = model.isevent;
                    o.IsWeek = model.isweek;
                    o.EditUser = GetUserName();
                    o.EditDate = DateTime.Now;
                    string urlseo = (new Rewrite().RemoveUnicode(model.title)).Replace("?", "").Replace(":", "").Replace(",", "").Replace("\"", string.Empty).Trim().Replace("'", "").Replace("/", "").Replace("[", "").Replace("]", "").Replace("(", "").Replace(")", "").Replace(".", "").Replace(" ","-").ToLower();
                    o.Metatitle = urlseo;
                    o.SubTitle = new Rewrite().RemoveUnicode(model.title).ToLower();
                    new TblNewsDraffDao().Update(o);
                    if (fileattach != "" && fileattach!= "deletefile")
                    {
                    if (fileattach != null)
                    {
                        var checknewsid = new TblFileNewsDraffDao().FindByNewsId(id);
                        if (checknewsid == null)
                        {
                            var res = new TblNewsDraffDao().FindByTitleFile(model.title);
                            obj.NewsId = res.NewsId;
                            obj.FileId = new TblFileDao().FindByName(fileattach).Id;
                            new TblFileNewsDraffDao().Create(obj);
                        }
                        else if (checknewsid != null)
                        {
                            var resupdate = new TblNewsDraffDao().FindByTitleFile(model.title);
                            var findfile = new TblFileNewsDraffDao().FindByNewsId(id);
                            obj.Id = findfile.Id;
                            obj.NewsId = resupdate.NewsId;
                            obj.FileId = new TblFileDao().FindByName(fileattach).Id;
                            new TblFileNewsDraffDao().Update(obj);
                        }
                    }
                    }
                    else if(fileattach== "deletefile")
                    {
                        TblFileNewsDraff deletefile = new TblFileNewsDraffDao().FindByNewsId(id);
                        if (deletefile != null)
                        {
                            new TblFileNewsDraffDao().Delete(deletefile);
                        }
                    }
                    SetAlert("cập nhật thành công", "success");
                    return RedirectToAction("TblNewsDraffUpdate");
                }
                var list = new TblNewsDraffDao().FindById(id);
                return View(list);
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblNewsDraffUpdate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
    }
}