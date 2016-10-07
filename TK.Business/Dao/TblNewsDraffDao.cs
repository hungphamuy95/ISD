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
using PagedList;
using TK.Business.Model;

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
        /// Todo: 
        /// </summary>
        public TblNewsDraffDao()
        {
            
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tìm kiếm đối tượng theo khóa chính
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tạo list gồm các đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public IEnumerable<TblNewsDraffModel> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {

                    var query = from groupnews in db.TblGroupNews.AsEnumerable() join news in db.TblNewsDraffs.AsEnumerable() on groupnews.GroupNewsId equals news.GroupNewsId select new TblNewsDraffModel {id=news.NewsId, title = news.Title, ishome = news.IsHome, isevent = news.IsEvent, isweek = news.IsWeek };
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
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tạo đối tượng mới
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: xóa đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: cập nhật đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>\
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

