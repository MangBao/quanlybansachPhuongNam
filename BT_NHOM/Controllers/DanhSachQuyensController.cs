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
    public class DanhSachQuyensController : RedirectingActionController
    {
        private QLBSPhuongNamEntities db = new QLBSPhuongNamEntities();

        // GET: DanhSachQuyens
        [HasCredential(RoleID = "PHANQUYEN")]
        public async Task<ActionResult> Index()
        {
            var danhSachQuyens = db.DanhSachQuyens.Include(d => d.NhomNhanVien).Include(d => d.Quyen);
            return View(await danhSachQuyens.ToListAsync());
        }

        // GET: DanhSachQuyens/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhSachQuyen danhSachQuyen = await db.DanhSachQuyens.FindAsync(id);
            if (danhSachQuyen == null)
            {
                return HttpNotFound();
            }
            return View(danhSachQuyen);
        }

        // GET: DanhSachQuyens/Create
        public ActionResult Create()
        {
            ViewBag.IDNhom = new SelectList(db.NhomNhanViens, "IDNhom", "TenNhom");
            ViewBag.IDQuyen = new SelectList(db.Quyens, "IDQuyen", "TenQuyen");
            return View();
        }

        // POST: DanhSachQuyens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "IDNhom,IDQuyen,MoTa")] DanhSachQuyen danhSachQuyen)
        {
            if (ModelState.IsValid)
            { //trước khi lưu, kiểm tra xem đã có phân quyền này chưa
                DanhSachQuyen dsQuyen = db.DanhSachQuyens.Find(danhSachQuyen.IDNhom, danhSachQuyen.IDQuyen);
                if (dsQuyen == null)
                {
                    db.DanhSachQuyens.Add(danhSachQuyen);
                    await db.SaveChangesAsync();
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Quyền đã tồn tại");
                }
            }

            ViewBag.IDNhom = new SelectList(db.NhomNhanViens, "IDNhom", "TenNhom", danhSachQuyen.IDNhom);
            ViewBag.IDQuyen = new SelectList(db.Quyens, "IDQuyen", "TenQuyen", danhSachQuyen.IDQuyen);
            return View(danhSachQuyen);
        }


        // GET: DanhSachQuyens/Delete/5
        public async Task<ActionResult> Delete(string IDNhom, string IDQuyen)
        {
            if (IDNhom == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhSachQuyen danhSachQuyen = await db.DanhSachQuyens.FindAsync(IDNhom, IDQuyen);
            if (danhSachQuyen == null)
            {
                return HttpNotFound();
            }
            return View(danhSachQuyen);
        }

        // POST: DanhSachQuyens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string IDNhom, string IDQuyen)
        {
            DanhSachQuyen danhSachQuyen = await db.DanhSachQuyens.FindAsync(IDNhom, IDQuyen);
            db.DanhSachQuyens.Remove(danhSachQuyen);
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
