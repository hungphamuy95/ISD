namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblChart")]
    public partial class TblChart
    {
        public long id { get; set; }

        [StringLength(50)]
        public string src1 { get; set; }

        [StringLength(50)]
        public string src2 { get; set; }

        [StringLength(50)]
        public string src3 { get; set; }

        [StringLength(50)]
        public string src4 { get; set; }

        [StringLength(50)]
        public string src5 { get; set; }

        public bool? Status { get; set; }

        [StringLength(50)]
        public string CreateUser { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string EditUser { get; set; }

        public DateTime? EditDate { get; set; }
    }
}
