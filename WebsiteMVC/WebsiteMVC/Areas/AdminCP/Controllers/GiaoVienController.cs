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
    public class GiaoVienController : AdminController
    {
        private QLSVEntities db = new QLSVEntities();

        public ActionResult Index()
        {
            return View(db.GiaoViens.ToList().Where(q=>q.Active != false));
        }

        public ActionResult Edit(int? id)
        {
            GiaoVien obj = new GiaoVien();
            if (id.HasValue)
            {
                obj = db.GiaoViens.Find(id);
            }
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(GiaoVien obj)
        {
            if (obj.IDGiaoVien > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.GiaoViens.Add(obj);
            }
            var res = this.SaveImage();
            if (res.Key) obj.Avatar = res.Value;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            GiaoVien obj = db.GiaoViens.Find(id);
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
