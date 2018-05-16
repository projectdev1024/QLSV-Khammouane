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
    public class HocPhiController : AdminController
    {
        private QLSVEntities db = new QLSVEntities();

        public ActionResult Index()
        {
            return View(db.HocPhis.ToList());
        }

        public ActionResult Edit(int? id)
        {
            HocPhi obj = new HocPhi();
            if (id.HasValue)
            {
                obj = db.HocPhis.Find(id);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDNamHocs = db.NamHocs.Where(q => q.Active != false).CreateSelectList(q => q.IDNamHoc, q => q.TenNamHoc, obj.IDInfoKyHoc);
            ViewBag.IDKyHocs = db.KyHocs.Where(q => q.Active != false).CreateSelectList(q => q.IDKyHoc, q => q.TenHocKy, obj.IDInfoKyHoc);
            ViewBag.IDSinhViens = db.SinhViens.Where(q => q.Active != false).CreateSelectList(q => q.IDSinhVien, q => q.FullName, obj.IDSinhVien);
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(HocPhi obj)
        {
            if (obj.IDHocPhi > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.HocPhis.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            HocPhi sinhVien = db.HocPhis.Find(id);
            db.HocPhis.Remove(sinhVien);
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
