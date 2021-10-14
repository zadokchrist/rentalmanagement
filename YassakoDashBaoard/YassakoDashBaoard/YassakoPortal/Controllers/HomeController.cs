using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace YassakoPortal.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(FormCollection login)
        {
            try
            {
                YassakoPortalLogic.Models.SystemUser user = new YassakoPortalLogic.Models.SystemUser();
                user.Username = Request.Form["username"];
                user.UserPassword = Request.Form["password"];
                YassakoPortalLogic.Logic.UserProcessor userProcessor = new YassakoPortalLogic.Logic.UserProcessor(user);
                YassakoPortalLogic.Models.UserSearchResult searchResult = new YassakoPortalLogic.Models.UserSearchResult();
                searchResult = userProcessor.LoginDetails();
                if (searchResult.IsSuccessfull)
                {
                    List<YassakoPortalLogic.Models.SystemUser> systemUsers = new List<YassakoPortalLogic.Models.SystemUser>();
                    systemUsers = searchResult.results;
                    Session["Uid"] = systemUsers[0].UserEmail;
                    Session["Uname"] = systemUsers[0].Username;
                    Session["FullName"] = systemUsers[0].FullName;
                    Session["Utype"] = systemUsers[0].UserCompany;
                    Session["UserRole"] = systemUsers[0].Userrole;
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    ViewBag.Message = searchResult.Message;
                }
            }
            catch (Exception ex)
            {
                ViewBag.Message = ex.Message;
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
    }
}