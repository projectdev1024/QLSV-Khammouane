using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebsiteMVC.Controllers
{
    public class XemDiemController : BaseController
    {
        // GET: XemDiem
        public ActionResult Index()
        {
            var lst = db.KQHTs.Where(q => q.IDSinhVien == Account.IDSinhVien);
            return View(lst);
        }
    }
}