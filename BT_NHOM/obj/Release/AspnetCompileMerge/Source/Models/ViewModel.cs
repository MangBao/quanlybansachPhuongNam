using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;

namespace BT_NHOM.Models
{
    public class ViewModels
    {
        public IPagedList<Sach> Saches { get; set; }
        public IEnumerable<TheLoai> TheLoais { get; set; }        
    }
}