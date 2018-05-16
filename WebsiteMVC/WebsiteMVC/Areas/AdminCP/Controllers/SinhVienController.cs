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
    public class SinhVienController : AdminController
    {
        private QLSVEntities db = new QLSVEntities();

        public ActionResult Index()
        {
            return View(db.SinhViens.ToList().Where(q => q.Active != false));
        }

        public ActionResult Edit(int? id)
        {
            SinhVien obj = new SinhVien();
            if (id.HasValue)
            {
                obj = db.SinhViens.Find(id);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDLopHocs = db.LopHocs.ToList().Where(q => q.Active != false).CreateSelectList(q => q.IDLopHoc, q => q.TenLopHoc, obj.IDLopHoc);
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(SinhVien obj)
        {
            if (obj.IDSinhVien > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                obj.Password = obj.Birthday.HasValue ? obj.Birthday.Value.ToString("ddMMyyyy") : "01011990";
                obj.Username = $"{obj.IDLopHoc}{db.LopHocs.FirstOrDefault(q => q.IDLopHoc == obj.IDLopHoc)?.Code}{obj.IDSinhVien}";
                db.SinhViens.Add(obj);
            }
            var res = this.SaveImage();
            if (res.Key)
            {
                obj.Avatar = res.Value;
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            SinhVien sinhVien = db.SinhViens.Find(id);
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
