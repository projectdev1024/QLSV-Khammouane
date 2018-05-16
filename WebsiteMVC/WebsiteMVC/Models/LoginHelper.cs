using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteMVC.Models
{
    public class LoginHelper
    {
        public static string LOGIN = "LOGIN";
        public static string LOGINGV = "LOGINGV";

        public static bool CheckLogin(string Username, string Password)
        {
            var acc = new QLSVEntities().SinhViens.FirstOrDefault(q => q.Username == Username && q.Password == Password && q.Active != false);
            HttpContext.Current.Session[LOGIN] = acc;
            return acc != null;
        }

        public static SinhVien GetAccount()
        {
            return HttpContext.Current.Session[LOGIN] as SinhVien;
        }

        public static GiaoVien GetAccountGV()
        {
            return HttpContext.Current.Session[LOGINGV] as GiaoVien;
        }

        public static void Logout()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session[LOGIN] = null;
        }
    }
}