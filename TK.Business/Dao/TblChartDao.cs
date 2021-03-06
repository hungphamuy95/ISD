﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using PagedList;

namespace TK.Business.Dao
{
    
    public partial class TblChartDao
    {
        
        public TblChartDao()
        {

        }
        
        public TblChart FindById(TblChart o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblCharts.SingleOrDefault(x => x.id == o.id);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblChartDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblChartDao::FindById::" + ex.InnerException.Message);
                }
            }
        }
        
        public TblChart FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                   return db.TblCharts.Where(x=>x.id==1).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblChartDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblChartDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Create(TblChart o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblCharts.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblChartDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblChartDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Delete(TblChart o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblCharts.Where(x => x.id == o.id).Single();
                    db.TblCharts.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblChartDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblChartDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
       
        public void Update(TblChart o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblCharts.Where(x => x.id == 1).SingleOrDefault();
                    res.src1 = o.src1;
                    res.src2 = o.src2;
                    res.src3 = o.src3;
                    res.src4 = o.src4;
                    res.src5 = o.src5;
                    res.Status = o.Status;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblChartDao::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblChartDao::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
