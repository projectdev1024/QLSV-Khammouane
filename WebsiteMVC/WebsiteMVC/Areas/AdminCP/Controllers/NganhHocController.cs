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
    public class NganhHocController : AdminController
    {
        public ActionResult Edit(int? id, int? IDKhoiHoc)
        {
            NganhHoc obj = new NganhHoc()
            {
                IDKhoiHoc = IDKhoiHoc
            };
            if (id.HasValue)
            {
                obj = db.NganhHocs.Find(id);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDKhoiHocs = db.KhoiHocs.CreateSelectList(q => q.IDKhoiHoc, q => q.TenKhoiHoc, obj.IDKhoiHoc);
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(NganhHoc obj)
        {
            if (obj.IDNganhHoc > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                obj.Active = true;
                db.NganhHocs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index","KhoiHoc");
        }

        public JsonResult Delete(int id)
        {
            NganhHoc sinhVien = db.NganhHocs.Find(id);
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
