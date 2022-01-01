using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BT_NHOM.Models
{
    public class HasCredentialAttribute : AuthorizeAttribute
    {
        // Ví dụ như bây giờ muốn cho member vào trong NguoiDungs/Index thử
        public string RoleID { set; get; }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {

            // check session
            var session = (UserLogin)HttpContext.Current.Session[Models.CommonConstants.USER_SESSION];
            if (session != null)
            {
                // lấy ra list quyền mà groupid được phép
                List<string> privilegeLevels = this.GetCredentialByLoggedInUser(session.Email); // Call another method to get rights of the user from DB
                if (privilegeLevels.Contains(this.RoleID) || session.IDNhom == Common.CommonConstants.ADMIN_GROUP) //Nếu admin thì không xét quyền nữa, ngược lại sẽ xét quyền, không cần thêm hằng số nữa
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return true;
            }
        }
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new ViewResult
            {
                ViewName = "~/Views/Shared/Error.cshtml"
            };
        }
        private List<string> GetCredentialByLoggedInUser(string userName)
        {
            // List nay lay tu session ra  (ep sang string)
            var credentials = (List<string>)HttpContext.Current.Session[Models.CommonConstants.SESSION_CREDENTIALS];
            return credentials;
        }
    }
}