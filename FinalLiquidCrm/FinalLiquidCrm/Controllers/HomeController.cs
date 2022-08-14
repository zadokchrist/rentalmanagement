using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalLiquidCrm.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
        }

        [HttpPost]
        public ActionResult Index(FormCollection form)
        {
            try
            {
                LiquidLogic.Models.SystemUser systemUser = new LiquidLogic.Models.SystemUser();
                LiquidLogic.Models.UserSearchResult userSearchResult = new LiquidLogic.Models.UserSearchResult();
                systemUser.Username = Request["username"];
                systemUser.UserPassword = Request["pwd"];
                LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor(systemUser);
                userSearchResult = userProcessor.LoginDetails();
                if (userSearchResult.IsSuccessfull)
                {
                    Session["Uid"] = userSearchResult.results[0].Username;
                    Session["Uname"] = userSearchResult.results[0].Username;
                    Session["FullName"] = userSearchResult.results[0].FullName;
                    Session["UserRole"] = userSearchResult.results[0].Userrole;
                    Session["UserEmail"] = userSearchResult.results[0].UserEmail;
                    Session["UserDepartment"] = userSearchResult.results[0].UserCompany;
                    Session["Section"] = userSearchResult.results[0].UserCompany;
                    return RedirectToAction("AdminDashboard", "Admin");
                }
                else
                {
                    ViewBag.Error = userSearchResult.Message;
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
            }
            return View();
        }
    }
}
