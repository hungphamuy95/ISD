namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblNewsDraff")]
    public partial class TblNewsDraff
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblNewsDraff()
        {
            TblComments = new HashSet<TblComment>();
            TblFileNewsDraffs = new HashSet<TblFileNewsDraff>();
        }

        [Key]
        public long NewsId { get; set; }

        public long CodeNews { get; set; }

        public long? GroupNewsId { get; set; }

        [StringLength(500)]
        public string Title { get; set; }

        [StringLength(1500)]
        public string ShortContent { get; set; }

        [Column(TypeName = "ntext")]
        public string Content { get; set; }

        [StringLength(500)]
        public string BigImage { get; set; }

        [StringLength(500)]
        public string SmaallImage { get; set; }

        [StringLength(50)]
        public string ReleaseUser { get; set; }

        public DateTime? ReleaseDate { get; set; }

        public bool? RelaseStatus { get; set; }

        [StringLength(50)]
        public string CreateUser { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string EditUser { get; set; }

        public DateTime? EditDate { get; set; }

        public bool IsHome { get; set; }

        public bool IsEvent { get; set; }

        public int? Count { get; set; }

        [StringLength(500)]
        public string TitleEng { get; set; }

        [StringLength(1500)]
        public string ShortContentEng { get; set; }

        [Column(TypeName = "text")]
        public string ContentEng { get; set; }

        public bool IsWeek { get; set; }

        [StringLength(100)]
        public string Controller { get; set; }

        [StringLength(100)]
        public string Action { get; set; }

        [StringLength(150)]
        public string Metatitle { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblComment> TblComments { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblFileNewsDraff> TblFileNewsDraffs { get; set; }

        public virtual TblGroupNew TblGroupNew { get; set; }
    }
}
