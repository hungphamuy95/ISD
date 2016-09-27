namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblRole")]
    public partial class TblRole
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblRole()
        {
            TblGroupRoles = new HashSet<TblGroupRole>();
        }

        [Key]
        public long RoleId { get; set; }

        [StringLength(150)]
        public string Vie { get; set; }

        [StringLength(150)]
        public string Eng { get; set; }

        [StringLength(150)]
        public string Rus { get; set; }

        public bool? Status { get; set; }

        [StringLength(250)]
        public string Description { get; set; }

        [StringLength(50)]
        public string Controller { get; set; }

        [StringLength(50)]
        public string ConVie { get; set; }

        [StringLength(50)]
        public string ConEng { get; set; }

        [StringLength(50)]
        public string ConRus { get; set; }

        [StringLength(50)]
        public string Action { get; set; }

        [StringLength(150)]
        public string AcVie { get; set; }

        [StringLength(150)]
        public string AcEng { get; set; }

        [StringLength(150)]
        public string AcRus { get; set; }

        [StringLength(10)]
        public string Type { get; set; }

        [StringLength(50)]
        public string CreateUser { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string EditUser { get; set; }

        public DateTime? EditDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblGroupRole> TblGroupRoles { get; set; }
    }
}
