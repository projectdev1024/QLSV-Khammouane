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
    public class CTDTController : AdminController
    {
        public ActionResult Index(int IDNganhHoc)
        {
            ViewBag.NganhHoc = db.NganhHocs.ToList().FirstOrDefault(q => q.IDNganhHoc == IDNganhHoc);
            return View(db.CTDTs.ToList().Where(q => q.IDNganhHoc == IDNganhHoc && q.Active != false));
        }

        public ActionResult Edit(int IDNganhHoc)
        {
            var obj = db.NganhHocs.Find(IDNganhHoc);

            var lst = new List<CTDT>();
            var selected = db.CTDTs.Where(q => q.IDNganhHoc == IDNganhHoc);
            db.MonHocs.Where(q => q.Active != false).ToList().ForEach(item =>
            {
                if (selected.FirstOrDefault(q => q.IDMonHoc == item.IDMonHoc) is CTDT ob)
                {
                    lst.Add(ob);
                }
                else lst.Add(new CTDT
                {
                    Active = true,
                    IDCTDT = 0,
                    IDMonHoc = item.IDMonHoc,
                    IDNganhHoc = IDNganhHoc,
                    MonHoc = item,
                    NganhHoc = obj
                });
            });

            ViewBag.IDNganhHoc = IDNganhHoc;
            ViewBag.Title = $"Chương trình đào tạo - {obj.TenNganh}";
            return View(lst);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(List<CTDT> lst, int? IDNganhHoc)
        {
            lst.ForEach(item =>
            {
                if (item.IDCTDT > 0)
                {
                    if (db.CTDTs.Find(item.IDCTDT) is CTDT ob)
                    {
                        if (item.IDMonHoc.HasValue)
                        {
                            ob.Active = true;
                            ob.KyHoc = item.KyHoc;
                        }
                        else
                        {
                            ob.Active = false;
                        }
                    }
                }
                else if (item.IDMonHoc.HasValue)
                {
                    db.CTDTs.Add(item);
                }
            });
            db.SaveChanges();
            return RedirectToAction("Index", "KhoiHoc");
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
