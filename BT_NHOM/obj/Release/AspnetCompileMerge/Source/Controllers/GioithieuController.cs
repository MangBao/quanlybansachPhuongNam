using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BT_NHOM.Controllers
{
    public class GioithieuController : Controller
    {
        // GET: Gioithieu
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AdminView()
        {
            return View();
        }
    }
}