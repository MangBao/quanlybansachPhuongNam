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


namespace BT_NHOM.Controllers
{
    public class NhanViensController : Controller
    {
        private QLBSPhuongNamEntities db = new QLBSPhuongNamEntities();

        string LayMaS()
        {
            var maMax = db.Saches.ToList().Select(n => n.MaSach).Max();
            int maS = int.Parse(maMax.Substring(2)) + 1;
            string S = String.Concat("00", maS.ToString());
            return "S" + S.Substring(maS.ToString().Length - 1);
        }
        string LayMaNXB()
        {
            var maMax = db.NhaXuatBans.ToList().Select(n => n.MaNXB).Max();
            int maNXB = int.Parse(maMax.Substring(2)) + 1;
            string NXB = String.Concat("0", maNXB.ToString());
            return "NXB" + NXB.Substring(maNXB.ToString().Length - 1);
        }
        string LayMaNCC()
        {
            var maMax = db.NhaCungCaps.ToList().Select(n => n.MaNCC).Max();
            int maNCC = int.Parse(maMax.Substring(2)) + 1;
            string NCC = String.Concat("0", maNCC.ToString());
            return "NCC" + NCC.Substring(maNCC.ToString().Length - 1);
        }
        string LayMaNN()
        {
            var maMax = db.NgonNgus.ToList().Select(n => n.MaNN).Max();
            int maNN = int.Parse(maMax.Substring(2)) + 1;
            string NN = String.Concat("0", maNN.ToString());
            return "NN" + NN.Substring(maNN.ToString().Length - 1);
        }
        string LayMaTG()
        {
            var maMax = db.TacGias.ToList().Select(n => n.MaTG).Max();
            int maTG = int.Parse(maMax.Substring(2)) + 1;
            string TG = String.Concat("0", maTG.ToString());
            return "TG" + TG.Substring(maTG.ToString().Length - 1);
        }
        // GET: NhanViens
        public async Task<ActionResult> IndexSACH()
        {
            return View(await db.Saches.ToListAsync());            
        }
        // GET: Saches/Create
        public ActionResult CreateSACH()
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
        public async Task<ActionResult> CreateSACH(HttpPostedFileBase Avatar, [Bind(Include = "MaSach,TenSach,TenTG,NgayXB,SoLuongTon,MoTa,AnhBia,GiaSach,MaTL,MaNXB,MaNN")] Sach sach)
        {
            string postedFileName = System.IO.Path.GetFileName(Avatar.FileName);
            var path = System.Web.Hosting.HostingEnvironment.MapPath("~/Assets/Multimedia/" + postedFileName);
            Avatar.SaveAs(path);
            if (ModelState.IsValid)
            {
                sach.AnhBia = postedFileName;
                sach.MaSach = LayMaS();
                db.Saches.Add(sach);
                await db.SaveChangesAsync();
                return RedirectToAction("IndexSACH");
            }

            ViewBag.MaNN = new SelectList(db.NgonNgus, "MaNN", "TenNN", sach.MaNN);
            ViewBag.MaNXB = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB", sach.MaNXB);
            ViewBag.MaTL = new SelectList(db.TheLoais, "MaTL", "TenTL", sach.MaTL);
            return View(sach);
        }
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
        public async Task<ActionResult> EditSACH(HttpPostedFileBase Avatar, [Bind(Include = "MaSach,TenSach,TenTG,NgayXB,SoLuongTon,MoTa,AnhBia,GiaSach,MaTL,MaNXB,MaNN")] Sach sach)
        {
            string postedFileName = System.IO.Path.GetFileName(Avatar.FileName);
            var path = System.Web.Hosting.HostingEnvironment.MapPath("~/Assets/Multimedia/" + postedFileName);
            Avatar.SaveAs(path);
            if (ModelState.IsValid)
            {
                sach.AnhBia = postedFileName;
                /*sach.MaSach = LayMaS();*/
                db.Entry(sach).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexSACH");
            }
            ViewBag.MaNN = new SelectList(db.NgonNgus, "MaNN", "TenNN", sach.MaNN);
            ViewBag.MaNXB = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB", sach.MaNXB);
            ViewBag.MaTL = new SelectList(db.TheLoais, "MaTL", "TenTL", sach.MaTL);
            return View(sach);
        }
        // GET: Saches/Delete/5
        public async Task<ActionResult> DelSACH(string id)
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
        [HttpPost, ActionName("DelSACH")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DelSACHConfirmed(string id)
        {
            Sach sach = await db.Saches.FindAsync(id);
            db.Saches.Remove(sach);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexSACH");
        }

        public async Task<ActionResult> IndexNCC()
        {
            return View(await db.NhaCungCaps.ToListAsync());
        }
        public ActionResult CreateNCC()
        {
            return View();
        }

        // POST: NhaXuatBans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CreateNCC([Bind(Include = "MaNCC,TenNCC,DiaChiNCC,SDTNCC")] NhaCungCap nhaCungCap)
        {
            if (ModelState.IsValid)
            {
                nhaCungCap.MaNCC = LayMaNCC();
                db.NhaCungCaps.Add(nhaCungCap);
                await db.SaveChangesAsync();
                return RedirectToAction("IndexNCC");
            }

            return View(nhaCungCap);
        }
        public async Task<ActionResult> EditNCC(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhaCungCap nhaCungCap = await db.NhaCungCaps.FindAsync(id);
            if (nhaCungCap == null)
            {
                return HttpNotFound();
            }
            return View(nhaCungCap);
        }

        // POST: NhaXuatBans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EditNCC([Bind(Include = "MaNCC,TenNCC,DiaChiNCC,SDTNCC")] NhaCungCap nhaCungCap)
        {
            if (ModelState.IsValid)
            {
                /*nhaCungCap.MaNCC = LayMaNCC();*/
                db.Entry(nhaCungCap).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexNCC");
            }
            return View(nhaCungCap);
        }
        public async Task<ActionResult> IndexNXB()
        {
            return View(await db.NhaXuatBans.ToListAsync());
        }
        // GET: NhaXuatBans/Create
        public ActionResult CreateNXB()
        {
            return View();
        }

        // POST: NhaXuatBans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CreateNXB([Bind(Include = "MaNXB,TenNXB,DiaChiNXB,DienThoai")] NhaXuatBan nhaXuatBan)
        {
            if (ModelState.IsValid)
            {
                nhaXuatBan.MaNXB = LayMaNXB();
                db.NhaXuatBans.Add(nhaXuatBan);
                await db.SaveChangesAsync();
                return RedirectToAction("IndexNXB");
            }

            return View(nhaXuatBan);
        }
        public async Task<ActionResult> EditNXB(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhaXuatBan nhaXuatBan = await db.NhaXuatBans.FindAsync(id);
            if (nhaXuatBan == null)
            {
                return HttpNotFound();
            }
            return View(nhaXuatBan);
        }

        // POST: NhaXuatBans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EditNXB([Bind(Include = "MaNXB,TenNXB,DiaChiNXB,DienThoai")] NhaXuatBan nhaXuatBan)
        {
            if (ModelState.IsValid)
            {
                /*nhaXuatBan.MaNXB = LayMaNXB();*/
                db.Entry(nhaXuatBan).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexNXB");
            }
            return View(nhaXuatBan);
        }
        //Nhà xuất bản nếu ngừng xuất bản thì sách trong kho phải bán hết thì nv mới được xóa nxb khỏi database
        /*public async Task<ActionResult> DelNXB(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhaXuatBan nhaXuatBan = await db.NhaXuatBans.FindAsync(id);
            if (nhaXuatBan == null)
            {
                return HttpNotFound();
            }
            return View(nhaXuatBan);
        }

        // POST: NhaXuatBans/Delete/5
        [HttpPost, ActionName("DelNXB")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DelNXBConfirmed(string id)
        {
            NhaXuatBan nhaXuatBan = await db.NhaXuatBans.FindAsync(id);
            db.NhaXuatBans.Remove(nhaXuatBan);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexNXB");
        }*/
        public async Task<ActionResult> IndexHD()
        {
            return View(await db.ChiTietHDs.ToListAsync());
        }
        public async Task<ActionResult> EditHD(string id1, string id2)
        {
            if (id1 == null && id2 == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietHD chiTietHD = await db.ChiTietHDs.FindAsync(id1, id2);
            if (chiTietHD == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaHD = new SelectList(db.HoaDons, "MaHD", "MaHD", chiTietHD.MaHD);
            ViewBag.MaSach = new SelectList(db.Saches, "MaSach", "TenSach", chiTietHD.MaSach);
            ViewBag.MaNV = new SelectList(db.NhanViens, "MaNV", "Ten", chiTietHD.HoaDon.MaNV);
            return View(chiTietHD);
        }

        // POST: ChiTietHDs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EditHD([Bind(Include = "MaHD,MaSach,SoLuongSach,GiaBan")] ChiTietHD chiTietHD)
        {
            if (ModelState.IsValid)
            {
                db.Entry(chiTietHD).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexHD");
            }
            ViewBag.MaHD = new SelectList(db.HoaDons, "MaHD", "MaHD", chiTietHD.MaHD);
            ViewBag.MaSach = new SelectList(db.Saches, "MaSach", "TenSach", chiTietHD.MaSach);
            ViewBag.MaNV = new SelectList(db.NhanViens, "MaNV", "Ten", chiTietHD.HoaDon.MaNV);
            return View(chiTietHD);
        }

        public async Task<ActionResult> DelHD(string id1, string id2)
        {
            if (id1 == null && id2 == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietHD chiTietHD = await db.ChiTietHDs.FindAsync(id1, id2);
            if (chiTietHD == null)
            {
                return HttpNotFound();
            }
            return View(chiTietHD);
        }

        // POST: Saches/Delete/5
        [HttpPost, ActionName("DelHD")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DelHDConfirmed(string id1, string id2)
        {
            HoaDon hoaDon = await db.HoaDons.FindAsync(id1);
            ChiTietHD chiTietHD = await db.ChiTietHDs.FindAsync(id1, id2);
            db.HoaDons.Remove(hoaDon);
            db.ChiTietHDs.Remove(chiTietHD);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexHD");
        }

        // GET: TheLoais
        public async Task<ActionResult> IndexTL()
        {
            return View(await db.TheLoais.ToListAsync());
        }

        // GET: TheLoais/Details/5


        // GET: TheLoais/Create
        public ActionResult CreateTL()
        {
            return View();
        }

        // POST: TheLoais/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CreateTL([Bind(Include = "MaTL,TenTL")] TheLoai theLoai)
        {
            if (ModelState.IsValid)
            {
                
                db.TheLoais.Add(theLoai);
                await db.SaveChangesAsync();
                return RedirectToAction("IndexTL");
            }

            return View(theLoai);
        }

        // GET: TheLoais/Edit/5
        public async Task<ActionResult> EditTL(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TheLoai theLoai = await db.TheLoais.FindAsync(id);
            if (theLoai == null)
            {
                return HttpNotFound();
            }
            return View(theLoai);
        }

        // POST: TheLoais/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EditTL([Bind(Include = "MaTL,TenTL")] TheLoai theLoai)
        {
            if (ModelState.IsValid)
            {
                db.Entry(theLoai).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexTL");
            }
            return View(theLoai);
        }

        public async Task<ActionResult> IndexNN()
        {
            return View(await db.NgonNgus.ToListAsync());
        }

        // GET: TheLoais/Details/5


        // GET: TheLoais/Create
        public ActionResult CreateNN()
        {
            return View();
        }

        // POST: TheLoais/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CreateNN([Bind(Include = "MaNN,TenNN")] NgonNgu ngonNgu)
        {
            if (ModelState.IsValid)
            {
                ngonNgu.MaNN = LayMaNN();
                db.NgonNgus.Add(ngonNgu);
                await db.SaveChangesAsync();
                return RedirectToAction("IndexNN");
            }

            return View(ngonNgu);
        }

        // GET: TheLoais/Edit/5
        public async Task<ActionResult> EditNN(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NgonNgu ngonNgu = await db.NgonNgus.FindAsync(id);
            if (ngonNgu == null)
            {
                return HttpNotFound();
            }
            return View(ngonNgu);
        }

        // POST: TheLoais/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EditNN([Bind(Include = "MaNN,TenNN")] NgonNgu ngonNgu)
        {
            if (ModelState.IsValid)
            {
                /*ngonNgu.MaNN = LayMaNN();*/
                db.Entry(ngonNgu).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexNN");
            }
            return View(ngonNgu);
        }

        public async Task<ActionResult> IndexTG()
        {
            return View(await db.TacGias.ToListAsync());
        }

        // GET: TheLoais/Details/5


        // GET: TheLoais/Create
        public ActionResult CreateTG()
        {
            return View();
        }

        // POST: TheLoais/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CreateTG([Bind(Include = "MaTG,TenTG")] TacGia tacGia)
        {
            if (ModelState.IsValid)
            {
                tacGia.MaTG = LayMaTG();
                db.TacGias.Add(tacGia);
                await db.SaveChangesAsync();
                return RedirectToAction("IndexTG");
            }

            return View(tacGia);
        }

        // GET: TheLoais/Edit/5
        public async Task<ActionResult> EditTG(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TacGia tacGia = await db.TacGias.FindAsync(id);
            if (tacGia == null)
            {
                return HttpNotFound();
            }
            return View(tacGia);
        }

        // POST: TheLoais/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EditTG([Bind(Include = "MaTG,TenTG,DiaChi")] TacGia tacGia)
        {
            if (ModelState.IsValid)
            {
                /*tacGia.MaTG = LayMaTG();*/
                db.Entry(tacGia).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexTG");
            }
            return View(tacGia);
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
