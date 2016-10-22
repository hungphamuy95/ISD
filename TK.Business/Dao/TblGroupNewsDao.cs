/*
Product Name		: TTNB 	
Product Version 	: TTNB v1.0                                           	                     
Product Owner   	: U1 Dev
Developed By    	: Crystal, Inc

Description: 
Dự án xây dựng website quảng bá
						
File Name	   		: TblGroupNewsDao		   	     
File Description 	: Cung cấp các phương thức kết nối và các thao tác nền tảng với cơ sở dữ liệu

Copyright(C) 2016 by Crystal, Inc. All Rights Reserved 	
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using PagedList;

namespace TK.Business.Dao
{
    /// <summary>
	/// Author: Lê Tuấn Anh
	/// Todo: 
	/// </summary>
    public partial class TblGroupNewsDao
    {
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: 
        /// </summary>
        public TblGroupNewsDao()
        {

        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tìm kiếm đối tượng theo khóa chính
        /// </summary>
        /// <param name="groupnewsid"></param>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tạo list gồm các đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tạo đối tượng mới
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: xóa đối tượng
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: cập nhật các thuộc tính đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>\
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
