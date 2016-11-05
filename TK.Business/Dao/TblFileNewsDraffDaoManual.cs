
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
