using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Areas.AdminCP.Controllers
{
    public class MonHocController : AdminController
    {
        public ActionResult Index()
        {
            return View(db.MonHocs.ToList().Where(q => q.Active != false));
        }

        public ActionResult Edit(int? id)
        {
            MonHoc obj = new MonHoc();
            if (id.HasValue)
            {
                obj = db.MonHocs.Find(id);
            }
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(MonHoc obj)
        {
            if (obj.IDMonHoc > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.MonHocs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            MonHoc obj = db.MonHocs.Find(id);
            obj.Active = false;
            return Json(db.SaveChanges());
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
