using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;

namespace BT_NHOM.Models
{
    public class ViewModels
    {
        public IPagedList<Sach> Saches { get; set; }
        public IEnumerable<TheLoai> TheLoais { get; set; }
        /*public TheLoai theLoais { get; set; }*/
        public Sach sachNormal { get; set; }
        public HoaDon hoaDon { get; set; }
        public NhanVien nhanVien { get; set; }
        public ChiTietHD cthd { get; set; }
        public NhanVien nv { get; set; }
    }
}