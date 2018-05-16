using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteMVC.Models;

namespace WebsiteMVC.Controllers
{
    public class BaseController : Controller , IDisposable
    {
        public SinhVien Account { get; private set; }

        public QLSVEntities db = new QLSVEntities();

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            Account = Models.LoginHelper.GetAccount();
            if (Account == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new
                {
                    Controller = "Login",
                    Action = "Index",
                    Area = ""
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
}