
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
