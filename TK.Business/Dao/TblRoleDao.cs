/*
Product Name		: TTNB 	
Product Version 	: TTNB v1.0                                           	                     
Product Owner   	: U1 Dev
Developed By    	: Crystal, Inc

Description: 
Dự án xây dựng website quảng bá
						
File Name	   		: TblRoleDao	   	     
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
    public partial class TblRoleDao
    {
        
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: 
        /// </summary>
        public TblRoleDao()
        {
            
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tìm kiếm đối tượng theo khóa chính
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public TblRole FindById(TblRole obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblRoles.SingleOrDefault(x => x.RoleId == obj.RoleId);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblRoleDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblRoleDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tạo list gồm các đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public IEnumerable<TblRole> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblRole>("select * from TblRole").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblRoleDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblRoleDao::FIndByAll::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tạo đối tượng mới
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Create(TblRole o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblRoles.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblRoleDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblRoleDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: xóa đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Delete(TblRole o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblRoles.Add(o);
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblRoleDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblRoleDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        
        
    }
}
