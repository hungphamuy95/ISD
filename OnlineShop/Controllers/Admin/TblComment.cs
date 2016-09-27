using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TK.Business.Dao;
using TK.Business.Data;
using TK.Business.Model;

namespace TkSchoolNews.Controllers
{
    public partial class AdminController
    {
        [Authorize]
        [ValidateInput(false)]
        public ActionResult TblCommentAdminCreate(long newsid, string uck, TblNewsDraffModel model)
        {
            try {
                TblComment o = new TblComment();
                o.Name = GetUserName();
                o.Content = model.Comment;
                o.NewsId = newsid;
                o.CreateDate = DateTime.Now;
                o.IsAd = true;
                new TblCommentDao().Create(o);
                return RedirectToAction("TblNewsDraffUpdate", "Admin", new { id = newsid });
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
        public ActionResult QuotationAdmin(string usercomment, string quote)
        {
            try
            {
                TblCommentModel o = new TblCommentModel();
                o.Content = "<div style='border: 1px solid gray; border-radius:10px;'><blockquote><span><strong>bình luận của&nbsp;<span style='color:red;'>" + usercomment + "</span></strong></span><br>" + quote + "</blockquote></div>";
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
        public ActionResult QuotationAdmin(long id, TblCommentModel model)
        {
            try
            {
                TblComment o = new TblComment();
                o.Name = GetUserName();
                o.Content = model.Content;
                o.NewsId = id;
                o.CreateDate = DateTime.Now;
                o.IsAd = true;
                new TblCommentDao().Create(o);
                return RedirectToAction("TblNewsDraffUpdate", "Admin", new { id = id });
            }
            
            catch (Exception ex)
            {
                logger.Info(ControllerName + "::QuotationAdmin::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }

        }
    }
}