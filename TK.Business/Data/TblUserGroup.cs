namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblUserGroup")]
    public partial class TblUserGroup
    {
        public long Id { get; set; }

        [StringLength(50)]
        public string Username { get; set; }

        public long? GroupId { get; set; }

        public bool? Status { get; set; }

        [StringLength(50)]
        public string CreateUser { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string EditUser { get; set; }

        public DateTime? EditDate { get; set; }

        public virtual TblGroup TblGroup { get; set; }

        public virtual TblUser TblUser { get; set; }
    }
}
