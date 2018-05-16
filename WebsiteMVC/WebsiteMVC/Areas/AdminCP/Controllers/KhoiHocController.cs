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
    public class KhoiHocController : AdminController
    {
        private QLSVEntities db = new QLSVEntities();

        public ActionResult Index()
        {
            return View(db.KhoiHocs.ToList().Where(q=>q.Active != false));
        }

        public ActionResult Edit(int? id)
        {
            KhoiHoc obj = new KhoiHoc();
            if (id.HasValue)
            {
                obj = db.KhoiHocs.Find(id);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(KhoiHoc obj)
        {
            if (obj.IDKhoiHoc > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                obj.Active = true;
                db.KhoiHocs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            KhoiHoc sinhVien = db.KhoiHocs.Find(id);
            sinhVien.Active = false;
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
