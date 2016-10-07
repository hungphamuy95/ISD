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
using System.Data.SqlClient;
using PagedList;
using TK.Business.Model;

namespace TK.Business.Dao
{
    /// <summary>
	/// Author: Phạm Huy Hùng
	/// Todo: 
	/// </summary>
    public partial class TblUserDao
    {
       
        
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: 
        /// </summary>
        public TblUserDao()
        {
            
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tìm kiếm đối tượng theo khóa chính
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public LoginModel FindById(string Username)
        {
            try
            {
               using(TkSchoolDbContext db= new TkSchoolDbContext())
                {
                    var query = from dat in db.TblUsers where dat.Username == Username select new LoginModel { username = dat.Username, password = dat.Password };
                    return query.FirstOrDefault();
                }
            }
            catch(Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tạo list gồm các đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public IEnumerable<TblUser> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblUser>("select * from TblUser").ToList();
                }
            }
            catch(Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tạo đối tượng mới
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public void Create(TblUser o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblUsers.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: xóa đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Delete(TblUser o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblUsers.Where(x => x.Username == o.Username).Single();
                    db.TblUsers.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: cập nhật đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>\
        public void Update(TblUser obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblUsers.Where(s => s.Username == obj.Username).Single();
                    res.Password = obj.Password;
                    res.Name = obj.Name;
                    res.Email = obj.Email;
                    res.Phone = obj.Phone;
                    res.Mobile = obj.Mobile;
                    res.Status = obj.Status;
                    res.Description = obj.Description;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserDao::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserDao::Update::" + ex.InnerException.Message);
                }
            }
        }
        public TblUser FindByUserName(string username)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblUsers.Where(x => x.Username == username).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserDao::FindByUserName::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserDao::FindByUserName::" + ex.InnerException.Message);
                }
            }
        }
        public TblUser FindByPassWord(string password)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblUsers.Where(x => x.Password == password).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserDao::FindByPassWord::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserDao::FindByPassWord::" + ex.InnerException.Message);
                }
            }
        }
    }
}
