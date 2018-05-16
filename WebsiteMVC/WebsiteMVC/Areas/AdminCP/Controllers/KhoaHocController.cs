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
    public class KhoaHocController : AdminController
    {
        //public ActionResult Index(int? IDNamHoc, int? IDKyHoc, int? IDNganhHoc, bool LOC = true)
        //{
        //    var namhocs = db.NamHocs.Where(q => q.Active != false);
        //    if (IDNamHoc.HasValue == false) IDNamHoc = namhocs.FirstOrDefault()?.IDNamHoc;

        //    var kihocs = db.KyHocs.Where(q => q.Active != false);
        //    if (IDKyHoc.HasValue == false) IDKyHoc = kihocs.FirstOrDefault()?.IDKyHoc;

        //    var nganhs = db.NganhHocs.Where(q => q.Active != false);
        //    if (IDNganhHoc.HasValue == false) IDNganhHoc = nganhs.FirstOrDefault()?.IDNganhHoc;

        //    if (LOC == false)
        //    {
        //        return RedirectToAction("Edit", new { IDNamHoc, IDKyHoc, IDNganhHoc });
        //    }

        //    ViewBag.IDNamHocs = namhocs.CreateSelectList(q => q.IDNamHoc, q => q.TenNamHoc, IDNamHoc);
        //    ViewBag.IDKyHocs = kihocs.CreateSelectList(q => q.IDKyHoc, q => q.TenHocKy, IDKyHoc);
        //    ViewBag.IDNganhHocs = nganhs.CreateSelectList(q => q.IDNganhHoc, q => q.TenNganh, IDNganhHoc);
        //    return View(db.LopDTs.Where(q => q.IDNamHoc == IDNamHoc && q.IDKyHoc == IDKyHoc && q.CTDT.IDNganhHoc == IDNganhHoc));
        //}

        //public ActionResult Edit(int IDNamHoc, int IDKyHoc, int IDNganhHoc)
        //{
        //    var lst = new List<LopDT>();
        //    var khoahocs = db.LopDTs.Where(q => q.IDNamHoc == IDNamHoc && q.IDKyHoc == IDKyHoc && q.CTDT.IDNganhHoc == IDNganhHoc);
        //    db.CTDTs.Where(q => q.Active != false && q.IDNganhHoc == IDNganhHoc).ToList().ForEach(item =>
        //    {
        //        db.LopHocs.Where(q => q.Active != false && q.IDNganhHoc == IDNganhHoc).ToList().ForEach(lop =>
        //        {
        //            if (khoahocs.FirstOrDefault(q => q.IDCTDT == item.IDCTDT) is     ob)
        //            {
        //                lst.Add(ob);
        //            }
        //            else
        //            {
        //                lst.Add(new LopDT
        //                {
        //                    CTDT = item,
        //                    IDCTDT = item.IDCTDT,
        //                    IDKyHoc = IDKyHoc,
        //                    IDNamHoc = IDNamHoc,
        //                    IDLopDT = 0,
        //                    IDLopHoc = lop.IDLopHoc,
        //                    LopHoc = lop,
        //                });
        //            }
        //        });
        //    });
        //    ViewBag.IDGiaoViens = db.GiaoViens.Where(q => q.Active != false).CreateSelectList(q => q.IDGiaoVien, q => q.FullName);

        //    ViewBag.IDNamHoc = IDNamHoc;
        //    ViewBag.IDKyHoc = IDKyHoc;
        //    ViewBag.IDNganhHoc = IDNganhHoc;
        //    return View(lst);
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit(List<LopDT> lst, int IDNamHoc, int IDKyHoc, int IDNganhHoc)
        //{
        //    lst.ForEach(item =>
        //    {
        //        if (item.IDLopDT > 0)
        //        {
        //            if (db.LopDTs.Find(item.IDLopDT) is LopDT ob)
        //            {
        //                if (item.IDCTDT.HasValue)
        //                {
        //                    ob.IDGiaoVien = item.IDGiaoVien;
        //                }
        //                else
        //                {
        //                    db.LopDTs.Remove(item);
        //                }
        //            }
        //        }
        //        else if (item.IDCTDT.HasValue)
        //        {
        //            db.LopDTs.Add(item);
        //        }
        //    });
        //    db.SaveChanges();
        //    return RedirectToAction("Index", new { IDNamHoc, IDKyHoc, IDNganhHoc });
        //}

        public JsonResult Delete(int id)
        {
            LopDT obj = db.LopDTs.Find(id);
            db.LopDTs.Remove(obj);
            return Json(db.SaveChanges());
        }

        public ActionResult Chart()
        {
            return View();
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
