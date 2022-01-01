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
using System.Security.Cryptography;
using System.Text;

namespace BT_NHOM.Controllers
{
    public class NhanViensController : RedirectingActionController
    {
        private QLBSPhuongNamEntities db = new QLBSPhuongNamEntities();

        string LayMaS()
        {
            var maMax = db.Saches.ToList().Select(n => n.MaSach).Max();
            int maS = int.Parse(maMax.Substring(1)) + 1;
            string S = String.Concat("00", maS.ToString());
            return "S" + S.Substring(maS.ToString().Length - 1);
        }
        string LayMaNXB()
        {
            var maMax = db.NhaXuatBans.ToList().Select(n => n.MaNXB).Max();
            int maNXB = int.Parse(maMax.Substring(3)) + 1;
            string NXB = String.Concat("0", maNXB.ToString());
            return "NXB" + NXB.Substring(maNXB.ToString().Length - 1);
        }
        string LayMaNCC()
        {
            var maMax = db.NhaCungCaps.ToList().Select(n => n.MaNCC).Max();
            int maNCC = int.Parse(maMax.Substring(3)) + 1;
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
        string LayMaNV()
        {
            var maMax = db.NhanViens.ToList().Select(n => n.MaNV).Max();
            int MaNV = int.Parse(maMax.Substring(2)) + 1;
            string NV = String.Concat("0", MaNV.ToString());
            return "NV" + NV.Substring(MaNV.ToString().Length - 1);
        }
        // GET: NhanViens
        [HasCredential(RoleID = "QUANLYKHO")]
        public async Task<ActionResult> IndexSACH(string maS = "", string tenS = "", string maTL = "", string maNN = "")
        {
            ViewBag.maS = maS;
            ViewBag.tenS = tenS;

            ViewBag.maTL = new SelectList(db.TheLoais, "MaTL", "TenTL");
            ViewBag.maNN = new SelectList(db.NgonNgus, "MaNN", "TenNN");
            var Sachs = db.Saches.SqlQuery("Select * from Sach where MaSach like '%" + maS + "%'"
                + "and TenSach like N'%" + tenS + "%'"
                + "and MaTL like '%" + maTL + "%'"
                + "and MaNN like '%" + maNN + "%'");
            if (Sachs.Count() == 0)
                ViewBag.TB = "Không có thông tin tìm kiếm.";
            return View(Sachs.ToList());
            //return View(await db.Saches.ToListAsync());            
        }
        // GET: Saches/Create
        public ActionResult CreateSACH()
        {
            ViewBag.MaSach = LayMaS();
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
            ViewBag.MaSach = LayMaS();
            ViewBag.MaNN = new SelectList(db.NgonNgus, "MaNN", "TenNN", sach.MaNN);
            ViewBag.MaNXB = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB", sach.MaNXB);
            ViewBag.MaTL = new SelectList(db.TheLoais, "MaTL", "TenTL", sach.MaTL);
            return View(sach);
        }
        /*public async Task<ActionResult> EditSACH(string id)
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
                *//*sach.MaSach = LayMaS();*//*
                ViewBag.AnhBia = sach.AnhBia;
                db.Entry(sach).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexSACH");
            }
            ViewBag.MaNN = new SelectList(db.NgonNgus, "MaNN", "TenNN", sach.MaNN);
            ViewBag.MaNXB = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB", sach.MaNXB);
            ViewBag.MaTL = new SelectList(db.TheLoais, "MaTL", "TenTL", sach.MaTL);
            return View(sach);
        }*/
        public ActionResult EditSACH(string id)
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
            ViewBag.MaNN = new SelectList(db.NgonNgus, "MaNN", "TenNN", sach.MaNN);
            ViewBag.MaNXB = new SelectList(db.NhaXuatBans, "MaNXB", "TenNXB", sach.MaNXB);
            ViewBag.MaTL = new SelectList(db.TheLoais, "MaTL", "TenTL", sach.MaTL);
            return View(sach);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditSACH([Bind(Include = "MaSach,TenSach,TenTG,NgayXB,SoLuongTon,MoTa,AnhBia,GiaSach,MaTL,MaNXB,MaNN")] Sach sach)
        {
            var imgNV = Request.Files["Avatar"];
            try
            {
                //Lấy thông tin từ input type=file có tên Avatar
                string postedFileName = System.IO.Path.GetFileName(imgNV.FileName);
                //Lưu hình đại diện về Server
                var path = Server.MapPath("/Assets/Multimedia/" + postedFileName);
                imgNV.SaveAs(path);
            }
            catch
            { }

            if (ModelState.IsValid)
            {
                db.Entry(sach).State = EntityState.Modified;
                db.SaveChanges();
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
        [HasCredential(RoleID = "QUANLYKHO")]
        public async Task<ActionResult> IndexNCC()
        {
            return View(await db.NhaCungCaps.ToListAsync());
        }
        public ActionResult CreateNCC()
        {
            ViewBag.MaNCC = LayMaNCC();
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
            ViewBag.MaNCC = LayMaNCC();
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

        public async Task<ActionResult> DelNCC(string id)
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

        // POST: NhaXuatBans/Delete/5
        [HttpPost, ActionName("DelNCC")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DelNCCConfirmed(string id)
        {
            NhaCungCap nhaCungCap = await db.NhaCungCaps.FindAsync(id);
            db.NhaCungCaps.Remove(nhaCungCap);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexNCC");
        }
        [HasCredential(RoleID = "QUANLYKHO")]
        public async Task<ActionResult> IndexNXB()
        {
            return View(await db.NhaXuatBans.ToListAsync());
        }
        // GET: NhaXuatBans/Create
        public ActionResult CreateNXB()
        {
            ViewBag.MaNXB = LayMaNXB();
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
            ViewBag.MaNXB = LayMaNXB();
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
        public async Task<ActionResult> DelNXB(string id)
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
        }

        /*public async Task<ActionResult> IndexHD()
        {
            return View(await db.ChiTietHDs.ToListAsync());
        }*/
        [HasCredential(RoleID = "QUANLYHOADON")]
        public ActionResult IndexHD()
        {
            List<HoaDon> hd = db.HoaDons.ToList();
            List<NhanVien> nv = db.NhanViens.ToList();
            List<ChiTietHD> cthd = db.ChiTietHDs.ToList();
            List<Sach> saches = db.Saches.ToList();

            /*var hoaDons = db.HoaDons.Include(h => h.KhachHang).Include(h => h.NhanVien).Include(h => h.ChiTietHDs);*/
            var hoaDons = from a in hd
                          join c in nv on a.MaNV equals c.MaNV
                          join d in cthd on a.MaHD equals d.MaHD
                          join e in saches on d.MaSach equals e.MaSach
                          select new ViewModels
                          {
                              hoaDon = a,
                              nhanVien = c,
                              cthd = d,
                              sachNormal = e
                          };

            return View(hoaDons.ToList());
        }

        public async Task<ActionResult> EditHD(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = await db.HoaDons.FindAsync(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            
            ViewBag.MaNV = new SelectList(db.NhanViens, "MaNV", "TenNV", hoaDon.MaNV);
            return View(hoaDon);
        }

        // POST: ChiTietHDs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EditHD([Bind(Include = "MaHD,TinhTrang,TenKH,DiaChiGiao,SoDT,NgayXuatKho,NgayGiao,MaKH,MaNV")] HoaDon hoaDon)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoaDon).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("IndexHD");
            }
            ViewBag.MaNV = new SelectList(db.NhanViens, "MaNV", "TenNV", hoaDon.MaNV);
            return View(hoaDon);
        }

        public async Task<ActionResult> DelHD(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = await db.HoaDons.FindAsync(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            return View(hoaDon);
        }

        // POST: HoaDons/Delete/5
        [HttpPost, ActionName("DelHD")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DelHDConfirmed(string id)
        {
            HoaDon hoaDon = await db.HoaDons.FindAsync(id);
            db.HoaDons.Remove(hoaDon);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexHD");
        }

        /*[HttpGet]
        public ActionResult CTHoaDon(string id)
        {
            var listCTHD = db.ChiTietHDs.Where(n => n.MaHD == id);
            return View(listCTHD.ToList());
        }*/
        [HttpGet]
        public ActionResult CTHoaDon(string id)
        {
            ViewBag.id = id;
            return View();
        }
        /*public async Task<ActionResult> DetailsHD(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = await db.HoaDons.FindAsync(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            return View(hoaDon);
        }*/

        // GET: TheLoais
        [HasCredential(RoleID = "QUANLYKHO")]
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
                TheLoai tl = db.TheLoais.Find(theLoai.MaTL);
                if (tl == null)
                {
                    db.TheLoais.Add(theLoai);
                    await db.SaveChangesAsync();
                    return RedirectToAction("IndexTL");
                }
                else
                {
                    ModelState.AddModelError("", "Mã thể loại này đã tồn tại");
                }
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

        public async Task<ActionResult> DelTL(string id)
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

        // POST: NhaXuatBans/Delete/5
        [HttpPost, ActionName("DelTL")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DelTLConfirmed(string id)
        {
            TheLoai theLoai = await db.TheLoais.FindAsync(id);
            db.TheLoais.Remove(theLoai);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexTL");
        }
        [HasCredential(RoleID = "QUANLYKHO")]
        public async Task<ActionResult> IndexNN()
        {
            return View(await db.NgonNgus.ToListAsync());
        }

        // GET: TheLoais/Details/5


        // GET: TheLoais/Create
        public ActionResult CreateNN()
        {
            ViewBag.MaNN = LayMaNN();
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
            ViewBag.MaNN = LayMaNN();
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

        public async Task<ActionResult> DelNN(string id)
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

        // POST: NhaXuatBans/Delete/5
        [HttpPost, ActionName("DelNN")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DelNNConfirmed(string id)
        {
            NgonNgu ngonNgu = await db.NgonNgus.FindAsync(id);
            db.NgonNgus.Remove(ngonNgu);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexNN");
        }
        [HasCredential(RoleID = "QUANLYKHO")]
        public async Task<ActionResult> IndexTG()
        {
            return View(await db.TacGias.ToListAsync());
        }

        // GET: TheLoais/Details/5


        // GET: TheLoais/Create
        public ActionResult CreateTG()
        {
            ViewBag.MaTG = LayMaTG();
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
            ViewBag.MaTG = LayMaTG();
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

        public async Task<ActionResult> DelTG(string id)
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

        // POST: NhaXuatBans/Delete/5
        [HttpPost, ActionName("DelTG")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DelTGConfirmed(string id)
        {
            TacGia tacGia = await db.TacGias.FindAsync(id);
            db.TacGias.Remove(tacGia);
            await db.SaveChangesAsync();
            return RedirectToAction("IndexTG");
        }

        //Báo cáo
        [HasCredential(RoleID = "QUANLYBAOCAO")]
        public ActionResult BaoCao()
        {
            return View(db.v_Don_Dat_hang.ToList());
        }

        //Phiếu nhập
        [HasCredential(RoleID = "QUANLYPHIEUNHAP")]
        public async Task<ActionResult> IndexPN()
        {
            var chiTietPNs = db.ChiTietPNs.Include(c => c.PhieuNhap).Include(c => c.Sach);
            return View(await chiTietPNs.ToListAsync());
        }

        // GET: ChiTietPNs/Details/5
        public ActionResult DetailsPN(string id1, string id2)
        {
            if (id1 == null && id2 == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietPN chiTietPN = db.ChiTietPNs.Find(id1, id2);
            if (chiTietPN == null)
            {
                return HttpNotFound();
            }
            return View(chiTietPN);
        }

        // GET: ChiTietPNs/Create
        public ActionResult CreatePN()
        {
            ViewBag.MaPN = new SelectList(db.PhieuNhaps, "MaPN", "MaNCC");
            ViewBag.MaSach = new SelectList(db.Saches, "MaSach", "TenSach");
            return View();
        }

        // POST: ChiTietPNs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CreatePN([Bind(Include = "MaPN,MaSach,SoLuongNhap,GiaNhap")] ChiTietPN chiTietPN)
        {
            if (ModelState.IsValid)
            {
                db.ChiTietPNs.Add(chiTietPN);
                await db.SaveChangesAsync();
                return RedirectToAction("IndexPN");
            }

            ViewBag.MaPN = new SelectList(db.PhieuNhaps, "MaPN", "MaNCC", chiTietPN.MaPN);
            ViewBag.MaSach = new SelectList(db.Saches, "MaSach", "TenSach", chiTietPN.MaSach);
            return View(chiTietPN);
        }

        // GET: ChiTietPNs/Edit/5
        public async Task<ActionResult> EditPN(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietPN chiTietPN = await db.ChiTietPNs.FindAsync(id);
            if (chiTietPN == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaPN = new SelectList(db.PhieuNhaps, "MaPN", "MaNCC", chiTietPN.MaPN);
            ViewBag.MaSach = new SelectList(db.Saches, "MaSach", "TenSach", chiTietPN.MaSach);
            return View(chiTietPN);
        }

        // POST: ChiTietPNs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> EditPN([Bind(Include = "MaPN,MaSach,SoLuongNhap,GiaNhap")] ChiTietPN chiTietPN)
        {
            if (ModelState.IsValid)
            {
                db.Entry(chiTietPN).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaPN = new SelectList(db.PhieuNhaps, "MaPN", "MaNCC", chiTietPN.MaPN);
            ViewBag.MaSach = new SelectList(db.Saches, "MaSach", "TenSach", chiTietPN.MaSach);
            return View(chiTietPN);
        }

        // GET: ChiTietPNs/Delete/5
        public ActionResult DelPN(string id1, string id2)
        {
            if (id1 == null && id2 == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietPN chiTietPN = db.ChiTietPNs.Find(id1, id2);
            if (chiTietPN == null)
            {
                return HttpNotFound();
            }
            return View(chiTietPN);
        }

        // POST: ChiTietPNs/Delete/5
        [HttpPost, ActionName("DelPN")]
        [ValidateAntiForgeryToken]
        public ActionResult DelPNConfirmed(string id1, string id2)
        {
            ChiTietPN chiTietPN = db.ChiTietPNs.Find(id1, id2);
            PhieuNhap phieuNhap = db.PhieuNhaps.Find(id1);
            db.ChiTietPNs.Remove(chiTietPN);
            db.PhieuNhaps.Remove(phieuNhap);
            db.SaveChanges();
            return RedirectToAction("IndexPN");
        }


        /*Quản lý nhân viên*/
        [HasCredential(RoleID = "QUANLYNHANVIEN")]
        public ActionResult StaffSystem()
        {
            var nhanViens = db.NhanViens;
            return View(nhanViens.ToList());
        }
        public ActionResult Create()
        {
            ViewBag.MaNV = LayMaNV();
            ViewBag.IDNhom = new SelectList(db.NhomNhanViens, "IDNhom", "TenNhom");
            return View();
        }
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNV,HoNV,TenNV,GioiTinh,DiaChi,SoDTNV,AnhNV,Email,Matkhau,IDNhom")] NhanVien nhanVien)
        {
            var imgNV = Request.Files["Avatar"];
            //Lấy thông tin từ input type=file có tên Avatar
            string postedFileName = System.IO.Path.GetFileName(imgNV.FileName);
            //Lưu hình đại diện về Server
            var path = Server.MapPath("/AssetsLayoutAdmin/img/" + postedFileName);
            imgNV.SaveAs(path);

            if (ModelState.IsValid)
            {
                nhanVien.Matkhau = GetMD5(nhanVien.Matkhau);
                db.Configuration.ValidateOnSaveEnabled = false;
                nhanVien.MaNV = LayMaNV();
                nhanVien.AnhNV = postedFileName;
                db.NhanViens.Add(nhanVien);
                db.SaveChanges();
                return RedirectToAction("StaffSystem");
            }
            ViewBag.MaNV = LayMaNV();
            ViewBag.IDNhom = new SelectList(db.NhomNhanViens, "IDNhom", "TenNhom", nhanVien.IDNhom);
            return View(nhanVien);
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

        public ActionResult Delete(string id)
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

        // POST: GiangVien_60131986/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            NhanVien nhanVien = db.NhanViens.Find(id);
            db.NhanViens.Remove(nhanVien);
            db.SaveChanges();
            return RedirectToAction("StaffSystem");
        }

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
            ViewBag.IDNhom = new SelectList(db.NhomNhanViens, "IDNhom", "TenNhom", nhanVien.IDNhom);
            return View(nhanVien);
        }

        // POST: DienThoai_60131640/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNV,HoNV,TenNV,GioiTinh,DiaChi,SoDTNV,AnhNV,Email,Matkhau,IDNhom")] NhanVien nhanVien)
        {
            var imgNV = Request.Files["Avatar"];
            try
            {
                //Lấy thông tin từ input type=file có tên Avatar
                string postedFileName = System.IO.Path.GetFileName(imgNV.FileName);
                //Lưu hình đại diện về Server
                var path = Server.MapPath("/AssetsLayoutAdmin/img/" + postedFileName);
                imgNV.SaveAs(path);
            }
            catch
            { }
            if (ModelState.IsValid)
            {
                if (nhanVien.Matkhau.Length < 20)
                {
                    nhanVien.Matkhau = GetMD5(nhanVien.Matkhau);
                    db.Configuration.ValidateOnSaveEnabled = false;
                }
                else { }
                db.Entry(nhanVien).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("StaffSystem");
            }
            ViewBag.IDNhom = new SelectList(db.NhomNhanViens, "IDNhom", "TenNhom", nhanVien.IDNhom);
            return View(nhanVien);
        }

        public ActionResult Details(string id)
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
