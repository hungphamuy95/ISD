namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblFile")]
    public partial class TblFile
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblFile()
        {
            TblFileNewsDraffs = new HashSet<TblFileNewsDraff>();
        }

        public long Id { get; set; }

        [StringLength(500)]
        public string Directory { get; set; }

        [StringLength(500)]
        public string Name { get; set; }

        [Column(TypeName = "ntext")]
        public string Content { get; set; }

        [StringLength(500)]
        public string CreateUser { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(500)]
        public string EditUser { get; set; }

        public DateTime? EditDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblFileNewsDraff> TblFileNewsDraffs { get; set; }
    }
}
