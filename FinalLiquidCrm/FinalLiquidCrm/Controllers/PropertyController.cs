using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalLiquidCrm.Controllers
{
    public class PropertyController : Controller
    {
        LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
        LiquidLogic.Models.Property property = new LiquidLogic.Models.Property();
        LiquidLogic.Logic.RentalProcessor processor = new LiquidLogic.Logic.RentalProcessor();
        // GET: Property
        public ActionResult ViewProperties(string LandloadId)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    ViewBag.Landlordid = LandloadId;
                    property.LandLordId = LandloadId;
                    response = processor.GetProperties(property);
                    if (response.IsSuccessfull)
                    {
                        ViewBag.Properties = response.list;

                    }
                    else
                    {
                        ViewBag.Error = response.Message;
                    }
                }
                catch (Exception EX)
                {
                    ViewBag.Error = EX.Message;
                }
            }
            
            return View();
        }

        public ActionResult AddProperty(string LandloardId)
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddProperty(FormCollection collection,string LandloadId) 
        {
            try
            {
                property.LandLordId = LandloadId;
                property.PRN = Request["prn"];
                property.PropertyLoc = Request["proploc"];
                property.Longtitude = Request["longtitude"];
                property.Latitude = Request["latitude"];
                property.TotalRooms = Request["numrooms"];
                response = processor.AddProperty(property);
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