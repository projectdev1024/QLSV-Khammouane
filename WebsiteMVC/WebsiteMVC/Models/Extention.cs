﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;

namespace WebsiteMVC.Models
{
    public static class Extention
    {
        public static string GetPropertyName<T, Y>(this Expression<Func<T, Y>> expression)
        {
            if (expression.Body is MemberExpression member)
                return member.Member.Name;
            return ((expression.Body as UnaryExpression).Operand as MemberExpression).Member.Name;
        }

        public static SelectList CreateSelectList<T>(this IEnumerable<T> source, Expression<Func<T, object>> value, Expression<Func<T, object>> display, object selectedValue = null)
        {
            if (selectedValue == null) return new SelectList(source, value.GetPropertyName(), display.GetPropertyName());
            return new SelectList(source, value.GetPropertyName(), display.GetPropertyName(), selectedValue);
        }

        public static KeyValuePair<bool, string> SaveImage(this Controller controller)
        {
            var files = HttpContext.Current.Request.Files;
            if (files.Count == 1)
            {
                var file = files[0];
                if (file != null && file.ContentType.Contains("image") && file.ContentLength > 0)
                {
                    var name_file = $"{DateTime.Now.ToString("hhmmssddMMyyyy")}_{Path.GetFileName(file.FileName)}";
                    var path = "/Content/Upload/img/" + name_file;
                    file.SaveAs(HttpContext.Current.Server.MapPath(path));
                    return new KeyValuePair<bool, string>(true, path);
                }
            }
            return new KeyValuePair<bool, string>(false, null);
        }
    }
}