/*
Product Name		: TTNB 	
Product Version 	: TTNB v1.0                                           	                     
Product Owner   	: U1 Dev
Developed By    	: Crystal, Inc

Description: 
Dự án xây dựng website quảng bá
						
File Name	   		: TblNewsDraffDao			   	     
File Description 	: Cung cấp các phương thức kết nối và các thao tác nền tảng với cơ sở dữ liệu

Copyright(C) 2016 by Crystal, Inc. All Rights Reserved 	
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using System.Data.SqlClient;
using PagedList;

namespace TK.Business.Dao
{
    /// <summary>
	/// Author: Phạm Huy Hùng
	/// Todo: 
	/// </summary>
    public partial class TblNewsDraffDao
    {
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tìm kiếm tin
        /// </summary>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tìm kiếm tin theo sự kiện 
        /// </summary>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tìm kiếm tin theo trang chủ 
        /// </summary>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: lấy dữ liệu ra trang tin tức
        /// </summary>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: xem chi tiết tin tức
        /// </summary>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tìm kiếm tin theo nhóm tin
        /// </summary>
        /// <returns></returns>
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
        public TblNewsDraff FindByTitle(string title)
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
                    throw new Exception("TBLNEWDRAFFDao::FindByTitle::" + ex.Message);
                else
                    throw new Exception("TBLNEWDRAFFDao::FindByTitle::" + ex.InnerException.Message);
            }
        }
    }
}
