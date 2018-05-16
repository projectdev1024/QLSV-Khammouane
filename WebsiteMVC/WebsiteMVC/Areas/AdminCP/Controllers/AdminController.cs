using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Controllers;
using WebsiteMVC.Models;

namespace WebsiteMVC.Areas.AdminCP.Controllers
{
    public class AdminController : Controller
    {
        public GiaoVien Account { get; private set; }
        public QLSVEntities db = new QLSVEntities();

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            Account = LoginHelper.GetAccountGV();
            if (Account == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new
                {
                    Controller = "Login",
                    Action = "Index"
                }));
            }
            base.OnActionExecuting(filterContext);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }

    public enum eRole
    {
        Admin,
        GiaoVien,
        HosSinh,
        QuanTri
    }
}