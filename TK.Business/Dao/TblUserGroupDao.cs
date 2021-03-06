﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TK.Business.Data;

namespace TK.Business.Dao
{
    
    public partial class TblUserGroupDao
    {
        
        public TblUserGroupDao()
        {

        }
        
        public TblUserGroup FindById(TblUserGroup obj)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.TblUserGroups.SingleOrDefault(x => x.Id == obj.Id);
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserGroup::FindById::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserGroup::FindById::" + ex.InnerException.Message);
                }
            }
        }
        
        public IEnumerable<TblUserGroup> FindByAll()
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    return db.Database.SqlQuery<TblUserGroup>("select * from TblUserGroup").ToList();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserGroup::FindByAll::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserGroup::FindByAll::" + ex.InnerException.Message);
                }
            }
        }
       
        public void Create(TblUserGroup o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    db.TblUserGroups.Add(o);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserGroup::Create::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserGroup::Create::" + ex.InnerException.Message);
                }
            }
        }
        
        public void Delete(TblUserGroup o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblUserGroups.Where(x => x.Id == o.Id).SingleOrDefault();
                    db.TblUserGroups.Remove(res);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserGroup::Delete::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserGroup::Delete::" + ex.InnerException.Message);
                }
            }
        }
       
        public void Update(TblUserGroup o)
        {
            try
            {
                using (TkSchoolDbContext db = new TkSchoolDbContext())
                {
                    var res = db.TblUserGroups.Where(x => x.Id == o.Id).SingleOrDefault();
                    res.Username = o.Username;
                    res.GroupId = o.GroupId;
                    res.Status = o.Status;
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                if (ex.InnerException == null)
                {
                    throw new Exception("TblUserGroup::Update::" + ex.Message);
                }
                else
                {
                    throw new Exception("TblUserGroup::Update::" + ex.InnerException.Message);
                }
            }
        }
    }
}
