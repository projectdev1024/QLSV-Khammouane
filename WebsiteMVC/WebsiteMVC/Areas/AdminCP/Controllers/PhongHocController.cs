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
    public class PhongHocController : AdminController
    {
        public ActionResult Index()
        {
            return View(db.PhongHocs.ToList().Where(q=>q.Active != false));
        }

        public ActionResult Edit(int? id)
        {
            PhongHoc obj = new PhongHoc();
            if (id.HasValue)
            {
                obj = db.PhongHocs.Find(id);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(PhongHoc obj)
        {
            if (obj.IDPhongHoc > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.PhongHocs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            PhongHoc obj = db.PhongHocs.Find(id);
            obj.Active = false;
            return Json(db.SaveChanges());
        }

    }
}
