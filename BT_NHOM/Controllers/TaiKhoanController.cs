using BT_NHOM.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace BT_NHOM.Controllers
{
    public class TaiKhoanController : RedirectingActionController
    {
        private QLBSPhuongNamEntities db = new QLBSPhuongNamEntities();
        // GET: TaiKhoan
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien nhanVien = db.NhanViens.Find(id);
            if (nhanVien == null)
            {
                return HttpNotFound();
            }

            return View(nhanVien);
        }

        // POST: DienThoai_60131640/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNV,HoNV,TenNV,GioiTinh,DiaChi,SoDTNV,AnhNV,Email,MatKhau,IDNhom")] NhanVien nhanVien)
        {
            var imgNV = Request.Files["Avatar"];
            try
            {
                //Lấy thông tin từ input type=file có tên Avatar
                string postedFileName = System.IO.Path.GetFileName(imgNV.FileName);
                //Lưu hình đại diện về Server
                var path = Server.MapPath("/Images/" + postedFileName);
                imgNV.SaveAs(path);
            }
            catch
            { }
            if (ModelState.IsValid)
            {
                db.Entry(nhanVien).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }

            return View();
        }

        public ActionResult Details()
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            NhanVien temp = session.GetById(session.Email);
            NhanVien nv = db.NhanViens.Find(temp.MaNV);
            return View(nv);
        }

        public ActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(ChangePasswordModel obj)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            NhanVien temp = session.GetById(session.Email);
            NhanVien nv = db.NhanViens.Find(temp.MaNV);
            if (ModelState.IsValid)
            {
                if (nv.Matkhau == GetMD5(obj.OldPassword))
                {
                    if (nv.Matkhau == GetMD5(obj.NewPassword))
                    {
                        ModelState.AddModelError("", "Mật khẩu mới phải khác mật khẩu cũ");
                    }
                    else
                    {
                        nv.Matkhau = GetMD5(obj.NewPassword);
                        db.Entry(nv).State = EntityState.Modified;
                        db.SaveChanges();
                        ViewBag.Message = "Mật khẩu của bạn thay đổi thành công";
                        return RedirectToAction("Updatesuccess", "Home");
                    }
                }
                else
                {

                    ModelState.AddModelError("", "Mật khẩu cũ không chính xác");
                }
            }
            return View();
        }

        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
    }
}