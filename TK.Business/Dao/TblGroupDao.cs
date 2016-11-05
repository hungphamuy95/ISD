
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using PagedList;

namespace TK.Business.Dao
{
    
    public partial class TblGroupDao
    {
        
        public TblGroupDao()
        {

        }
        
        public TblGroup FindById(TblGroup obj)
        {
            try
            {
                using(TkSchoolDbContext db= new TkSchoolDbContext())
                {
                    return db.TblGroups.SingleOrDefault(x => x.GroupId == obj.GroupId);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
        
        public IEnumerable<TblGroup> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblGroup>("select * from TblGroup").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Create(TblGroup o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblGroups.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Delete(TblGroup o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res= db.TblGroups.Where(x => x.GroupId == o.GroupId).Single();
                    db.TblGroups.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Update(TblGroup o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblGroups.Where(x => x.GroupId == o.GroupId).Single();
                    res.Name = o.Name;
                    res.Status = o.Status;
                    res.Description = o.Description;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupDao::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupDao::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
