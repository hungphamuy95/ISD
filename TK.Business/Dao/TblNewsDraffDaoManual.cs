﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using System.Data.SqlClient;
using PagedList;
using TK.Business.Model;

namespace TK.Business.Dao
{
    
    public partial class TblNewsDraffDao
    {
        
        public IEnumerable<TblNewsDraff> FindBy(decimal codeNews, decimal status)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblNewsDraff>("select * from TblNewDraff where TblNewDraff.CodeNew =@codeNews  and TblNewDraff.ReleaseStatus = @status", new SqlParameter("@codeNews", codeNews),
                    new SqlParameter("@status", status)).ToList();
                }
            }
            catch(Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblNewsDraffDao::FindBy" + ex.Message);
                }
                else
                {
                    throw new Exception("TblNewsDraffDao::FindBy" + ex.Message);
                }
            }
        }
        
        public IEnumerable<TblNewsDraff> FindByNewsEvent()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var @params = new[]{
                   new SqlParameter("ISEVENT",1),
                   new SqlParameter("ReleaseStatus",1)
                };

                    List<TblNewsDraff> result = db.Database.SqlQuery<TblNewsDraff>("SELECT TOP 5 * FROM TblNewDraff WHERE ISEVENT=@ISEVENT AND ReleaseStatus=@ReleaseStatus ORDER BY EDITDATE DESC ", @params).ToList();
                    return result;
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                    throw new Exception("TBLNEWDRAFFDao::FindByNewsEvent::" + ex.Message);
                else
                    throw new Exception("TBLNEWDRAFFDao::FindByNewsEvent::" + ex.InnerException.Message);
            }
        }
        
        public IEnumerable<TblNewsDraff> FindByNewsHome()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblNewsDraff>("select * from TblNewsDraff nd where nd.GroupNewsId=1 and nd.IsHome='True'").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                    throw new Exception("TBLNEWDRAFFDao::FindByNewsHome" + ex.Message);
                else
                    throw new Exception("TBLNEWDRAFFDao::FindByNewsHome" + ex.InnerException.Message);
            }
        }
        
        public IEnumerable<TblNewsDraff> FindByNewsHotWeek(int page, int pagesize)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    
                    return db.Database.SqlQuery<TblNewsDraff>("select * from TblNewsDraff nd where nd.IsWeek='True' and nd.GroupNewsId=14 order by nd.CreateDate desc").ToPagedList(page, pagesize);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                    throw new Exception("TBLNEWDRAFFDao::FindByNewHotWeek::" + ex.Message);
                else
                    throw new Exception("TBLNEWDRAFFDao::FindByNewHotWeek::" + ex.InnerException.Message);
            }
        }
       
        public TblNewsDraff FindByDetail(long id)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblNewsDraffs.SingleOrDefault(x => x.NewsId == id);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                    throw new Exception("TBLNEWDRAFFDao::FindByDetail::" + ex.Message);
                else
                    throw new Exception("TBLNEWDRAFFDao::FindByDetail::" + ex.InnerException.Message);
            }
        }
        
        public TblNewsDraff FindByGroupNew(long groupNewsId)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblNewsDraff>("select * from TblNewsDraff nd where nd.IsEvent='True' and nd.GroupNewsId=@groupnewsid order by nd.CreateDate desc", new SqlParameter("@groupnewsid", groupNewsId)).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                    throw new Exception("TBLNEWDRAFFDao::FindByGroupNew::" + ex.Message);
                else
                    throw new Exception("TBLNEWDRAFFDao::FindByGroupNew::" + ex.InnerException.Message);
            }
        }
        public TblNewsDraff CheckTitle(string title)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res= db.TblNewsDraffs.Where(x => x.Title == title).SingleOrDefault();
                    return res;
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                    throw new Exception("TBLNEWDRAFFDao::CheckTitle::" + ex.Message);
                else
                    throw new Exception("TBLNEWDRAFFDao::CheckTitle::" + ex.InnerException.Message);
            }
        }
       
        public IEnumerable<TblNewsDraffModelSearch> FindByTitle(string title, string category)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    if (category == null || category== "All")
                    {
                        return db.Database.SqlQuery<TblNewsDraffModelSearch>("select TblNewsDraff.NewsId, TblNewsDraff.Title, TblGroupNews.Name, TblNewsDraff.IsHome,  TblNewsDraff.IsEvent, TblNewsDraff.IsWeek from TblNewsDraff inner join TblGroupNews on TblNewsDraff.GroupNewsId=TblGroupNews.GroupNewsId where freetext((Title, SubTitle), @title)",
                        new SqlParameter("@title", title)).ToList();
                    }
                    if (category == "14")
                    {
                        return db.Database.SqlQuery<TblNewsDraffModelSearch>("select * from TblNewsDraff nb where freetext((Title, SubTitle),'" + title + "') and GroupNewsId=14").ToList();
                    }
                    var que = db.Database.SqlQuery<TblNewsDraffModelSearch>("select * from TblNewsDraff nb where freetext((Title, SubTitle),'"+title+"') and "+category+"='true'").ToList();
                    return que;
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                    throw new Exception("TBLNEWDRAFFDao::FindByTitle::" + ex.Message);
                else
                    throw new Exception("TBLNEWDRAFFDao::FindByTitle::" + ex.InnerException.Message);
            }
        }
       
        public IEnumerable<TblNewsDraffModelSearch>FindByCate(string cate)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    if (cate == "All"|| cate==null)
                    {
                        return db.Database.SqlQuery<TblNewsDraffModelSearch>("select * from TblNewsDraff").ToList();
                    }
                    else if (cate == "14")
                    {
                        return db.Database.SqlQuery<TblNewsDraffModelSearch>("select * from TblNewsDraff where TblNewsDraff.GroupNewsId=14").ToList();
                    }
                    return db.Database.SqlQuery<TblNewsDraffModelSearch>("select * from TblNewsDraff where "+cate+" ='true'").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                    throw new Exception("TBLNEWDRAFFDao::FindByCate::" + ex.Message);
                else
                    throw new Exception("TBLNEWDRAFFDao::FindByCate::" + ex.InnerException.Message);
            }
        }
        
        public TblNewsDraff FindByTitleFile(string title)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblNewsDraffs.Where(x => x.Title == title).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                    throw new Exception("TBLNEWDRAFFDao::FindByTitleFile::" + ex.Message);
                else
                    throw new Exception("TBLNEWDRAFFDao::FindByTitleFile::" + ex.InnerException.Message);
            }
        }
        public IEnumerable<TblNewsDraff> TopNews()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblNewsDraff>("select top 5 * from TblNewsDraff where TblNewsDraff.GroupNewsId=14 order by TblNewsDraff.CreateDate desc").ToList();
                }
            }
            catch(Exception ex)
            {
                if (ex.InnerException == null)
                    throw new Exception("TBLNEWDRAFFDao::FindByTitleFile::" + ex.Message);
                else
                    throw new Exception("TBLNEWDRAFFDao::FindByTitleFile::" + ex.InnerException.Message);
            }
        }
        
    }
}
