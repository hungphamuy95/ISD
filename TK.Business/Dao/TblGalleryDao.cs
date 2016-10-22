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

namespace TK.Business.Dao
{
    /// <summary>
    /// Author: Lê Tuấn Anh
    /// Todo: tìm theo newsid
    /// </summary>
    /// <returns></returns>
    public partial class TblGalleryDao
    {
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tìm theo newsid
        /// </summary>
        /// <returns></returns>
        public TblGalleryDao()
        {

        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tìm theo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tạo list gồm các đối tượng
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tạo đối tượng mới
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: xóa đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
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
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: cập nhật các thuộc tính của đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Update(TblGallery o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblGalleries.Where(x => x.Id == o.Id).SingleOrDefault();
                    res.Name = o.Name;
                    res.ImageUrl = o.ImageUrl;
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
