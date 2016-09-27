namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TblGroupNew
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblGroupNew()
        {
            TblGalleries = new HashSet<TblGallery>();
            TblNewsDraffs = new HashSet<TblNewsDraff>();
        }

        [Key]
        public long GroupNewsId { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        public bool? Status { get; set; }

        [StringLength(50)]
        public string CreateUser { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string EditUser { get; set; }

        public DateTime? EditDate { get; set; }

        public int? Ord { get; set; }

        public long? ParentId { get; set; }

        [StringLength(2000)]
        public string Path { get; set; }

        public bool? IsMenu { get; set; }

        public bool? IsHome { get; set; }

        [StringLength(500)]
        public string UrlPath { get; set; }

        [StringLength(250)]
        public string NameEng { get; set; }

        [StringLength(250)]
        public string PathEng { get; set; }

        [StringLength(500)]
        public string UrlPathEng { get; set; }

        [StringLength(100)]
        public string Controller { get; set; }

        [StringLength(100)]
        public string Action { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblGallery> TblGalleries { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblNewsDraff> TblNewsDraffs { get; set; }
    }
}
