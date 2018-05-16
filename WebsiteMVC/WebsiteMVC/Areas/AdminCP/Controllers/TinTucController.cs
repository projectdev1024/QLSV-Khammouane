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
    public class TinTucController : AdminController
    {
        public ActionResult Index()
        {
            return View(db.TinTucs.Where(q => q.Active != false).ToList());
        }

        public ActionResult Edit(int? id)
        {
            TinTuc obj = new TinTuc();
            if (id.HasValue)
            {
                obj = db.TinTucs.Find(id);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(TinTuc obj)
        {
            var res = this.SaveImage();
            if (res.Key) obj.Image = res.Value;
            if (obj.IDTinTuc > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                obj.Active = true;
                obj.CreateBy = Account.IDGiaoVien;
                obj.CreateTime = DateTime.Now;
                db.TinTucs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            TinTuc obj = db.TinTucs.Find(id);
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
