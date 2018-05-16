using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Controllers
{
    public class TinTucController : Controller
    {
        // GET: TinTuc
        public ActionResult Index()
        {
            var lst = new QLSVEntities().TinTucs.ToList();
            return View(lst.Take(10));
        }

        public ActionResult ChiTiet(int IDTinTuc)
        {
            var db = new QLSVEntities();
            var obj = db.TinTucs.Find(IDTinTuc);
            obj.CountView++;
            db.SaveChanges();
            return View(obj);
        }

        public ActionResult TopTinTuc(int length = 9)
        {
            return View(new QLSVEntities().TinTucs.Where(q => q.ThongBao != true).OrderBy(q => q.CreateTime).Take(length));
        }

        public ActionResult TopHot(int length = 4)
        {
            return View(new QLSVEntities().TinTucs.Where(q => q.ThongBao != true).OrderByDescending(q => q.CountView).Take(length));
        }

        public ActionResult TopTB(int length = 5)
        {
            return View(new QLSVEntities().TinTucs.Where(q => q.ThongBao == true).OrderBy(q => q.CreateTime).Take(length));
        }
    }
}