
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using PagedList;

namespace TK.Business.Dao
{
    
    public partial class TblGroupNewsDao
    {
       
        public TblGroupNewsDao()
        {

        }
        
        public TblGroupNew FindById(long groupnewsid)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblGroupNews.SingleOrDefault(x => x.GroupNewsId == groupnewsid);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupNewsDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupNewsDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
        
        public List<TblGroupNew> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblGroupNew>("select * from TblGroupNews").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupNewsDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupNewsDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Create(TblGroupNew o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblGroupNews.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupNewsDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupNewsDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Delete(TblGroupNew obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblGroupNews.Where(x => x.GroupNewsId == obj.GroupNewsId).SingleOrDefault();
                    db.TblGroupNews.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupNewsDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupNewsDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
       
        public void Update(TblGroupNew o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblGroupNews.Where(w => w.GroupNewsId == o.GroupNewsId).SingleOrDefault();
                    res.Name = o.Name;
                    res.Status = o.Status;
                    res.Ord = o.Ord;
                    res.ParentId = o.ParentId;
                    res.Path = o.Path;
                    res.IsMenu = o.IsMenu;
                    res.IsHome = o.IsHome;
                    res.UrlPath = o.UrlPath;
                    res.UrlPathEng = o.UrlPathEng;
                    res.NameEng = o.NameEng;
                    res.PathEng = o.PathEng;
                    res.Controller = o.Controller;
                    res.Action = o.Action;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupNewsDao::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupNewsDao::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
