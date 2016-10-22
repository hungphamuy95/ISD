/*
Product Name		: TTNB 	
Product Version 	: TTNB v1.0                                           	                     
Product Owner   	: U1 Dev
Developed By    	: Crystal, Inc

Description: 
Dự án xây dựng website quảng bá
						
File Name	   		: TblGroupRoleDao		   	     
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
    public partial class TblGroupRoleDao
    {
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: 
        /// </summary>
        public TblGroupRoleDao()
        {

        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tìm kiếm đối tượng theo khóa chính
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public TblGroupRole FindById(TblGroupRole obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblGroupRoles.SingleOrDefault(x => x.Id == obj.Id);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupRoleDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupRoleDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tạo list gồm các đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public IEnumerable<TblGroupRole>FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblGroupRole>("select * from TblGroupRole").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupRoleDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupRoleDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tạo đối tượng mới
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Create(TblGroupRole o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblGroupRoles.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupRoleDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupRoleDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: xóa đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Delete(TblGroupRole o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblGroupRoles.Where(x => x.Id == o.Id).SingleOrDefault();
                    db.TblGroupRoles.Remove(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupRoleDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupRoleDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: cập nhật đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>\
        public void Update(TblGroupRole o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblGroupRoles.Where(x => x.Id == o.Id).SingleOrDefault();
                    res.GroupId = o.GroupId;
                    res.RoleId = o.RoleId;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupRoleDao::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupRoleDao::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
