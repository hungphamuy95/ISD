namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblComment")]
    public partial class TblComment
    {
        public long Id { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [Column(TypeName = "ntext")]
        public string Content { get; set; }

        public long? ParentId { get; set; }

        public long? NewsId { get; set; }

        public DateTime? CreateDate { get; set; }

        public bool? IsAd { get; set; }

        public DateTime? TimeVisit { get; set; }

        [StringLength(150)]
        public string UserQoute { get; set; }

        [Column(TypeName = "ntext")]
        public string Qoute { get; set; }

        public virtual TblNewsDraff TblNewsDraff { get; set; }
    }
}
