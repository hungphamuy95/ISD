/*
Product Name		: TTNB 	
Product Version 	: TTNB v1.0                                           	                     
Product Owner   	: U1 Dev
Developed By    	: Crystal, Inc

Description: 
Dự án xây dựng website quảng bá
						
File Name	   		: TblUserDao			   	     
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
    public partial class TblUserUnitDao
    {
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: 
        /// </summary>
        public TblUserUnitDao()
        {

        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tìm kiếm đối tượng theo khóa chính
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public TblUserUnit FindById(TblUserUnit obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblUserUnits.SingleOrDefault(x => x.Id == obj.Id);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserUnitDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserUnitDao::FindByID::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tạo list gồm các đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public IEnumerable<TblUserUnit> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblUserUnit>("select * from TblUserUnit").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserUnitDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserUnitDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tạo đối tượng mới
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public void Create(TblUserUnit o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblUserUnits.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserUnitDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserUnitDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: xóa đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Delete(TblUserUnit o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblUserUnits.Where(x => x.Id == o.Id).SingleOrDefault();
                    db.TblUserUnits.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserUnitDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserUnitDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: cập nhật đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>\
        public void Update(TblUserUnit o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblUserUnits.Where(x => x.Id == o.Id).SingleOrDefault();
                    res.UserName = o.UserName;
                    res.UnitId = o.UnitId;
                    res.Status = o.Status;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserUnitDao::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserUnitDao::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
