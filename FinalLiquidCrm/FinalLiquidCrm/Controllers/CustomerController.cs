using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalLiquidCrm.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        public ActionResult CustomerProfile(string custid)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    ViewBag.appid = custid;
                    LiquidLogic.Models.Application application = new LiquidLogic.Models.Application();
                    LiquidLogic.Models.ApplicationSearch response = new LiquidLogic.Models.ApplicationSearch();
                    application.AppId = custid;
                    LiquidLogic.Logic.ApplicationProcessor applicationProcessor = new LiquidLogic.Logic.ApplicationProcessor(application);
                    response = applicationProcessor.GetApplicationsById();
                    if (response.IsSuccessfull)
                    {
                        ViewBag.Message = "APPLICATION ID : " + response.Applications[0].AppId;
                        ViewBag.Applications = response.Applications;
                    }
                    else
                    {
                        ViewBag.Error = response.Message;
                    }

                    LiquidLogic.Models.AppAssignment appAssignment = new LiquidLogic.Models.AppAssignment();
                    appAssignment.ApplicationId = custid;
                    appAssignment.Status = "";
                    LiquidLogic.Logic.ApplicationProcessor applicationProcessor1 = new LiquidLogic.Logic.ApplicationProcessor(appAssignment);
                    LiquidLogic.Models.AppAssignmentSearch assignmentSearch = new LiquidLogic.Models.AppAssignmentSearch();
                    assignmentSearch = applicationProcessor1.GetAppAssignments();
                    if (assignmentSearch.IsSuccessfull)
                    {
                        ViewBag.AppAssignments = assignmentSearch.appAssignments;
                    }
                    else
                    {
                        ViewBag.Error = assignmentSearch.Message;
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                }
                return View();
            }
            
        }

        public ActionResult CustomerBalance() 
        {
            return View();
        }

        public ActionResult PackageSelection() 
        {
            return View();
        }

        public ActionResult ScheduleInstallation() 
        {
            return View();
        }

        [HttpPost]
        public ActionResult CustomerBalance(FormCollection collection) 
        {
            try
            {
                string custemail = Request["custemail"];
                LiquidLogic.Models.Application application = new LiquidLogic.Models.Application();
                LiquidLogic.Models.ApplicationSearch response = new LiquidLogic.Models.ApplicationSearch();
                application.CustomerEmail = custemail;
                LiquidLogic.Logic.ApplicationProcessor applicationProcessor = new LiquidLogic.Logic.ApplicationProcessor(application);
                response = applicationProcessor.GetApplicationsByEmail();
                if (response.IsSuccessfull)
                {
                    ViewBag.Message = "APPLICATION ID : " + response.Applications[0].AppId;
                    ViewBag.Applications = response.Applications;
                }
                else
                {
                    ViewBag.Error = response.Message;
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
            }
            return View();
        }
        [HttpPost]
        public ActionResult CustomerProfile(FormCollection form) 
        {
            try
            {

            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
            }
            return View();
        }
    }
}