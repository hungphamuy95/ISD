
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;

namespace TK.Business.Dao
{
    
    public partial class TblGalleryDao
    {
        
        public TblGalleryDao()
        {

        }
        
        public TblGallery FindById(long id)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblGalleries.Where(x => x.Id == id).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGallery::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGallery::FindById::" + ex.InnerException.Message);
                }
            }
        }
        
        public IEnumerable<TblGallery> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblGallery>("select * from TblGallery").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGallery::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGallery::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Create(TblGallery o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblGalleries.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGallery::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGallery::Create::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Delete(TblGallery o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblGalleries.Where(x => x.Id == o.Id).SingleOrDefault();
                    db.TblGalleries.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGallery::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGallery::Delete::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Update(TblGallery o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblGalleries.Where(x => x.Id == o.Id).SingleOrDefault();
                    res.Name = o.Name;
                    res.ImageUrl = o.ImageUrl;
                    res.SubName = o.SubName;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGallery::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGallery::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
