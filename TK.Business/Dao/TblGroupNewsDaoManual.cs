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

namespace TK.Business.Dao
{
    public partial class TblGroupNewsDao
    {
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tìm kiếm đối tượng theo tên
        /// </summary>
        /// <returns></returns>
        public TblGroupNew FindByName(string name)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblGroupNews.SingleOrDefault(m => m.Name == name);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblGroupNewsDao::FindByName::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblGroupNewsDao::FindByName::" + ex.InnerException.Message);
                }
            }
        }
    }
}
