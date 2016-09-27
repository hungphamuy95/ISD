namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblUnit")]
    public partial class TblUnit
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblUnit()
        {
            TblUserUnits = new HashSet<TblUserUnit>();
        }

        [Key]
        [StringLength(10)]
        public string UnitId { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(30)]
        public string Phone { get; set; }

        [StringLength(30)]
        public string Fax { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        public bool? Status { get; set; }

        [StringLength(250)]
        public string Address { get; set; }

        [StringLength(50)]
        public string CreateUser { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string EditUser { get; set; }

        public DateTime? EditDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblUserUnit> TblUserUnits { get; set; }
    }
}
