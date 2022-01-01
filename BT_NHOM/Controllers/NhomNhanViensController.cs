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
    public class NhomNhanViensController : RedirectingActionController
    {
        private QLBSPhuongNamEntities db = new QLBSPhuongNamEntities();

        // GET: NhomNhanViens
        [HasCredential(RoleID = "QUANLYNHOMNHANVIEN")]
        public async Task<ActionResult> Index()
        {
            return View(await db.NhomNhanViens.ToListAsync());
        }

        // GET: NhomNhanViens/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhomNhanVien nhomNhanVien = await db.NhomNhanViens.FindAsync(id);
            if (nhomNhanVien == null)
            {
                return HttpNotFound();
            }
            return View(nhomNhanVien);
        }

        // GET: NhomNhanViens/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: NhomNhanViens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "IDNhom,TenNhom")] NhomNhanVien nhomNhanVien)
        {
            if (ModelState.IsValid)
            {
                //trước khi lưu, kiểm tra xem đã có phân quyền này chưa
                NhomNhanVien nhomNV = db.NhomNhanViens.Find(nhomNhanVien.IDNhom);
                if (nhomNV == null)
                {
                    db.NhomNhanViens.Add(nhomNhanVien);
                    await db.SaveChangesAsync();
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Nhóm nhân viên đã tồn tại");
                }

            }
            return View(nhomNhanVien);
        }

        // GET: NhomNhanViens/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhomNhanVien nhomNhanVien = await db.NhomNhanViens.FindAsync(id);
            if (nhomNhanVien == null)
            {
                return HttpNotFound();
            }
            return View(nhomNhanVien);
        }

        // POST: NhomNhanViens/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "IDNhom,TenNhom")] NhomNhanVien nhomNhanVien)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nhomNhanVien).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(nhomNhanVien);
        }

        // GET: NhomNhanViens/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhomNhanVien nhomNhanVien = await db.NhomNhanViens.FindAsync(id);
            if (nhomNhanVien == null)
            {
                return HttpNotFound();
            }
            return View(nhomNhanVien);
        }

        // POST: NhomNhanViens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            NhomNhanVien nhomNhanVien = await db.NhomNhanViens.FindAsync(id);
            db.NhomNhanViens.Remove(nhomNhanVien);
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
