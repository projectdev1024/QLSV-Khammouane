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
    public class InfoKyHocController : AdminController
    {
        // GET: AdminCP/InfoKyHocs
        public ActionResult Index()
        {
            var infoKyHocs = db.InfoKyHocs.Where(q => q.Status != "DELETE");
            return View(infoKyHocs.ToList());
        }

        public JsonResult Status(int id, string status)
        {
            InfoKyHoc infoKyHoc = db.InfoKyHocs.Find(id);
            infoKyHoc.Status = status;
            return Json(db.SaveChanges());
        }

        public ActionResult Edit(int? id)
        {
            InfoKyHoc infoKyHoc = db.InfoKyHocs.Find(id) ?? new InfoKyHoc()
            {
                Status = "INIT"
            };
            ViewBag.IDKyHocs = new SelectList(db.KyHocs.Where(q => q.Active != false), "IDKyHoc", "TenHocKy", infoKyHoc.IDKyHoc);
            ViewBag.IDNamHocs = new SelectList(db.NamHocs.Where(q => q.Active != false), "IDNamHoc", "TenNamHoc", infoKyHoc.IDNamHoc);
            return View(infoKyHoc);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(InfoKyHoc infoKyHoc)
        {
            if (infoKyHoc.IDInfoKyHoc > 0)
            {
                db.Entry(infoKyHoc).State = EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                db.InfoKyHocs.Add(infoKyHoc);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult Delete(int id)
        {
            InfoKyHoc infoKyHoc = db.InfoKyHocs.Find(id);
            infoKyHoc.Status = "DELETE";
            return Json(db.SaveChanges());
        }
    }
}
