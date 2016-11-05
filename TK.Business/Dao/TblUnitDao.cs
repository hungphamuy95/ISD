
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;
using PagedList;

namespace TK.Business.Dao
{
    

    public partial class TblUnitDao
    {
        

        public TblUnitDao()
        {

        }
        

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
