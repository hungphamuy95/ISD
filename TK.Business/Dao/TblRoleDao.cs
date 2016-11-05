
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using PagedList;

namespace TK.Business.Dao
{
    
    public partial class TblRoleDao
    {
       
        public TblRoleDao()
        {
            
        }
        
        public TblRole FindById(TblRole obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblRoles.SingleOrDefault(x => x.RoleId == obj.RoleId);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblRoleDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblRoleDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
       
        public IEnumerable<TblRole> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblRole>("select * from TblRole").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblRoleDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblRoleDao::FIndByAll::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Create(TblRole o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblRoles.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblRoleDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblRoleDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Delete(TblRole o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblRoles.Add(o);
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblRoleDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblRoleDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        
        
    }
}
