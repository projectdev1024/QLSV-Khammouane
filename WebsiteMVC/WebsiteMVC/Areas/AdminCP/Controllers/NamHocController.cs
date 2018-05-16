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
    public class NamHocController : AdminController
    {
        private QLSVEntities db = new QLSVEntities();

        public ActionResult Index()
        {
            return View(db.NamHocs.ToList().Where(q=>q.Active != false));
        }

        public ActionResult Edit(int? id)
        {
            NamHoc obj = new NamHoc();
            if (id.HasValue)
            {
                obj = db.NamHocs.Find(id);
            }
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(NamHoc obj)
        {
            if (obj.IDNamHoc > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.NamHocs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            NamHoc obj = db.NamHocs.Find(id);
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
