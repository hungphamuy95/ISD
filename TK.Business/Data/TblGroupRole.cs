namespace TK.Business.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TblGroupRole")]
    public partial class TblGroupRole
    {
        public long Id { get; set; }

        public long? GroupId { get; set; }

        public long? RoleId { get; set; }

        public virtual TblGroup TblGroup { get; set; }

        public virtual TblRole TblRole { get; set; }
    }
}
