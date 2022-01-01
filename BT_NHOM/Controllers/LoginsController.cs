using BT_NHOM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace BT_NHOM.Controllers
{
    public class LoginsController : Controller
    {
        private QLBSPhuongNamEntities db = new QLBSPhuongNamEntities();
        // GET: Logins
        // GET: NguoiDungs
        // [HasCredential(RoleID = "VIEW_USER")]
        //public ActionResult Index()
        //{
        //    if (Session[Models.CommonConstants.USER_SESSION] != null)
        //    {
        //        //Session["FullName"] = db.NguoiDungs.FirstOrDefault().FirstName + " " + db.NguoiDungs.FirstOrDefault().LastName;
        //        //return View("~/Views/Saches/Index.cshtml");
        //        return View();
        //    }
        //    else
        //    {
        //        return RedirectToAction("Login");
        //    }
        //}

        //GET: Register

        //public ActionResult Register()
        //{
        //    return View();
        //}

        ////POST: Register
        //[HttpPost]

        //[ValidateAntiForgeryToken]
        //public ActionResult Register(Nhan nguoiDung)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var check = db.NguoiDungs.FirstOrDefault(s => s.Email == nguoiDung.Email);
        //        if (check == null)
        //        {
        //            nguoiDung.Password = GetMD5(nguoiDung.Password);
        //            db.Configuration.ValidateOnSaveEnabled = false;
        //            db.NguoiDungs.Add(nguoiDung);
        //            db.SaveChanges();
        //            return RedirectToAction("Login", "NguoiDungs");
        //        }
        //        else
        //        {
        //            ViewBag.error = "Email already exists";
        //            return View();
        //        }
        //    }
        //    return View();


        //}

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string Email, string Password, bool isLoginAdmin = false)
        {

            var f_password = GetMD5(Password);
            var userSession = new UserLogin();
            var result = userSession.Login(Email, f_password, true);

            if (result == 1)
            {
                //add session
                //Này đang nhập cho cả nv và kh nhỉ
                // giờ k làm khách hàng bên trang này :v
                var user = userSession.GetById(Email);
                userSession.Email = user.Email;
                //Session["FullName"] = data.FirstOrDefault().FirstName + " " + data.FirstOrDefault().LastName;
                //Session["Email"] = data.FirstOrDefault().Email;
                //Session["idUser"] = data.FirstOrDefault().idUser;
                userSession.IDNhom = user.IDNhom;
                var listCredentials = userSession.GetListCredential(Email);
                Session.Add(CommonConstants.SESSION_CREDENTIALS, listCredentials);
                Session.Add(CommonConstants.USER_SESSION, userSession);
                Session["FullName"] = user.HoNV + " " + user.TenNV;
                Session["imgName"] = user.AnhNV;
                return RedirectToAction("Index", "Home"); //này Home index à ò
            }
            else if (result == 0)
            {
                ModelState.AddModelError("", "Tài khoản không tồn tại.");
            }
            else if (result == -2)
            {
                ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng.");
            }

            return View();
        }


        //Logout
        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return RedirectToAction("Login");
        }



        //create a string MD5
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
        //[HasCredential(RoleID = "VIEW_USER")]
        //public ActionResult Usersystem()
        //{
        //    var giangViens = db.NguoiDungs;
        //    return View(giangViens.ToList());
        //}

        //public ActionResult Edit(string id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    NguoiDung nguoiDung = db.NguoiDungs.Find(id);
        //    if (nguoiDung == null)
        //    {
        //        return HttpNotFound();
        //    }

        //    return View(nguoiDung);
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "idUser, FirstName, LastName, Email, Password, GroupID")] NguoiDung nguoiDung)
        //{

        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(nguoiDung).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Usersystem");
        //    }

        //    return View(nguoiDung);
        //}

        //public ActionResult Delete(string id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    NguoiDung nguoiDung = db.NguoiDungs.Find(id);
        //    if (nguoiDung == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(nguoiDung);
        //}

        //// POST: NhanViens/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(string id)
        //{
        //    NguoiDung nguoiDung = db.NguoiDungs.Find(id);
        //    db.NguoiDungs.Remove(nguoiDung);
        //    db.SaveChanges();
        //    return RedirectToAction("Usersystem");
        //}



        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}