using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using PagedList;
using TK.Business.Model;

namespace TK.Business.Dao
{
   
    public partial class TblNewsDraffDao
    {
        public TblNewsDraffDao()
        {
            
        }
        public TblNewsDraffModel FindById(long id)
        {
            try
            {
                using(TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var query = (from groupnews in db.TblGroupNews.AsEnumerable() join news in db.TblNewsDraffs.AsEnumerable() on groupnews.GroupNewsId equals news.GroupNewsId where news.NewsId==id select new TblNewsDraffModel { id = news.NewsId, title = news.Title, groupnewsid= news.GroupNewsId, image=news.BigImage, shortcontent= news.ShortContent, content= news.Content , ishome = news.IsHome, isevent = news.IsEvent, isweek = news.IsWeek ,createdate=news.CreateDate}).SingleOrDefault();
                    return query;
                }                   
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblNewsDraff::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblNewsDraff::FindById::" + ex.InnerException.Message);
                }
            }
        }
        public IEnumerable<TblNewsDraffModel> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {

                    var query = from news in db.TblNewsDraffs.AsEnumerable() select new TblNewsDraffModel {id=news.NewsId, title = news.Title, ishome = news.IsHome, isevent = news.IsEvent, isweek = news.IsWeek };
                    return query.ToList();
                    
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblNewsDraffDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblNewsDraffDao::FIndByAll::" + ex.InnerException.Message);
                }
            }
        }
        public void Create(TblNewsDraff o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblNewsDraffs.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblNewsDraffDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblNewsDraffDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        public void Delete(TblNewsDraff o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblNewsDraffs.Where(x => x.NewsId == o.NewsId).SingleOrDefault();
                    db.TblNewsDraffs.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblNewsDraffDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblNewsDraffDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        public void UpdateReleasdate(TblNewsDraff obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblNewsDraffs.Where(s => s.NewsId == obj.NewsId).SingleOrDefault();
                    res.ReleaseDate = obj.ReleaseDate;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblNewsDraffDao::UpdateReleasdate::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblNewsDraffDao::UpdateReleasdate::" + ex.InnerException.Message);
                }
            }
        }
        public void Update(TblNewsDraff obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblNewsDraffs.Where(s => s.NewsId == obj.NewsId).SingleOrDefault();
                    res.Title = obj.Title;
                    res.ShortContent = obj.ShortContent;
                    res.Content = obj.Content;
                    res.BigImage = obj.BigImage;
                    res.SmaallImage = obj.SmaallImage;
                    res.IsWeek = obj.IsWeek;
                    res.Metatitle = obj.Metatitle;
                    res.SubTitle = obj.SubTitle;
                    //res.ReleaseDate = obj.ReleaseDate;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblNewsDraffDao::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblNewsDraffDao::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}

