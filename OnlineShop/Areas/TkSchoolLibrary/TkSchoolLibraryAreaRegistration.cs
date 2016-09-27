using System.Web.Mvc;

namespace TkSchoolNews.Areas.TkSchoolLibrary
{
    public class TkSchoolLibraryAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "TkSchoolLibrary";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "TkSchoolLibrary_default",
                "TkSchoolLibrary/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}