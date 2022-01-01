using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BT_NHOM.Models;
using PagedList;

namespace BT_NHOM.Controllers
{
    public class SachesController : Controller
    {
        private QLBSPhuongNamEntities db = new QLBSPhuongNamEntities();

        // GET: Saches
        
        public ActionResult Index(int? page, string sortOrder = "", string sortOrderType = "")
        {
            if (page == null) page = 1;
            ViewModels mymodel = new ViewModels();
            var saches = db.Saches.Include(s => s.NgonNgu).Include(s => s.NhaXuatBan).Include(s => s.TheLoai).Include(s => s.ChiTietHDs);

            /* Sort by price, new, hot */
            ViewBag.SortParm = sortOrder == "priceAsc" ? "priceAsc" : 
                (sortOrder == "priceDes" ? "priceDes" : 
                (sortOrder == "hot" ? "hot" : 
                (sortOrder == "moinhat" ? "moinhat" : ""))
                );            

            switch (sortOrder)
            {
                case "priceAsc":
                    /*saches = db.Saches.Include(s => s.NgonNgu).Include(s => s.NhaXuatBan).Include(s => s.TheLoai).OrderBy(s => s.MaSach).OrderBy(s=>s.GiaSach).ThenByDescending(s=>s.GiaSach);*/
                    saches = saches.OrderBy(s => s.MaSach).OrderBy(s => s.GiaSach);                                                                                                                                                                                                   
                    break;
                case "priceDes":
                    saches = saches.OrderBy(s => s.MaSach).OrderByDescending(s => s.GiaSach);
                    break;
                case "hot":
                    saches = saches.OrderByDescending(s => s.ChiTietHDs.Min(ct => ct.SoLuongSach));
                    break;
                case "moinhat":
                    saches = saches.OrderByDescending(s => s.NgayXB);
                    break;
                default:
                    saches = saches.OrderBy(s => s.MaSach);
                    break;
            }

            int pageSize = 12;
            int pageNumber = (page ?? 1);
            var sachPagelist = saches.ToPagedList(pageNumber, pageSize);
            mymodel.Saches = sachPagelist;
            mymodel.TheLoais = db.TheLoais.ToList();

            

            return View(mymodel);
        }
        public ActionResult IndexType(int? page, string sortOrderType = "")
        {
            if (page == null) page = 1;
            ViewModels mymodel = new ViewModels();
            var saches = db.Saches.Include(s => s.NgonNgu).Include(s => s.NhaXuatBan).Include(s => s.TheLoai);

            /* Sort by type */
            ViewBag.SortType = sortOrderType == "TT" ? "TT" : (sortOrderType == "TN" ? "TN" : (sortOrderType == "TD" ? "TD" : 
                (sortOrderType == "PL" ? "PL" : (sortOrderType == "HK" ? "HK" : (sortOrderType == "CT" ? "CT" : "")))));

            switch (sortOrderType)
            {
                case "TT":
                    saches = saches.OrderByDescending(s => s.TheLoai.MaTL.ToString() == sortOrderType);
                    break;
                case "CT":
                    saches = saches.OrderByDescending(s => s.TheLoai.MaTL.ToString() == sortOrderType);
                    break;
                case "TN":
                    saches = saches.OrderByDescending(s => s.TheLoai.MaTL.ToString() == sortOrderType);
                    break;
                case "PL":
                    saches = saches.OrderByDescending(s => s.TheLoai.MaTL.ToString() == sortOrderType);
                    break;
                case "HK":
                    saches = saches.OrderByDescending(s => s.TheLoai.MaTL.ToString() == sortOrderType);
                    break;
                case "TD":
                    saches = saches.OrderByDescending(s => s.TheLoai.MaTL.ToString() == sortOrderType);
                    break;
                default:
                    saches = saches.OrderBy(s => s.MaSach);
                    break;
            }

            int pageSize = 12;
            int pageNumber = (page ?? 1);
            var sachPagelist = saches.ToPagedList(pageNumber, pageSize);
            mymodel.Saches = sachPagelist;
            mymodel.TheLoais = db.TheLoais.ToList();

            return View(mymodel);
        }

        // GET: Saches/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sach sach = await db.Saches.FindAsync(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            return View(sach);
        }

        // GET: Saches/Create
        public ActionResult Create()
        {
            ViewBag.MaNN = new SelectList(db.NgonNgus, "MaNN", "TenNN");
            ViewBag.MaNXB = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB");
            ViewBag.MaTL = new SelectList(db.TheLoais, "MaTL", "TenTL");
            return View();
        }

        // POST: Saches/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(HttpPostedFileBase Avatar, [Bind(Include = "MaSach,TenSach,TenTG,NgayXB,SoLuongTon,MoTa,AnhBia,GiaBia,MaTL,MaNXB,MaNN")] Sach sach)
        {
            string postedFileName = System.IO.Path.GetFileName(Avatar.FileName);
            var path = System.Web.Hosting.HostingEnvironment.MapPath("~/Assets/Multimedia/" + postedFileName);
            Avatar.SaveAs(path);
            if (ModelState.IsValid)
            {
                sach.AnhBia = postedFileName;
                db.Saches.Add(sach);
                await db.SaveChangesAsync();
                return RedirectToAction("IndexSACH");
            }

            ViewBag.MaNN = new SelectList(db.NgonNgus, "MaNN", "TenNN", sach.MaNN);
            ViewBag.MaNXB = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB", sach.MaNXB);
            ViewBag.MaTL = new SelectList(db.TheLoais, "MaTL", "TenTL", sach.MaTL);
            return View(sach);
        }

        // GET: Saches/Edit/5
        public async Task<ActionResult> EditSACH(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sach sach = await db.Saches.FindAsync(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaNN = new SelectList(db.NgonNgus, "MaNN", "TenNN", sach.MaNN);
            ViewBag.MaNXB = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB", sach.MaNXB);
            ViewBag.MaTL = new SelectList(db.TheLoais, "MaTL", "TenTL", sach.MaTL);
            return View(sach);
        }

        // POST: Saches/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EditSACH([Bind(Include = "MaSach,TenSach,TenTG,NgayXB,SoLuongTon,MoTa,AnhBia,GiaBia,MaTL,MaNXB,MaNN")] Sach sach)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sach).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaNN = new SelectList(db.NgonNgus, "MaNN", "TenNN", sach.MaNN);
            ViewBag.MaNXB = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB", sach.MaNXB);
            ViewBag.MaTL = new SelectList(db.TheLoais, "MaTL", "TenTL", sach.MaTL);
            return View(sach);
        }

        // GET: Saches/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sach sach = await db.Saches.FindAsync(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            return View(sach);
        }

        // POST: Saches/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            Sach sach = await db.Saches.FindAsync(id);
            db.Saches.Remove(sach);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

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
