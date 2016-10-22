/*
Product Name		: TTNB 	
Product Version 	: TTNB v1.0                                           	                     
Product Owner   	: U1 Dev
Developed By    	: Crystal, Inc

Description: 
Dự án xây dựng website quảng bá
						
File Name	   		: TblGroupDao			   	     
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
    public partial class TblGroupDao
    {
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: 
        /// </summary>
        public TblGroupDao()
        {

        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tìm kiếm đối tượng theo id
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public TblGroup FindById(TblGroup obj)
        {
            try
            {
                using(TkSchoolDbContext db= new TkSchoolDbContext())
                {
                    return db.TblGroups.SingleOrDefault(x => x.GroupId == obj.GroupId);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tạo list gồm các đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public IEnumerable<TblGroup> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblGroup>("select * from TblGroup").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tạo đối tượng mới
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Create(TblGroup o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblGroups.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: xóa đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Delete(TblGroup o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res= db.TblGroups.Where(x => x.GroupId == o.GroupId).Single();
                    db.TblGroups.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: cập nhật đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>\
        public void Update(TblGroup o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblGroups.Where(x => x.GroupId == o.GroupId).Single();
                    res.Name = o.Name;
                    res.Status = o.Status;
                    res.Description = o.Description;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupDao::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupDao::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
