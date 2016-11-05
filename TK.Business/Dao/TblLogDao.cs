
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;

namespace TK.Business.Dao
{
    
    public partial class TblLogDao
    {
        
        public TblLogDao()
        {

        }
        
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

