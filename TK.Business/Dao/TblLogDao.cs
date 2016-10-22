/*
Product Name		: TTNB 	
Product Version 	: TTNB v1.0                                           	                     
Product Owner   	: U1 Dev
Developed By    	: Crystal, Inc

Description: 
Dự án xây dựng website quảng bá
						
File Name	   		: TblLogDao			   	     
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
	/// Todo: 
	/// </summary>
    public partial class TblLogDao
    {
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: 
        /// </summary>
        public TblLogDao()
        {

        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tìm kiếm đối tượng theo khóa chính
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public TblLog FindById(TblLog obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblLogs.SingleOrDefault(x => x.LogId == obj.LogId);
                }
            }

            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblLogDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblLogDao::FindByID::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tạo list gồm các đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public IEnumerable<TblLog> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblLog>("select * from TblLog").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblLogDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblLogDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        public void Create(TblLog o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblLogs.Where(x => x.LogId == o.LogId).SingleOrDefault();
                    db.TblLogs.Add(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblLogDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblLogDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
    }
}

