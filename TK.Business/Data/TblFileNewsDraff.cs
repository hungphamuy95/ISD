namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblFileNewsDraff")]
    public partial class TblFileNewsDraff
    {
        public long Id { get; set; }

        public long? FileId { get; set; }

        public long? NewsId { get; set; }

        [StringLength(100)]
        public string CreateUser { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(100)]
        public string EditUser { get; set; }

        public DateTime? EditDate { get; set; }

        public virtual TblFile TblFile { get; set; }

        public virtual TblNewsDraff TblNewsDraff { get; set; }
    }
}
