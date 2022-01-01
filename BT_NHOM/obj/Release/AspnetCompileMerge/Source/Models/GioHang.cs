using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BT_NHOM.Models;

namespace BT_NHOM.Models
{
    public class GioHang
    {
        QLBSPhuongNamEntities db = new QLBSPhuongNamEntities();

        public string iMaSP { get; set; }
        public string iTenSP { get; set; }
        public string iAnhBia { get; set; }
        public int iDonGia { get; set; }
        public int iSoLuong { get; set; }
        public double iThanhTien { get { return iSoLuong * iDonGia; } }

        public GioHang(string Ma)
        {
            iMaSP = Ma;
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == iMaSP);
            iTenSP = sach.TenSach;
            iAnhBia = sach.AnhBia;
            iDonGia = (int)decimal.Parse(sach.GiaSach.ToString());
            iSoLuong = 1;
        }
    }
}