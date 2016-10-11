using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using TK.Business.Dao;
using TK.Business.Data;
using System.IO;
using System.Configuration;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Text;
using TK.Business.Model;

namespace TkSchoolNews.Controllers
{
    public class HomeController : Controller
    {
        //ghi log hệ thống
        public log4net.ILog logger = log4net.LogManager.GetLogger("TkSchoolNews");
        protected void SetAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }
            else if (type == "error")
            {
                TempData["AlertType"] = "alert-danger";
            }
        }
        [AllowAnonymous]
        [HttpGet]
        public ActionResult Index()
        {
            try
            {
                ViewBag.Chart = new TblChartDao().FindByAll();
                ViewBag.NewsHome = new TblNewsDraffDao().FindByNewsHome();
                return View();
            }
            catch (Exception ex)
            {
                logger.Info("Home" + "::Index::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }

        [AllowAnonymous]
        public ActionResult NewsList(int page = 1, int pagesize = 10)
        {
            try
            {
                var res = new TblNewsDraffDao().FindByNewsHotWeek(page, pagesize);
                ViewBag.News = res;
                return View();
            }
            catch (Exception ex)
            {
                logger.Info("Home" + "::NewsList::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [AllowAnonymous]
        [HttpGet]
        [ValidateInput(false)]
        public ActionResult NewsDetail(string metatitle, long id)
        {
            try
            {
                var res = new TblNewsDraffDao().FindByDetail(id);
                ViewBag.NewsDetail = res;
                ViewBag.FileAttach = new TblFileDao().FindByNewsId(id);
                ViewBag.cmt = new TblCommentDao().FindByNewsId(id);
                return View();
            }
            catch (Exception ex)
            {
                logger.Info("Home" + "::NewsDetail::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [AllowAnonymous]
        public ActionResult EventNews(string groupnewsid)
        {
            try
            {
                long numberid;
                bool check = Int64.TryParse(groupnewsid, out numberid);
                if(check== true)
                {
                    ViewBag.School = new TblNewsDraffDao().FindByGroupNew(numberid);
                    ViewBag.GroupNewsName = new TblGroupNewsDao().FindById(numberid);
                    if (ViewBag.GroupNewsName == null || numberid == 1 || numberid == 14 || numberid == 2 || numberid == 9)
                    {
                        return RedirectToAction("ErrorCommon", "Error");
                    }
                    return View();
                }
                return RedirectToAction("ErrorCommon", "Error");
            }
            catch (Exception ex)
            {
                logger.Info("Home" + "::EventNews::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [AllowAnonymous]
        public ActionResult Contact(string groupnewsid)
        {
            try
            {
                long numberid;
                bool check = Int64.TryParse(groupnewsid, out numberid);
                if (check == true)
                {
                    ViewBag.School = new TblNewsDraffDao().FindByGroupNew(numberid);
                    ViewBag.GroupNewsName = new TblGroupNewsDao().FindById(numberid);
                    if (numberid != 15)
                    {
                        return RedirectToAction("ErrorCommon", "Error");
                    }
                    return View();
                }
                return RedirectToAction("ErrorCommon", "Error");
            }
            catch (Exception ex)
            {
                logger.Info("Home" + "::Contact::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        public void DownloadFile(string filepath, string filename)
        {
            try
            {
                HttpContext.Response.ContentType = "APPLICATION/OCTET-STREAM";
                string name = filename.Replace(',', '_');
                String Header = "Attachment; Filename=" + name;
                HttpContext.Response.AppendHeader("Content-Disposition", Header);
                FileInfo Dfile = new FileInfo(HttpContext.Server.MapPath(filepath + filename));
                HttpContext.Response.WriteFile(Dfile.FullName);
                HttpContext.Response.End();
            }
            catch (Exception ex)
            {
                logger.Info("Home" + "::DonwloadFile::" + ex.Message);
            }
        }
        [AllowAnonymous]
        public ActionResult Material(string groupnewsid)
        {
            try
            {
                long numberid;
                bool check = Int64.TryParse(groupnewsid, out numberid);
                if (check == true)
                {
                    ViewBag.Material = new TblNewsDraffDao().FindByGroupNew(numberid);
                    ViewBag.GroupNewsName = new TblGroupNewsDao().FindById(numberid);
                    ViewBag.Gallery = new TblGalleryDao().FindByAll();
                    if (numberid != 8)
                    {
                        return RedirectToAction("ErrorCommon", "Error");
                    }
                    return View();
                }
                return RedirectToAction("ErrorCommon", "Error");
            }
            catch (Exception ex)
            {
                logger.Info("Home" + "::Material::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [AllowAnonymous]
        [HttpPost]
        [ValidateInput(false)]

        public ActionResult TblCommentCreate(string metatitle, long id, TblCommentModel model, FormCollection form)
        {
            try
            {
                const string verifyUrl = "https://www.google.com/recaptcha/api/siteverify";
                var secret = ConfigurationManager.AppSettings["SecretKey"];
                var response = form["g-recaptcha-response"];
                var remoteIp = Request.ServerVariables["REMOTE_ADDR"];

                var myParameters = String.Format("secret={0}&response={1}&remoteip={2}", secret, response, remoteIp);

                using (var wc = new WebClient())
                {
                    wc.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";
                    var json = wc.UploadString(verifyUrl, myParameters);
                    var js = new DataContractJsonSerializer(typeof(CapchaRespond));
                    var ms = new MemoryStream(Encoding.ASCII.GetBytes(json));
                    var result = js.ReadObject(ms) as CapchaRespond;
                    if (result != null && result.Success) // SUCCESS!!!
                    {
                        if (ModelState.IsValid)
                        {
                            TblComment o = new TblComment();
                            o.Name = model.Name;
                            o.Content = model.Content;
                            o.NewsId = id;
                            o.CreateDate = DateTime.Now;
                            o.IsAd = false;
                            new TblCommentDao().Create(o);
                            return RedirectToAction("NewsDetail", "Home", new { id = id, metatitle = HttpUtility.UrlDecode(metatitle) });
                        }
                    }

                }
                SetAlert("bạn phải xác nhận không phải là người máy", "error");
                return RedirectToAction("NewsDetail", "Home", new { id = id, metatitle = HttpUtility.UrlDecode(metatitle) });
            }
            catch (Exception ex)
            {
                logger.Info("Home" + "::TblCommentCreate::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }

        }
        [AllowAnonymous]
        [HttpGet]
        [ValidateInput(false)]
        public ActionResult Quotation(string usercomment, string quote)
        {
            try
            {
                TblCommentModel o = new TblCommentModel();
                o.Content = "<div style='border: 1px solid gray; border-radius:10px;'><blockquote><span><strong>bình luận của&nbsp;<span style='color:red;'>" + usercomment + "</span></strong></span><br>" + quote + "</blockquote></div>";
                return View(o);
            }

            catch (Exception ex)
            {
                logger.Info("Home" + "::Quotation::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
        [AllowAnonymous]
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Quotation(string metatitle, long id, TblCommentModel model, FormCollection form)
        {
            try
            {
                const string verifyUrl = "https://www.google.com/recaptcha/api/siteverify";
                var secret = ConfigurationManager.AppSettings["SecretKey"];
                var response = form["g-recaptcha-response"];
                var remoteIp = Request.ServerVariables["REMOTE_ADDR"];

                var myParameters = String.Format("secret={0}&response={1}&remoteip={2}", secret, response, remoteIp);

                using (var wc = new WebClient())
                {
                    wc.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";
                    var json = wc.UploadString(verifyUrl, myParameters);
                    var js = new DataContractJsonSerializer(typeof(CapchaRespond));
                    var ms = new MemoryStream(Encoding.ASCII.GetBytes(json));
                    var result = js.ReadObject(ms) as CapchaRespond;
                    if (result != null && result.Success) // SUCCESS!!!
                    {
                        if (ModelState.IsValid)
                        {
                            TblComment o = new TblComment();
                            o.Name = model.Name;
                            o.Content = model.Content;
                            o.NewsId = id;
                            o.CreateDate = DateTime.Now;
                            o.IsAd = false;
                            new TblCommentDao().Create(o);
                            return RedirectToAction("NewsDetail", "Home", new { id = id, metatitle = HttpUtility.UrlDecode(metatitle) });
                        }
                    }
                }
                return View();
            }
            catch (Exception ex)
            {
                logger.Info("Home" + "::Quotation::" + ex.Message);
                return RedirectToAction("Index", "Error");
            }
        }
    }
}