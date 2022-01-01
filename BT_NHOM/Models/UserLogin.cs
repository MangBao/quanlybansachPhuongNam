using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BT_NHOM.Models
{
    [Serializable]
    public class UserLogin
    {
        private QLBSPhuongNamEntities db = new QLBSPhuongNamEntities();

        [Required]
        public string Email { get; set; }
        [Required]
        public string Matkhau { get; set; }

        public string IDNhom { get; set; }
        public NhanVien GetById(string email)
        {
            return db.NhanViens.SingleOrDefault(x => x.Email == email);
        }
        public List<string> GetListCredential(string email)
        {
            var user = db.NhanViens.Single(x => x.Email == email);
            var data = (from a in db.DanhSachQuyens
                        join b in db.NhomNhanViens on a.IDNhom equals b.IDNhom
                        join c in db.Quyens on a.IDQuyen equals c.IDQuyen
                        where b.IDNhom == user.IDNhom
                        select new
                        {
                            IDQuyen = a.IDQuyen,
                            IDNhom = a.IDNhom
                        }).AsEnumerable().Select(x => new DanhSachQuyen()
                        {
                            IDQuyen = x.IDQuyen,
                            IDNhom = x.IDNhom
                        });
            return data.Select(x => x.IDQuyen).ToList();

        }
        public int Login(string userName, string passWord, bool isLoginAdmin = false)
        {
            var result = db.NhanViens.SingleOrDefault(x => x.Email == userName); // usẻName to Email
            if (result == null)
            {
                return 0;
            }

            // Này admin nè
            else if (isLoginAdmin == true)
            {
                if (result.IDNhom != Common.CommonConstants.MEMBER_GROUP)
                {
                    if (result.Matkhau == passWord)
                        return 1; // là admin,nv tk mk đúng
                    else
                        return -2; // là admin,nv mật khẩu sai
                }
            }

            return 10;
        }
    }
}