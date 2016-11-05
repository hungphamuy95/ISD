using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using PagedList;
using System.Data.SqlClient;
using TK.Business.Model;

namespace TK.Business.Dao
{
   
    public partial class TblCommentDao
    {
        
        public TblCommentDao()
        {

        }
        
        public TblComment FindById(long id)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblComments.Where(x => x.Id == id).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
        
        public IEnumerable<TblComment> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblComment>("select * from TblComment").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }

        public void Create(TblComment o)
        {

            using (TkSchoolDbContext db = new TkSchoolDbContext())
            {
                db.TblComments.Add(o);
                db.SaveChanges();
            }
        }
           
        
        public void Delete(TblComment o)
        {
            try
            {
                using(TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblComments.Where(x => x.Id == o.Id).SingleOrDefault();
                    db.TblComments.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Update(TblComment o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res=db.TblComments.Where(x => x.Id == o.Id).SingleOrDefault();
                    res.Name = o.Name;
                    res.Content = o.Content;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::Update::" + ex.InnerException.Message);
                }
            }
        }
        public void UpdateMultiple(IEnumerable<TblComment> o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    foreach(var item in o)
                    {
                        var res = db.TblComments.Where(x => x.Id == item.Id).SingleOrDefault();
                        res.TimeVisit = item.TimeVisit;
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::UpdateMultiple::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::UpdateMultiple::" + ex.InnerException.Message);
                }
            }
        }
        
        public IEnumerable<TblComment> FindByNewsId(long newsid)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblComments.Where(x => x.NewsId == newsid).ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::FindByNewsId::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::FindByNewsId::" + ex.InnerException.Message);
                }
            }
        }
        public IEnumerable<CountComment> CountCmt()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                   return db.Database.SqlQuery<CountComment>("select nd.NewsId, nd.Title, COUNT(cm.Id) as countcomment from TblComment cm  right join TblNewsDraff nd on nd.NewsId = cm.NewsId where nd.GroupNewsId=14 and (cm.CreateDate>=nd.ReleaseDate) group by nd.Title, nd.NewsId").ToList();  
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::CountCmt::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::CountCmt::" + ex.InnerException.Message);
                }
            }
        }
    }
}
