using BT_NHOM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace BT_NHOM.Controllers
{
    public class ThanhToanController : Controller
    {
        private QLBSPhuongNamEntities db = new QLBSPhuongNamEntities();
        // GET: ThanhToan
        public ActionResult ThanhToan(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sach sach = db.Saches.Find(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            return View(sach);
        }
    }
}