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
    public partial class TblFileNewsDraffDao
    {
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: tìm theo newsid
        /// </summary>
        /// <param name="newsid"></param>
        /// <returns></returns>
        public TblFileNewsDraff FindByNewsId(long newsid)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblFileNewsDraffs.Where(x => x.NewsId == newsid).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::FindByNewsId::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::FindByNewsId::" + ex.InnerException.Message);
                }
            }
        }
        /// <summary>
        /// Author: Lê Tuấn Anh
        /// Todo: Tìm đối tượng theo fileid
        /// </summary>
        /// <param name="fileid"></param>
        /// <returns></returns>
        public TblFileNewsDraff FindByFileId(long fileid)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblFileNewsDraffs.Where(x => x.FileId == fileid).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblFileNewsDraff::FindByFileId::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblFileNewsDraff::FindByFileId::" + ex.InnerException.Message);
                }
            }
        }
    }
}
