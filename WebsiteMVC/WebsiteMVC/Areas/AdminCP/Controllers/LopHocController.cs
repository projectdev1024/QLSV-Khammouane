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
    public class LopHocController : AdminController
    {
        private QLSVEntities db = new QLSVEntities();

        public ActionResult Index()
        {
            return View(db.LopHocs.ToList().Where(q=>q.Active !=false));
        }

        public ActionResult Edit(int? id)
        {
            LopHoc obj = new LopHoc();
            if (id.HasValue)
            {
                obj = db.LopHocs.Find(id);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDNganhHocs = db.NganhHocs.ToList().Where(q => q.Active != false).CreateSelectList(q => q.IDNganhHoc, q => q.TenNganh, obj.IDLopHoc);
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(LopHoc obj)
        {
            if (obj.IDLopHoc > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.LopHocs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            LopHoc obj = db.LopHocs.Find(id);
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
