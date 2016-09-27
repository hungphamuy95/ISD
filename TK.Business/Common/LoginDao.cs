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
using System.Data.SqlClient;
using TK.Business.Data;
using TK.Business.Common;

namespace TK.Business.Common
{
    public class LoginDao
    {
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: đăng nhập hệ thống
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public bool Login(string username ,string password)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    string encryptpassword = new Encryted().MD5Hash(password);
                    var res = db.Database.SqlQuery<bool>("Sp_User_Login @username, @password",
                        new SqlParameter("@username",username),
                        new SqlParameter("@password", encryptpassword)).SingleOrDefault();
                    return res;
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("LoginDao::Login::" + ex.Message);
                }
                else
                {
                    throw new Exception("LoginDao::Login::" + ex.InnerException.Message);
                }
            }
        }
    }
}
