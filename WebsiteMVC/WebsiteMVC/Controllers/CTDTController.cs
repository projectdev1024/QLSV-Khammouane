using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Controllers
{
    public class CTDTController : BaseController
    {
        // GET: CTDT
        public ActionResult Index(int? IDNganhHoc)
        {
            var lsts = db.CTDTs.Where(q => q.IDNganhHoc == IDNganhHoc && q.Active != false);
            ViewBag.IDNganhHocs = db.NganhHocs.Where(q => q.Active != false).CreateSelectList(q => q.IDNganhHoc, q => q.TenNganh, IDNganhHoc);
            return View(lsts); 
        }
    }
}