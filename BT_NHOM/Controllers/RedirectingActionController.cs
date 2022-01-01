using BT_NHOM.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace BT_NHOM.Controllers
{
	public class RedirectingActionController : Controller
	{
		// Method này dùng để kiểm tra session == null thì chuyển về controller login
		protected override void OnActionExecuting(ActionExecutingContext context)
		{
			var session = (UserLogin)Session[CommonConstants.USER_SESSION];
			if (session == null)
			{
				context.Result = new RedirectToRouteResult(new
				RouteValueDictionary(new { controller = "Logins", action = "Login" }));

			}
			base.OnActionExecuting(context);
		}
	}
}