/*
Product Name		: TTNB 	
Product Version 	: TTNB v1.0                                           	                     
Product Owner   	: U1 Dev
Developed By    	: Crystal, Inc

Description: 
Dự án xây dựng website quảng bá
						
File Name	   		: TblNewsDraffDao			   	     
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
    public partial class TblCommentDao
    {
        public TblCommentDao()
        {

        }
        public TblComment FindById(long id)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblComments.Where(x => x.Id == id).SingleOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
        public IEnumerable<TblComment> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblComment>("select * from TblComment").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        public void Create(TblComment o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblComments.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        public void Delete(TblComment o)
        {
            try
            {
                using(TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblComments.Where(x => x.Id == o.Id).SingleOrDefault();
                    db.TblComments.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        public void Update(TblComment o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res=db.TblComments.Where(x => x.Id == o.Id).SingleOrDefault();
                    res.Name = o.Name;
                    res.Content = o.Content;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        public IEnumerable<TblComment> FindByNewsId(long newsid)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblComments.Where(x => x.NewsId == newsid).ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblCommentDao::FindByNewsId::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblCommentDao::FindByNewsId::" + ex.InnerException.Message);
                }
            }
        }
    }
}
