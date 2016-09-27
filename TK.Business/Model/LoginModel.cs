using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

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
        public string title { get; set; }
        public long? groupnews { get; set; }
        public string groupname { get; set; }
        public string shortcontent { get; set; }
        public string content { get; set; }
        public string image { get; set; }
        public bool ishome { get; set; }
        public bool isevent { get; set; }
        public bool isweek { get; set; }
        public DateTime? createdate { get; set; }
        public long file { get; set; }
        [StringLength(250, MinimumLength = 5, ErrorMessage = "tên bạn phải ít nhất 6 kí tự")]
        [Required(ErrorMessage = "bạn phải nhập tên")]
        public string Name { get; set; }

        [Column(TypeName = "ntext")]
        [StringLength(int.MaxValue, MinimumLength = 20, ErrorMessage = "bình luận của bạn phải có ít nhất 20 kí tự")]
        [Required(ErrorMessage = "bạn chưa nhập bình luận")]
        public string Comment { get; set; }
    }
    public class ChangePassword
    {
        
        [Required(ErrorMessage = "bạn phải nhập mật khẩu", AllowEmptyStrings = false)]
        public string password { get; set; }
        [Required(ErrorMessage = "bạn phải nhập mật khẩu mới", AllowEmptyStrings = false)]
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
        [StringLength(250, MinimumLength = 6, ErrorMessage = "tên bạn phải ít nhất 6 kí tự")]
        [Required(ErrorMessage = "bạn phải nhập tên")]
        public string Name { get; set; }

        [Column(TypeName = "ntext")]
        [StringLength(int.MaxValue, MinimumLength = 20, ErrorMessage = "bình luận của bạn phải có ít nhất 20 kí tự")]
        [Required(ErrorMessage = "bạn chưa nhập bình luận")]
        public string Content { get; set; }
    }
}
