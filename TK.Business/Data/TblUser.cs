namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblUser")]
    public partial class TblUser
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblUser()
        {
            TblUserGroups = new HashSet<TblUserGroup>();
            TblUserUnits = new HashSet<TblUserUnit>();
        }

        [Key]
        [StringLength(50)]
        public string Username { get; set; }

        public bool? IsUserAd { get; set; }

        [StringLength(150)]
        public string Password { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(30)]
        public string Phone { get; set; }

        [StringLength(30)]
        public string Mobile { get; set; }

        public bool? Status { get; set; }

        [StringLength(250)]
        public string Description { get; set; }

        [StringLength(50)]
        public string CreateUser { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string EditUser { get; set; }

        public DateTime? EditDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblUserGroup> TblUserGroups { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblUserUnit> TblUserUnits { get; set; }
    }
}
