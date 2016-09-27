/*
Product Name		: TTNB 	
Product Version 	: TTNB v1.0                                           	                     
Product Owner   	: U1 Dev
Developed By    	: Crystal, Inc

Description: 
Dự án xây dựng website quảng bá
						
File Name	   		: TblChartDao			   	     
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
	/// Author: Phạm Huy Hùng
	/// Todo: 
	/// </summary>
    public partial class TblFileNewsDraffDao
    {
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: 
        /// </summary>
        public TblFileNewsDraffDao()
        {

        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tìm kiếm đối tượng theo khóa chính
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public TblFileNewsDraff FindById(long id)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblFileNewsDraffs.Where(x => x.Id == id).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::FindById::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tạo list gồm các đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public IEnumerable<TblFileNewsDraff> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblFileNewsDraff>("select * from TblFileNewsDraff").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tạo đối tượng mới
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public void Create(TblFileNewsDraff o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblFileNewsDraffs.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::Create::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: xóa đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Delete(long id)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblFileNewsDraffs.Where(x => x.Id == id).SingleOrDefault();
                    db.TblFileNewsDraffs.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::Delete::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: cập nhật đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public void Update(TblFileNewsDraff obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblFileNewsDraffs.Where(x => x.Id ==obj.Id).SingleOrDefault();
                    res.NewsId = obj.NewsId;
                    res.FileId = obj.FileId;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
