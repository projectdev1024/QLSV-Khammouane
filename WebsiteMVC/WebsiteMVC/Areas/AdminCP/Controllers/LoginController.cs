using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Areas.AdminCP.Controllers
{
    public class LoginController : Controller
    {
        // GET: AdminCP/Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(string username,string password)
        {
            var db = new QLSVEntities();
            var gv = db.GiaoViens.FirstOrDefault(q => q.Username == username && q.Password == password && q.Active != false);
            if (gv != null)
            {
                Session.Clear();
                Session["LOGINGV"] = gv;
                return RedirectToAction("Index", "SinhVien");
            }
            ModelState.AddModelError("", "Đăng nhập thất bại");
            return View();
        }

        public ActionResult Logout()
        {
            Models.LoginHelper.Logout();
            return RedirectToAction("Index");
        }
    }
}