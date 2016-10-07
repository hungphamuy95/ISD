using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Web.Mvc;
using System.Runtime.Serialization;
using System.ComponentModel.DataAnnotations.Schema;

namespace TK.Business.Model
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
        [Required(ErrorMessage ="bạn không được để trống tiêu đề", AllowEmptyStrings =false)]
        public string title { get; set; }
        [Required(ErrorMessage = "bạn không được để trống nôi dung sơ lược", AllowEmptyStrings = false)]
        public string shortcontent { get; set; }
        public long? groupnewsid { get; set; }
        [Required(ErrorMessage ="bạn không được để trống nội dung", AllowEmptyStrings =false)]
        public string content { get; set; }
        [Required(ErrorMessage = "bạn không trống đường dẫn hình ảnh", AllowEmptyStrings = false)]
        public string image { get; set; }
        public bool ishome { get; set; }
        public bool isevent { get; set; }
        public bool isweek { get; set; }
        public DateTime? createdate { get; set; }
        public long file { get; set; }
        
    }
    public class TblNewsDraffModelSearch
    {
        public long NewsId { get; set; }
        public string Title { get; set; }
        public string Name { get; set; }
        public bool IsHome { get; set; }
        public bool IsEvent { get; set; }
        public bool IsWeek { get; set; }
    }
    public class TblNewsDraffCreateModel
    {
        [Required(ErrorMessage = "bạn phải nhập tiêu đề", AllowEmptyStrings = false)]
        public string title { get; set; }
        [Required(ErrorMessage = "bạn phải nhập nội dung sơ lược", AllowEmptyStrings = false)]
        public string shortcontent { get; set; }
        [Required(ErrorMessage = "bạn phải nhập nội dung", AllowEmptyStrings = false)]
        public string content { get; set; }
        public bool isevent { get; set; }
        public bool isweek { get; set; }
    }
    public class ChangePassword
    {
        
        [Required(ErrorMessage = "bạn phải nhập mật khẩu", AllowEmptyStrings = false)]
        public string password { get; set; }
        [Required(ErrorMessage = "bạn phải nhập mật khẩu mới", AllowEmptyStrings = false)]
        [StringLength(250, MinimumLength =6, ErrorMessage ="mật khẩu mới phải có ít nhất 6 kí tự")]
        public string newpassword { get; set; }
        [Required(ErrorMessage = "bạn phải nhập lại mật khẩu", AllowEmptyStrings = false)]
        [System.ComponentModel.DataAnnotations.Compare("newpassword", ErrorMessage = "mật khẩu bạn nhập không trùng khớp")]
        public string repassword { get; set; }
        
    }
    public class TblGalleryModel
    {
        public string name { get; set; }
        public string url { get; set; }
    }
    [DataContract]
    public class CapchaRespond
    {
        [DataMember(Name = "success")]
        public bool Success { get; set; }

        [DataMember(Name = "error-codes")]
        public string[] ErrorCodes { get; set; }
    }
    public class TblCommentModel
    {
        [StringLength(250, MinimumLength = 5, ErrorMessage = "tên bạn phải ít nhất 5 kí tự")]
        [Required(ErrorMessage = "bạn phải nhập tên")]
        public string Name { get; set; }

        [Column(TypeName = "ntext")]
        [StringLength(int.MaxValue, MinimumLength = 20, ErrorMessage = "bình luận của bạn phải có ít nhất 20 kí tự")]
        [Required(ErrorMessage = "bạn chưa nhập bình luận")]
        public string Content { get; set; }
    }
    public class TblFileModel
    {
        public long? newsid { get; set; }
        public long fileid { get; set; }
        public string filename { get; set; }
    }
}
