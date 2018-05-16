using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteMVC.Models
{
    public partial class InfoKyHoc
    {
        public string mNamHoc => $"Kỳ {KyHoc.TenHocKy} - {NamHoc.TenNamHoc}";
        public string sStatus
        {
            get
            {
                var s = "";
                switch (Status)
                {
                    case "INIT":
                        s = "Đang lên kế hoạch";
                        break;
                    case "OPEN":
                        s = "Mở đăng kí môn học";
                        break;
                    case "RUNNING":
                        s = "Đang giảng dạy";
                        break;
                    case "CLOSED":
                        s = "Kết thúc";
                        break;
                    default:
                        break;
                }
                return s;
            }
        }
    }

    public partial class NganhHoc
    {
        public string mNganhHoc => $"Ngành {TenNganh} - Khối {KhoiHoc.TenKhoiHoc}";
    }
}