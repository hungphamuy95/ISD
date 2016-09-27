/*
Product Name		: TTNB 	
Product Version 	: TTNB v1.0                                           	                     
Product Owner   	: U1 Dev
Developed By    	: Crystal, Inc

Description: 
Dự án xây dựng website quảng bá
						
File Name	   		: TblUnitDao			   	     
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
	/// Author: Phạm Huy Hùng
	/// Todo: 
	/// </summary>
    public partial class TblUnitDao
    {
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: 
        /// </summary>
        public TblUnitDao()
        {

        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tìm kiếm đối tượng theo khóa chính
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public TblUnit FindById(TblUnit obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblUnits.SingleOrDefault(x => x.UnitId == obj.UnitId);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUnitDao::FindById" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUnitDao::FindById" + ex.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tạo list gồm các đối tượng
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public IEnumerable<TblUnit> FindByAll()
        {
            try
            {
                using(TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblUnit>("select * from TblUnit").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUnitDao::FindByAll" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUnitDao::FindByAll" + ex.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: tạo đối tượng mới
        /// </summary>
        /// <param name=""></param>
        /// <returns></returns>
        public void Create(TblUnit o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    if (o != null)
                    {
                        db.TblUnits.Add(o);
                        db.SaveChanges();
                    }
                    
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUnitDao::Create" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUnitDao::Create" + ex.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: xóa đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Delete(TblUnit o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblUnits.Where(x => x.UnitId == o.UnitId).SingleOrDefault();
                    db.TblUnits.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUnitDao::Delete" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUnitDao::Delete" + ex.Message);
                }
            }
        }
        /// <summary>
        /// Author: Phạm Huy Hùng
        /// Todo: cập nhật đối tượng
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public void Update(TblUnit o)
        {
            try
            {
                using(TkSchoolDbContext db= new TkSchoolDbContext())
                {
                    var res = db.TblUnits.Where(x => x.UnitId == o.UnitId).Single();
                    res.Name = o.Name;
                    res.Phone = o.Phone;
                    res.Fax = o.Fax;
                    res.Email = o.Email;
                    res.Status = o.Status;
                    res.Address = o.Address;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUnitDao::Update" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUnitDao::Update" + ex.Message);
                }
            }
        }
    }
}
