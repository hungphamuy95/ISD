
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Web.Mvc;

namespace TkSchoolNews.Models
{
    public class LoginModel
    {
        [DisplayName("tên đăng nhập")]
        [Required(ErrorMessage = "bạn phải nhập tên user",AllowEmptyStrings =false)]
        public string username { get; set; }
        [DisplayName("mật khẩu")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "bạn phải nhập mật khẩu",AllowEmptyStrings =false)]
        public string password { get; set; }
        [DisplayName("ghi nhớ")]
        public bool rememberme { get; set; }
    }
    public class TblNewsDraffCreate
    {
        [Required(ErrorMessage = "bạn phải nhập nội dung này", AllowEmptyStrings = false)]
        public string shortcontent { get; set; }
        [Required(ErrorMessage = "bạn phải nhập nội dung này", AllowEmptyStrings = false)]
        public string content { get; set; }
        public string image { get; set; }
    }
    public class TblNewsDraffModel
    {
        public long id { get; set; }
        public string title { get; set; }
        public string groupname { get; set; }
        public string shortcontent { get; set; }
        public string content { get; set; }
        public string image { get; set; }
        public bool ishome { get; set; }
        public bool isevent { get; set; }
        public bool isweek { get; set; }
    }
}
