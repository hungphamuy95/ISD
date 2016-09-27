namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblUserUnit")]
    public partial class TblUserUnit
    {
        public long Id { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        [StringLength(10)]
        public string UnitId { get; set; }

        public bool? Status { get; set; }

        [StringLength(50)]
        public string CreateUser { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string EditUser { get; set; }

        public DateTime? EditDate { get; set; }

        public virtual TblUnit TblUnit { get; set; }

        public virtual TblUser TblUser { get; set; }
    }
}
