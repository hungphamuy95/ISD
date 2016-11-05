
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;

namespace TK.Business.Dao
{
    
    public partial class TblFileNewsDraffDao
    {
        
        public TblFileNewsDraffDao()
        {

        }
        
        public TblFileNewsDraff FindById(long id)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblFileNewsDraffs.Where(x => x.Id == id).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::FindById::" + ex.InnerException.Message);
                }
            }
        }
        
        public IEnumerable<TblFileNewsDraff> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblFileNewsDraff>("select * from TblFileNewsDraff").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Create(TblFileNewsDraff o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblFileNewsDraffs.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::Create::" + ex.InnerException.Message);
                }
            }
        }
       
        public void Delete(TblFileNewsDraff o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblFileNewsDraffs.Where(x => x.Id == o.Id).SingleOrDefault();
                    db.TblFileNewsDraffs.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::Delete::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Update(TblFileNewsDraff obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblFileNewsDraffs.Where(x => x.Id ==obj.Id).SingleOrDefault();
                    res.NewsId = obj.NewsId;
                    res.FileId = obj.FileId;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
