
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using PagedList;

namespace TK.Business.Dao
{
    
    public partial class TblGroupRoleDao
    {
        
        public TblGroupRoleDao()
        {

        }
        
        public TblGroupRole FindById(TblGroupRole obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblGroupRoles.SingleOrDefault(x => x.Id == obj.Id);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupRoleDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupRoleDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
       
        public IEnumerable<TblGroupRole>FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblGroupRole>("select * from TblGroupRole").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupRoleDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupRoleDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Create(TblGroupRole o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblGroupRoles.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupRoleDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupRoleDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Delete(TblGroupRole o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblGroupRoles.Where(x => x.Id == o.Id).SingleOrDefault();
                    db.TblGroupRoles.Remove(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupRoleDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupRoleDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
       
        public void Update(TblGroupRole o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblGroupRoles.Where(x => x.Id == o.Id).SingleOrDefault();
                    res.GroupId = o.GroupId;
                    res.RoleId = o.RoleId;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupRoleDao::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupRoleDao::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
