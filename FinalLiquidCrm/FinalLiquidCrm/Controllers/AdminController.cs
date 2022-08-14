using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalLiquidCrm.Controllers
{
    
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult AdminDashboard()
        {
            if (Session["FullName"] == null)    
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    if (string.IsNullOrEmpty(Session["Uname"].ToString()))
                    {
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        return View();
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                }
                return View();
            }
            
        }

        public ActionResult LogOut() 
        {
            if (string.IsNullOrEmpty(Session["Uname"].ToString()))
            {
                Session.RemoveAll();
                return RedirectToAction("Index", "Home");
            }
            else
            {
                Session.RemoveAll();
                return RedirectToAction("Index", "Home");
            }
        }

        
    }
}