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
    public class KyHocController : AdminController
    {
        private QLSVEntities db = new QLSVEntities();

        public ActionResult Index()
        {
            return View(db.KyHocs.ToList().Where(q=>q.Active != false));
        }

        public ActionResult Edit(int? id)
        {
            KyHoc obj = new KyHoc();
            if (id.HasValue)
            {
                obj = db.KyHocs.Find(id);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(KyHoc obj)
        {
            if (obj.IDKyHoc > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.KyHocs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            KyHoc obj = db.KyHocs.Find(id);
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
