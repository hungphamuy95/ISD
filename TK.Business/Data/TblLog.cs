namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblLog")]
    public partial class TblLog
    {
        [Key]
        public long LogId { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        public DateTime? FromTime { get; set; }

        public DateTime? ToTime { get; set; }

        public bool? Status { get; set; }
    }
}
