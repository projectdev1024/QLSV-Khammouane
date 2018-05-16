using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebsiteMVC.Controllers
{
    public class HocPhiController : BaseController
    {
        // GET: HocPhi
        public ActionResult Index()
        {
            var info = db.InfoKyHocs.FirstOrDefault(q => q.Status == "RUNNING" || q.Status == "OPEN");
            ViewBag.HocPhi = db.HocPhis.FirstOrDefault(q => q.IDInfoKyHoc == info.IDInfoKyHoc);
            ViewBag.Account = Account;
            ViewBag.Title = $"Học phí sinh viên: {Account.FullName} - {info.mNamHoc}";
            return View(db.LopDTs.Where(q => q.InfoKyHoc.IDInfoKyHoc == info.IDInfoKyHoc));
        }
    }
}