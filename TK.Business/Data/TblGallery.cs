namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblGallery")]
    public partial class TblGallery
    {
        public long Id { get; set; }

        [StringLength(150)]
        public string Name { get; set; }

        [StringLength(250)]
        public string ImageUrl { get; set; }

        public long? GroupNewsId { get; set; }

        [StringLength(50)]
        public string CreateUser { get; set; }

        public DateTime? Createdate { get; set; }

        [StringLength(50)]
        public string EditUser { get; set; }

        public DateTime? EditDate { get; set; }

        [StringLength(150)]
        public string SubName { get; set; }

        public virtual TblGroupNew TblGroupNew { get; set; }
    }
}
