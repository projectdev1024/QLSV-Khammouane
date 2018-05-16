using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Controllers
{
    public class DKMHController : BaseController
    {
        // GET: DKMH
        public ActionResult Index()
        {
            var info = db.InfoKyHocs.FirstOrDefault(q => q.Status == "OPEN");
            if (info != null)
            {

                var lopdts = db.LopDTs.Where(q => q.CTDT.IDNganhHoc == Account.LopHoc.IDNganhHoc && q.IDInfoKyHoc == info.IDInfoKyHoc);
                var lst = db.KQHTs.Where(q => q.IDSinhVien == Account.IDSinhVien && q.LopDT.IDInfoKyHoc == info.IDInfoKyHoc).ToList();
                foreach (var item in lopdts)
                {
                    if (lst.Any(q => q.IDLopDT == item.IDLopDT) == false)
                    {
                        lst.Add(new KQHT
                        {
                            IDKQHT = 0,
                            IDLopDT = item.IDLopDT,
                            IDSinhVien = Account.IDSinhVien,
                            LopDT = item,
                            SinhVien = Account,
                            Pass = false
                        });
                    }
                }
                ViewBag.info = info;
                ViewBag.Title = $"Đăng kí môn học {info.mNamHoc}";
                return View(lst);
            }
            else
            {
                ViewBag.Title = "HIỆN CHƯA NHÀ TRƯỜNG CHƯA MỞ ĐĂNG KÍ MÔN HỌC";
                return View(new List<KQHT>());
            }
        }

        [HttpPost]
        public ActionResult Index(List<KQHT> lst)
        {
            lst.ForEach(q =>
            {
                if (q.IDKQHT > 0)
                {
                    if (q.IDLopDT > 0)
                    {
                        db.Entry(q).State = System.Data.Entity.EntityState.Modified;
                    }
                    else
                    {
                        db.KQHTs.Remove(q);
                    }
                }
                else if (q.IDLopDT > 0)
                {
                    db.KQHTs.Add(q);
                }
            });
            db.SaveChanges();

            var info = db.InfoKyHocs.FirstOrDefault(q => q.Status == "OPEN");
            var hocphi = db.HocPhis.FirstOrDefault(q => q.IDSinhVien == Account.IDSinhVien && q.InfoKyHoc.Status == "OPEN");
            if (hocphi == null) hocphi = new HocPhi()
            {
                IDSinhVien = Account.IDSinhVien,
                IDInfoKyHoc = info.IDInfoKyHoc
            };
            hocphi.Paid = 0;
            hocphi.Total = db.KQHTs.Where(q => q.IDSinhVien == Account.IDSinhVien && q.LopDT.IDInfoKyHoc == info.IDInfoKyHoc).Sum(q => q.LopDT.CTDT.MonHoc.SoTC * info.PhiTC);
            hocphi.Status = "0";
            db.HocPhis.Add(hocphi);

            db.SaveChanges();
            return RedirectToAction("Success");
        }

        public ActionResult Success()
        {
            return View();
        }
    }
}