
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;

namespace TK.Business.Dao
{
    
    public partial class TblUserUnitDao
    {
        
        public TblUserUnitDao()
        {

        }
       
        public TblUserUnit FindById(TblUserUnit obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblUserUnits.SingleOrDefault(x => x.Id == obj.Id);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserUnitDao::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserUnitDao::FindByID::" + ex.InnerException.Message);
                }
            }
        }
       
        public IEnumerable<TblUserUnit> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblUserUnit>("select * from TblUserUnit").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserUnitDao::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserUnitDao::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
       
        public void Create(TblUserUnit o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblUserUnits.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserUnitDao::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserUnitDao::Create::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Delete(TblUserUnit o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblUserUnits.Where(x => x.Id == o.Id).SingleOrDefault();
                    db.TblUserUnits.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserUnitDao::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserUnitDao::Delete::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Update(TblUserUnit o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblUserUnits.Where(x => x.Id == o.Id).SingleOrDefault();
                    res.UserName = o.UserName;
                    res.UnitId = o.UnitId;
                    res.Status = o.Status;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserUnitDao::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserUnitDao::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
