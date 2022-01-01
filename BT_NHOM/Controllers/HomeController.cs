using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BT_NHOM.Controllers
{
    public class HomeController : RedirectingActionController
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Updatesuccess()
        {
            return View();
        }
    }
}