//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BT_NHOM.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public partial class NhanVien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NhanVien()
        {
            this.HoaDons = new HashSet<HoaDon>();
        }

        [Display(Name = "Mã nhân viên")]
        public string MaNV { get; set; }

        [Display(Name = "Họ nhân viên")]
        [Required(ErrorMessage = "Bạn chưa nhập họ nhân viên")]
        public string HoNV { get; set; }
        [Display(Name = "Tên nhân viên")]
        [Required(ErrorMessage = "Bạn chưa nhập tên nhân viên")]
        public string TenNV { get; set; }
        [Display(Name = "Giới tính")]
        public Nullable<bool> GioiTinh { get; set; }
        [Display(Name = "Địa chỉ")]
        [Required(ErrorMessage = "Bạn chưa nhập địa chỉ")]
        public string DiaChi { get; set; }
        [Display(Name = "SĐT")]
        [Required(ErrorMessage = "Bạn chưa nhập SĐT")]
        public string SoDTNV { get; set; }
        
        [Display(Name = "Ảnh nhân viên")]
 
        public string AnhNV { get; set; }
        [Display(Name = "Email")]
        [Required(ErrorMessage = "Bạn chưa nhập địa chỉ email")]
        [EmailAddress(ErrorMessage = "Địa chỉ email không hợp lệ")]
        public string Email { get; set; }
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Bạn chưa nhập mật khẩu")]
        public string Matkhau { get; set; }
        [Display(Name = "Nhóm nhân viên")]

        public string IDNhom { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }
        public virtual NhomNhanVien NhomNhanVien { get; set; }
    }
}
