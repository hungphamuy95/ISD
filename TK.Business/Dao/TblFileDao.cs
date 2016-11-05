
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using System.Data.SqlClient;
using TK.Business.Model;

namespace TK.Business.Dao
{
    
    public partial class TblFileDao
    {
        
        public TblFileDao()
        {

        }
        
        public TblFile FindById(long id)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblFiles.Where(x => x.Id == id).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFiletDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
        
        public IEnumerable<TblFile> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblFile>("select * from TblFile").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFiletDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        
        public IEnumerable<TblFileModel> FindByModel()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var query = (from file in db.TblFiles.AsEnumerable() join filenews in db.TblFileNewsDraffs.AsEnumerable() on file.Id equals filenews.FileId select new TblFileModel { filename = file.Name }).Distinct();
                    return query.ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileDao::FindByModel::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFiletDao::FindByModel::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Create(TblFile o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblFiles.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFiletDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Delete(TblFile o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblFiles.Where(x => x.Id == o.Id).SingleOrDefault();
                    db.TblFiles.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFiletDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        
        public TblFile FindByName(string name)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblFiles.Where(x => x.Name == name).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileDao::FindByName::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFiletDao::FindByName::" + ex.InnerException.Message);
                }
            }
        }
        
        public TblFile FindByNewsId(long newsid)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblFile>("select * from TblFile inner join TblFileNewsDraff on TblFile.Id=TblFileNewsDraff.FileId where TblFileNewsDraff.NewsId=@NewsId",new SqlParameter("NewsId",newsid)).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileDao::FindByNewsId::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFiletDao::FindByNewsId::" + ex.InnerException.Message);
                }
            }
        }
    }
}
