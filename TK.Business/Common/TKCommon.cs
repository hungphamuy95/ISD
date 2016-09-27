using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using System.Web;
using System.Reflection;
using TK.Business.Dao;

namespace TK.Business.Common
{
    public class TKCommon
    {
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo:
        /// </summary>
        /// <param name="controller"></param>
        /// <param name="action"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool IsAccess(string controller, string action, string key)
        {
            if (HttpContext.Current.Session["Roles"] != null)
            {
                bool result = false;
                List<TblRole> role = (List<TblRole>)HttpContext.Current.Session["Roles"];
                result = role.Where(p => p.Controller == controller && p.Action == action && p.Type == key).ToList().Count > 0;
                return true;
            }
            else
            {
                HttpContext.Current.Response.Redirect("~/Account/Logoff");
                return false;
            }
        }
        public static void WriteSession(string username)
        {
            //Ghi dữ liệu log
            TblLog log = new TblLog();
            log.UserName = username;
            log.FromTime = DateTime.Now;
            new TblLogDao().Create(log);
        }
    }
}
