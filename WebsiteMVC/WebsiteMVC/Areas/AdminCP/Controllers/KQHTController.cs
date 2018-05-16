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
    public class KQHTController : AdminController
    {
        public ActionResult Index()
        {
            var info = db.InfoKyHocs.FirstOrDefault(q => q.Status == "RUNNING");
            return View(db.LopDTs.Where(q => q.IDInfoKyHoc == info.IDInfoKyHoc));
        }

        public ActionResult NhapDiem(int IDLopDT)
        {
            return View(db.KQHTs.Where(q => q.IDLopDT == IDLopDT).ToList());
        }

        [HttpPost]
        public ActionResult NhapDiem(List<KQHT> lst)
        {
            lst.ForEach(q =>
            {
                q.DTK = (q.DTP * 3 + q.DT * 7) / 10;
                q.Pass = q.DTK >= 4;
                db.Entry(q).State = EntityState.Modified;
            });
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int? id)
        {
            KQHT obj = new KQHT();
            if (id.HasValue)
            {
                obj = db.KQHTs.Find(id);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(KQHT obj)
        {
            if (obj.IDKQHT > 0)
            {
                db.Entry(obj).State = EntityState.Modified;
            }
            else
            {
                db.KQHTs.Add(obj);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            KQHT sinhVien = db.KQHTs.Find(id);
            db.KQHTs.Remove(sinhVien);
            return Json(db.SaveChanges());
        }
    }
}
