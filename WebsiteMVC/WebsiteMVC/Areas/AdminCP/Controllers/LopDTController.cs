using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Areas.AdminCP.Controllers
{
    public class LopDTController : AdminController
    {
        // GET: AdminCP/LopDT
        public ActionResult Index(int? IDInfoKyHoc, int? IDNganhHoc)
        {
            var info = db.InfoKyHocs.Where(q => q.Status != "DELETE");
            if (IDInfoKyHoc == null) IDInfoKyHoc = info.FirstOrDefault()?.IDInfoKyHoc;
            var minfo = info.FirstOrDefault(q => q.IDInfoKyHoc == IDInfoKyHoc);
            ViewBag.IDInfoKyHocs = info.CreateSelectList(q => q.IDInfoKyHoc, q => q.mNamHoc, IDInfoKyHoc);

            var nganh = db.NganhHocs.Where(q => q.Active != false);
            if (IDNganhHoc == null) IDNganhHoc = nganh.FirstOrDefault()?.IDNganhHoc;
            ViewBag.IDNganhHocs = nganh.CreateSelectList(q => q.IDNganhHoc, q => q.mNganhHoc, IDNganhHoc);

            ViewBag.Title = $"CÁC LỚP ĐÀO TẠO {minfo.mNamHoc}";

            var LopOfNganh = db.LopHocs.Where(q => q.IDNganhHoc == IDNganhHoc && q.Active != false).ToList();

            var mNganh = db.NganhHocs.Find(IDNganhHoc);
            var countKy = db.KyHocs.Count(q => q.Active != false);
            var lst = db.LopDTs.Where(q => q.CTDT.IDNganhHoc == IDNganhHoc && q.IDInfoKyHoc == IDInfoKyHoc).ToList();
            if (mNganh.Active != false)
            {
                mNganh.CTDTs.Where(q => q.Active != false && (q.KyHoc % countKy == minfo.KyHoc.TenHocKy || (minfo.KyHoc.TenHocKy == countKy && q.KyHoc % countKy == 0))).ToList().ForEach(q =>
               {
                   LopOfNganh.ForEach(lop =>
                   {
                       if (lst.Any(a => a.IDCTDT == q.IDCTDT && a.IDLopHoc == lop.IDLopHoc) == false)
                       {
                           lst.Add(new LopDT
                           {
                               CTDT = q,
                               IDCTDT = q.IDCTDT,
                               IDInfoKyHoc = IDInfoKyHoc,
                               IDLopDT = 0,
                               InfoKyHoc = minfo,
                               LopHoc = lop,
                               IDLopHoc = lop.IDLopHoc,
                           });
                       }
                   });
               });
            }

            ViewBag.IDPhongHocs = db.PhongHocs.Where(q => q.Active != false).CreateSelectList(q => q.IDPhongHoc, q => q.TenPhongHoc);
            ViewBag.IDGiaoViens = db.GiaoViens.Where(q => q.Active != false).CreateSelectList(q => q.IDGiaoVien, q => q.FullName);
            return View(lst);
        }

        [HttpPost]
        public ActionResult Edit(List<LopDT> lst)
        {
            lst.ForEach(lop =>
            {
                if (lop.IDLopHoc > 0)
                {
                    if (lop.IDLopDT > 0)
                    {
                        db.Entry(lop).State = System.Data.Entity.EntityState.Modified;
                    }
                    else
                    {
                        db.LopDTs.Add(lop);
                    }
                } else if(lop.IDLopDT >0)
                {
                    db.Entry(lop).State = System.Data.Entity.EntityState.Deleted;
                }
            });
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}