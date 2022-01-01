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


        [HttpGet]
        public ActionResult TimKiem(int? page, string param = "")
        {
            /*var sach = db.Saches.SqlQuery("SELECT * FROM Sach WHERE (TenSach like N'%" + tenSach + "%')");

            if (sach.Count() == 0)
                ViewBag.TB = "Không có thông tin tìm kiếm.";
            return View(sach.ToList());*/
            if (page == null) page = 1;
            ViewModels mymodel = new ViewModels();
            var saches = db.Saches.Where(n => n.TenSach.Contains(param)).OrderBy(s => s.MaSach);
            if(saches.Count() == 0)
            {
                ViewBag.Err = "Xin lỗi, chúng tôi hiện không có sách bạn cần 😢";
            }

            int pageSize = 8;
            int pageNumber = (page ?? 1);
            var sachPagelist = saches.ToPagedList(pageNumber, pageSize);
            mymodel.Saches = sachPagelist;
            mymodel.TheLoais = db.TheLoais.ToList();

            return View(mymodel);
        }
        // GET: Saches

        public ActionResult Index(int? page)
        {
            if (page == null) page = 1;
            ViewModels mymodel = new ViewModels();
            /*var saches = db.Saches.Include(s => s.TheLoai).Where(n => n.MaTL.Contains("PL")).OrderBy(s => s.MaSach);*/
            var saches = db.Saches.Include(s => s.NgonNgu).Include(s => s.NhaXuatBan).Include(s => s.TheLoai).OrderBy(s => s.MaSach);
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            var sachPagelist = saches.ToPagedList(pageNumber, pageSize);

            mymodel.Saches = sachPagelist;
            mymodel.TheLoais = db.TheLoais.ToList();          
            return View(mymodel);
        }
        public ActionResult IndexType(int? page, string Type = "")
        {
            string typeName = "";
            switch (Type)
            {
                case "HK":
                    typeName = "Hồi kí";
                    break;
                case "CT":
                    typeName = "Cổ tích";
                    break;
                case "PL":
                    typeName = "Phiêu lưu";
                    break;
                case "TD":
                    typeName = "Truyện dài";
                    break;
                case "TN":
                    typeName = "Truyện ngắn";
                    break;
                case "TT":
                    typeName = "Truyện tranh";
                    break;
            }
            ViewBag.Type = typeName;
            if (page == null) page = 1;
            ViewModels mymodel = new ViewModels();
            var saches = db.Saches.Include(s => s.TheLoai).Where(n => n.MaTL.Contains(Type)).OrderBy(s => s.MaSach);            

            int pageSize = 8;
            int pageNumber = (page ?? 1);
            var sachPagelist = saches.ToPagedList(pageNumber, pageSize);
            mymodel.Saches = sachPagelist;
            mymodel.TheLoais = db.TheLoais.ToList();

            return View(mymodel);
        }

        public ActionResult IndexSortCommon(int? page)
        {
            string typeName = "phổ biến";

            ViewBag.Type = typeName;
            if (page == null) page = 1;
            ViewModels mymodel = new ViewModels();
            var saches = db.Saches.OrderBy(s => s.SoLuongTon);

            int pageSize = 8;
            int pageNumber = (page ?? 1);
            var sachPagelist = saches.ToPagedList(pageNumber, pageSize);
            mymodel.Saches = sachPagelist;
            mymodel.TheLoais = db.TheLoais.ToList();

            return View(mymodel);
        }

        public ActionResult IndexSortNew(int? page)
        {
            string typeName = "mới nhất";

            ViewBag.Type = typeName;
            if (page == null) page = 1;
            ViewModels mymodel = new ViewModels();
            var saches = db.Saches.OrderByDescending(s => s.NgayXB);

            int pageSize = 8;
            int pageNumber = (page ?? 1);
            var sachPagelist = saches.ToPagedList(pageNumber, pageSize);
            mymodel.Saches = sachPagelist;
            mymodel.TheLoais = db.TheLoais.ToList();

            return View(mymodel);
        }

        public ActionResult IndexSortHot(int? page)
        {
            string typeName = "bán chạy nhất";

            ViewBag.Type = typeName;
            if (page == null) page = 1;
            ViewModels mymodel = new ViewModels();
            var saches = db.Saches.OrderByDescending(s => s.ChiTietHDs.Min(ct => ct.SoLuongSach));

            int pageSize = 8;
            int pageNumber = (page ?? 1);
            var sachPagelist = saches.ToPagedList(pageNumber, pageSize);
            mymodel.Saches = sachPagelist;
            mymodel.TheLoais = db.TheLoais.ToList();

            return View(mymodel);
        }

        public ActionResult IndexSortDes(int? page)
        {
            string typeName = "cao đến thấp";
            
            ViewBag.Type = typeName;
            if (page == null) page = 1;
            ViewModels mymodel = new ViewModels();
            var saches = db.Saches.Include(s => s.TheLoai).OrderBy(s => s.MaSach).OrderByDescending(s => s.GiaSach);

            int pageSize = 8;
            int pageNumber = (page ?? 1);
            var sachPagelist = saches.ToPagedList(pageNumber, pageSize);
            mymodel.Saches = sachPagelist;
            mymodel.TheLoais = db.TheLoais.ToList();

            return View(mymodel);
        }

        public ActionResult IndexSortAsc(int? page)
        {
            string typeName = "thấp đến cao";

            ViewBag.Type = typeName;
            if (page == null) page = 1;
            ViewModels mymodel = new ViewModels();
            var saches = db.Saches.Include(s => s.TheLoai).OrderBy(s => s.MaSach).OrderBy(s => s.GiaSach);

            int pageSize = 8;
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
