using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TK.Business.Dao;
using TK.Business.Data;
using TK.Business.Model;
using System.Web.Security;

namespace TkSchoolNews.Controllers
{
    public partial class AdminController
    {
        [Authorize]
        public ActionResult TblCommentList(string newsid)
        {
            long numberid;
            bool checkistring = Int64.TryParse(newsid, out numberid);
            if (checkistring == true)
            {
                var res = new TblNewsDraffDao().FindById(numberid);
                ViewBag.NewsContent = res;
                ViewBag.Cmt = new TblCommentDao().FindByNewsId(res.id);
                TblNewsDraff complex = new TblNewsDraff();
                complex.NewsId = numberid;
                complex.ReleaseDate = DateTime.Now;
                new TblNewsDraffDao().UpdateReleasdate(complex);
                return View();
            }
            return RedirectToAction("AccessDeny", "Error");
        }
        [Authorize]
        [ValidateInput(false)]
        public ActionResult TblCommentAdminCreate(long newsid, TblComment model)
        {
            try {
                if (model.Content!=null)
                {
                    
                        TblComment o = new TblComment();
                        o.Name = GetUserName();
                        o.Content = model.Content;
                        o.NewsId = newsid;
                        o.CreateDate = DateTime.Now;
                        o.IsAd = true;
                        new TblCommentDao().Create(o);
                        return RedirectToAction("TblCommentList", "Admin", new { newsid = newsid });
                    
                }
                TempData["scroll"] = "$(document).ready(function(){$('body').animate({ scrollTop: $(document).height() }, 1000);});";
                TempData["alertempty"]= "<span class='text-danger' id='alertempty'>bạn không được để trống bình luận</div>";
                return RedirectToAction("TblCommentList", "Admin", new { newsid = newsid });
            }
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblCommentAdminCreate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }

        }
        [HttpDelete]
        [Authorize]
        public ActionResult TblCommentDelete(long id)
        {
            try
            {
                TblComment o = new TblComment();
                o.Id = id;
                new TblCommentDao().Delete(o);
                return RedirectToAction("TblNewsDraffUpdate", "Admin");
            }
            
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::TblCommentDelete::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [Authorize]
        [HttpGet]
        [ValidateInput(false)]
        public ActionResult QuotationAdmin(string usercomment, string quote, long id)
        {
            try
            {
                
                TblCommentModel o = new TblCommentModel();
                o.Content = quote;
                o.newsid = id;
                return View(o);
                
                
            }
            
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::QuotationAdmin::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [ValidateInput(false)]
        [Authorize]
        [HttpPost]
        public ActionResult QuotationAdmin(string comment, string usercomment, string quote, long id, TblCommentModel model)
        {
            try
            {
                TblCommentModel obj = new TblCommentModel();
                obj.Content = quote ;
                obj.newsid = id;
                if (comment != "")
                {
                    
                        TblComment o = new TblComment();
                        o.Name = GetUserName();
                        o.Content = comment;
                        o.NewsId = id;
                        o.CreateDate = DateTime.Now;
                        o.UserQoute = usercomment;
                        o.Qoute = quote;
                        o.IsAd = true;
                        o.TimeVisit = DateTime.Now;
                        new TblCommentDao().Create(o);
                        return RedirectToAction("TblCommentList", "Admin", new { newsid = id });
                    
                }
                TempData["alertempty"] = "<span class='text-danger' id='alertempty'>bạn không được để trống bình luận</span>";
                return View(obj);
                
            }
            
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::QuotationAdmin::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }

        }
    }
}