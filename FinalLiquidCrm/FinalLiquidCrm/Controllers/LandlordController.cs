using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalLiquidCrm.Controllers
{
    public class LandlordController : Controller
    {
        LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
        LiquidLogic.Logic.RentalProcessor processor = new LiquidLogic.Logic.RentalProcessor();
        public ActionResult ViewLandlords()
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    response = processor.GetLandlords();
                    if (response.IsSuccessfull)
                    {
                        ViewBag.LandLords = response.list;
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
        }
        public ActionResult AddLandlord()
        {

            return View();
        }

        [HttpPost]
        public ActionResult AddLandlord(FormCollection form)
        {
            try
            {
                LiquidLogic.Models.LandLord landLord = new LiquidLogic.Models.LandLord();
                landLord.name = Request["name"];
                landLord.email = Request["email"];
                landLord.tel = Request["tel"];
                response = processor.AddLandLord(landLord);
                if (response.IsSuccessfull)
                {
                    ViewBag.Message = response.Message;
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
    }
}