using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;

namespace TK.Business.Dao
{
    public partial class TblUserDao
    {
        public TblUser FindByName(string username)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblUsers.SingleOrDefault(x => x.Username == username);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserDao::FindByName::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserDao::FindByName::" + ex.InnerException.Message);
                }
            }
        }
    }
}
