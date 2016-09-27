namespace TK.Business.Data
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class TkSchoolDbContext : DbContext
    {
        public TkSchoolDbContext()
            : base("name=TkSchoolDbContext")
        {
        }

        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TblChart> TblCharts { get; set; }
        public virtual DbSet<TblComment> TblComments { get; set; }
        public virtual DbSet<TblFile> TblFiles { get; set; }
        public virtual DbSet<TblFileNewsDraff> TblFileNewsDraffs { get; set; }
        public virtual DbSet<TblGallery> TblGalleries { get; set; }
        public virtual DbSet<TblGroup> TblGroups { get; set; }
        public virtual DbSet<TblGroupNew> TblGroupNews { get; set; }
        public virtual DbSet<TblGroupRole> TblGroupRoles { get; set; }
        public virtual DbSet<TblLog> TblLogs { get; set; }
        public virtual DbSet<TblNewsDraff> TblNewsDraffs { get; set; }
        public virtual DbSet<TblRole> TblRoles { get; set; }
        public virtual DbSet<TblUnit> TblUnits { get; set; }
        public virtual DbSet<TblUser> TblUsers { get; set; }
        public virtual DbSet<TblUserGroup> TblUserGroups { get; set; }
        public virtual DbSet<TblUserUnit> TblUserUnits { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TblChart>()
                .Property(e => e.src1)
                .IsUnicode(false);

            modelBuilder.Entity<TblChart>()
                .Property(e => e.src2)
                .IsUnicode(false);

            modelBuilder.Entity<TblChart>()
                .Property(e => e.src3)
                .IsUnicode(false);

            modelBuilder.Entity<TblChart>()
                .Property(e => e.src4)
                .IsUnicode(false);

            modelBuilder.Entity<TblChart>()
                .Property(e => e.src5)
                .IsUnicode(false);

            modelBuilder.Entity<TblChart>()
                .Property(e => e.CreateUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblChart>()
                .Property(e => e.EditUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblFile>()
                .Property(e => e.Directory)
                .IsUnicode(false);

            modelBuilder.Entity<TblFile>()
                .HasMany(e => e.TblFileNewsDraffs)
                .WithOptional(e => e.TblFile)
                .HasForeignKey(e => e.FileId)
                .WillCascadeOnDelete();

            modelBuilder.Entity<TblGroup>()
                .Property(e => e.CreateUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblGroup>()
                .Property(e => e.EditUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblGroupNew>()
                .Property(e => e.CreateUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblGroupNew>()
                .Property(e => e.EditUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblGroupNew>()
                .Property(e => e.Controller)
                .IsUnicode(false);

            modelBuilder.Entity<TblGroupNew>()
                .Property(e => e.Action)
                .IsUnicode(false);

            modelBuilder.Entity<TblLog>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<TblNewsDraff>()
                .Property(e => e.BigImage)
                .IsUnicode(false);

            modelBuilder.Entity<TblNewsDraff>()
                .Property(e => e.SmaallImage)
                .IsUnicode(false);

            modelBuilder.Entity<TblNewsDraff>()
                .Property(e => e.ReleaseUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblNewsDraff>()
                .Property(e => e.CreateUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblNewsDraff>()
                .Property(e => e.EditUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblNewsDraff>()
                .Property(e => e.ContentEng)
                .IsUnicode(false);

            modelBuilder.Entity<TblNewsDraff>()
                .Property(e => e.Controller)
                .IsUnicode(false);

            modelBuilder.Entity<TblNewsDraff>()
                .Property(e => e.Action)
                .IsUnicode(false);

            modelBuilder.Entity<TblNewsDraff>()
                .Property(e => e.Metatitle)
                .IsUnicode(false);

            modelBuilder.Entity<TblNewsDraff>()
                .HasMany(e => e.TblComments)
                .WithOptional(e => e.TblNewsDraff)
                .WillCascadeOnDelete();

            modelBuilder.Entity<TblNewsDraff>()
                .HasMany(e => e.TblFileNewsDraffs)
                .WithOptional(e => e.TblNewsDraff)
                .WillCascadeOnDelete();

            modelBuilder.Entity<TblRole>()
                .Property(e => e.Controller)
                .IsUnicode(false);

            modelBuilder.Entity<TblRole>()
                .Property(e => e.Action)
                .IsUnicode(false);

            modelBuilder.Entity<TblRole>()
                .Property(e => e.Type)
                .IsUnicode(false);

            modelBuilder.Entity<TblRole>()
                .Property(e => e.CreateUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblRole>()
                .Property(e => e.EditUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblUnit>()
                .Property(e => e.UnitId)
                .IsUnicode(false);

            modelBuilder.Entity<TblUnit>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<TblUnit>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<TblUnit>()
                .Property(e => e.Fax)
                .IsUnicode(false);

            modelBuilder.Entity<TblUnit>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<TblUnit>()
                .Property(e => e.CreateUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblUnit>()
                .Property(e => e.EditUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblUser>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<TblUser>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<TblUser>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<TblUser>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<TblUser>()
                .Property(e => e.CreateUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblUser>()
                .Property(e => e.EditUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblUserGroup>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<TblUserGroup>()
                .Property(e => e.CreateUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblUserGroup>()
                .Property(e => e.EditUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblUserUnit>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<TblUserUnit>()
                .Property(e => e.UnitId)
                .IsUnicode(false);

            modelBuilder.Entity<TblUserUnit>()
                .Property(e => e.CreateUser)
                .IsUnicode(false);

            modelBuilder.Entity<TblUserUnit>()
                .Property(e => e.EditUser)
                .IsUnicode(false);
        }
    }
}
