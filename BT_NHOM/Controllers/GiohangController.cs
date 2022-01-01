using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BT_NHOM.Models;

namespace BT_NHOM.Controllers
{
    public class GiohangController : Controller
    {
        // GET: Giohang
        QLBSPhuongNamEntities db = new QLBSPhuongNamEntities();
        // GET: GioHang
        public ActionResult Index()
        {
            return View();
        }
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        public ActionResult ThemGioHang(string Ma, string strURL)
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == Ma);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang gh = lstGioHang.Find(n => n.iMaSP == Ma);
            if (gh == null)
            {
                gh = new GioHang(Ma);
                lstGioHang.Add(gh);
                return Redirect(strURL);
            }
            else
            {
                gh.iSoLuong++;
                return Redirect(strURL);
            }
        }
        public ActionResult CapNhatGioHang(string Ma, FormCollection f)
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == Ma);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMaSP == Ma);
            if (sanpham != null)
            {
                sanpham.iSoLuong = int.Parse(f["txtSoLuong"]);
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaGioHang(string Ma)
        {
            Sach sach = db.Saches.SingleOrDefault(n => n.MaSach == Ma);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMaSP == Ma);
            if (sanpham != null)
            {
                lstGioHang.RemoveAll(n => n.iMaSP == Ma);

            }
            if (lstGioHang.Count == 0)
            {
                return RedirectToAction("GioHang", "Giohang");
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult GioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Sach", "Sach");

            }
            List<GioHang> lstGioHang = LayGioHang();

            return View(lstGioHang);
        }
        public int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                iTongSoLuong = lstGioHang.Sum(n => n.iSoLuong);
            }
            else
            {
                iTongSoLuong = 0;
            }
            return iTongSoLuong;
        }
        public double TongTien()
        {
            double iTongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                iTongTien = lstGioHang.Sum(n => n.iThanhTien);
            }
            return iTongTien;
        }
        
        public ActionResult SuaGioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Sach", "Sach");

            }
            List<GioHang> lstGioHang = LayGioHang();
            return View(lstGioHang);

        }
        string LayMaHD()
        {
            var maMax = db.HoaDons.ToList().Select(n => n.MaHD).Max();
            int maHD = int.Parse(maMax.Substring(2)) + 1;
            string HD = String.Concat("00", maHD.ToString());
            return "HD" + HD.Substring(maHD.ToString().Length - 1);
        }
        public PartialViewResult TB()
        {
            if (TongSoLuong() == 0)
            {
                ViewBag.TB = "Không có mặt hàng trong giỏ hàng";
            }
            else
            {
                ViewBag.TB = "";
            }
            return PartialView();
        }
        public PartialViewResult TongSLHang()
        {
            if (TongSoLuong() == 0)
            {
                ViewBag.TB = TB();
                List<GioHang> lstGioHang = LayGioHang();
                return PartialView(lstGioHang);

            }
            else
            {
                ViewBag.TB = TB();
                ViewBag.TongSoLuong = TongSoLuong();
                ViewBag.TongTien = TongTien();
                return PartialView();
            }

        }
        public PartialViewResult TongSLHangMB()
        {
            if (TongSoLuong() == 0)
            {
                ViewBag.TB = TB();
                List<GioHang> lstGioHang = LayGioHang();
                return PartialView(lstGioHang);

            }
            else
            {
                ViewBag.TB = TB();
                ViewBag.TongSoLuong = TongSoLuong();
                ViewBag.TongTien = TongTien();
                return PartialView();
            }

        }
        [HttpPost]
        public ActionResult DatHang(string tenKH ="", string sdt="", string diaChi="")
        {
            //Xem thử đang nhập hay là chưa?
            /*if (Session["TaiKhoan"] == null || Session["TaiKhoan"] == "")
            {
                return RedirectToAction("AdminView", "Gioithieu");
            }*/
            //Xem trong giỏ hàng có hàng nào chưa
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            } else
            {
                HoaDon hd = new HoaDon();
                //khach hang mua don hang la ai.
                //KhachHang kh = (KhachHang)Session["TaiKhoan"];            
                List<GioHang> gh = LayGioHang();
                /*int stt = 17;
                if (stt + 1 < 100)
                {
                    hd.MaHD = "HD0" + (stt + 1).ToString();
                }    */
                ViewBag.tenKH = tenKH;
                ViewBag.diaChi = diaChi;
                ViewBag.sdt = sdt;
                hd.MaHD = LayMaHD();
                //ngay mua hang.
                hd.TinhTrang = 1;
                hd.NgayXuatKho = DateTime.Now;
                hd.NgayGiao = DateTime.Now.AddDays(+3);
                hd.TenKH = tenKH.ToString();
                hd.SoDT = sdt.ToString();
                hd.DiaChiGiao = diaChi.ToString();
                hd.MaNV = "NV01";
                db.HoaDons.Add(hd);
                db.SaveChanges();
                foreach (var item in gh)
                {
                    ChiTietHD cthd = new ChiTietHD();
                    cthd.MaHD = hd.MaHD;
                    cthd.MaSach = item.iMaSP;
                    cthd.SoLuongSach = item.iSoLuong;
                    cthd.GiaBan = (decimal)item.iThanhTien;
                    db.ChiTietHDs.Add(cthd);
                }
                db.SaveChanges();
                ChiTietHD ct = new ChiTietHD();
                db.ChiTietHDs.SqlQuery("update ChiTietHD set SoLuongSach = '" + ct.SoLuongSach + "' where MaHD = '" + ct.MaHD + "'");
                List<GioHang> lstGioHang = LayGioHang();
                lstGioHang.Clear();
                return RedirectToAction("Index", "Saches");
            }


        }
    }
}