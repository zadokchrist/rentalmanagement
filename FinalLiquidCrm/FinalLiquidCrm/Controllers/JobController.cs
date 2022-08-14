using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalLiquidCrm.Controllers
{
    public class JobController : Controller
    {
        // GET: Job
        public ActionResult CreateJob(string ticketid)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.Ticketid = ticketid;
                LiquidLogic.Models.GenericAreaTerritoryResponse response = new LiquidLogic.Models.GenericAreaTerritoryResponse();
                LiquidLogic.Models.Ticket ticket = new LiquidLogic.Models.Ticket();
                LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor(ticket);
                response = ticketProcessor.GetBillingOperationAreaDetails("10");
                if (response.IsSuccessfull)
                {
                    ViewBag.OperationalAreas = response.genericAreaTerritories;
                }
                else
                {
                    ViewBag.Error = response.Message;
                }
                return View();
            }
        }

        [HttpPost]
        public ActionResult CreateJob(FormCollection collection)
        {
            try
            {
                if (Session["FullName"] == null)
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    LiquidLogic.Models.JobCard jobcard = new LiquidLogic.Models.JobCard();
                    LiquidLogic.Models.JobCardResponse response = new LiquidLogic.Models.JobCardResponse();
                    jobcard.TicketId = Request["ticketid"];
                    jobcard.JobType = Request["jobtype"];
                    jobcard.Ycordinates = Request["ycordinate"];
                    jobcard.Xcordinates = Request["xcordinate"];
                    jobcard.BlockMapRef = Request["blockmapref"];
                    if (jobcard.JobType.Equals("Static and Mobile Plant type"))
                    {
                        jobcard.OppArea = Request["oparea"];
                        jobcard.AssetCategory = Request["assetcategory"];
                        jobcard.AssetLocation = Request["assetloc"];
                        jobcard.AssetType = Request["assettype"];
                        jobcard.AssetReference = Request["assetreference"];
                    }
                    else if (jobcard.JobType.Equals("Technical Field Job"))
                    {
                        jobcard.JobCategory = Request["jobcategory"];
                        jobcard.OppArea = Request["area"];
                        jobcard.Branch = Request["techbranch"];
                        jobcard.Address = Request["address"];
                    }
                    else if (jobcard.JobType.Equals("Admin Asset Management"))
                    {
                        jobcard.OppArea = Request["adminarea"];
                        jobcard.AssetCategory = Request["adminassetcategory"];
                        jobcard.AssetLocation = Request["adminassetloc"];
                        jobcard.AssetType = Request["adminassettype"];
                        jobcard.AssetReference = Request["adminassetreference"];
                        jobcard.AssetDescription = Request["adminassetdescription"];
                    }
                    else if (jobcard.JobType.Equals("Meter Installation"))
                    {
                        jobcard.JobCategory = Request["meterinstalljobcategory"];
                        jobcard.OppArea = Request["meterinstarea"];
                        jobcard.Branch = Request["meterinstbranch"];
                        jobcard.Territory = Request["meterinstterritory"];
                        jobcard.SubTerritory = Request["meterinstsubterritory"];
                        jobcard.MeterType = Request["meterinstmetertype"];
                        jobcard.MeterNumber = Request["meterinstmeternum"];
                        jobcard.MeterReading = Request["mireading"];
                    }
                    LiquidLogic.Logic.JobCardProcessor processor = new LiquidLogic.Logic.JobCardProcessor(jobcard);
                    response = processor.AddJobCard();

                    if (response.IsSuccessfull)
                    {
                        ViewBag.Message = "JOB SUCCESSFULLY CREATED";
                    }
                    else
                    {
                        ViewBag.Error = response.Message;
                    }
                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
            }
            return View();
        }

        public ActionResult ViewJobs() 
        {
            try
            {
                LiquidLogic.Models.JobCardResponse response = new LiquidLogic.Models.JobCardResponse();
                LiquidLogic.Logic.JobCardProcessor processor = new LiquidLogic.Logic.JobCardProcessor();
                response = processor.GetJobCards();
                if (response.IsSuccessfull)
                {
                    ViewBag.JobCards = response.jobCards;
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

        public string AddMaterialsRequired(string ticketid,string materialtype,string materialsize,string qty) 
        {
            
            LiquidLogic.Models.JobCardResponse response = new LiquidLogic.Models.JobCardResponse();
            try
            {
                LiquidLogic.Models.JobCard jobCard = new LiquidLogic.Models.JobCard();
                jobCard.TicketId = ticketid;
                jobCard.MaterialType = materialtype;
                jobCard.Size = materialsize;
                jobCard.Qty = qty;
                LiquidLogic.Logic.JobCardProcessor cardProcessor = new LiquidLogic.Logic.JobCardProcessor(jobCard);
                response = cardProcessor.AddRequiredMaterials();
                if (response.IsSuccessfull)
                {
                    return JsonConvert.SerializeObject(response.jobCards);
                }
                else
                {
                    string[] errorresp = { response.IsSuccessfull.ToString(), response.Message };
                    return JsonConvert.SerializeObject(errorresp);
                }
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
                string[] errorresp = { response.IsSuccessfull.ToString(), response.Message };
                return JsonConvert.SerializeObject(errorresp);
            }
        }

        public string AddMaterialsPurchased(string ticketid, string materialtype, string materialsize, string qty,string cost)
        {

            LiquidLogic.Models.JobCardResponse response = new LiquidLogic.Models.JobCardResponse();
            try
            {
                LiquidLogic.Models.JobCard jobCard = new LiquidLogic.Models.JobCard();
                jobCard.TicketId = ticketid;
                jobCard.MaterialType = materialtype;
                jobCard.Size = materialsize;
                jobCard.Qty = qty;
                jobCard.Cost = cost;
                LiquidLogic.Logic.JobCardProcessor cardProcessor = new LiquidLogic.Logic.JobCardProcessor(jobCard);
                response = cardProcessor.AddRequiredMaterials();
                if (response.IsSuccessfull)
                {
                    return JsonConvert.SerializeObject(response.jobCards);
                }
                else
                {
                    string[] errorresp = { response.IsSuccessfull.ToString(), response.Message };
                    return JsonConvert.SerializeObject(errorresp);
                }
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
                string[] errorresp = { response.IsSuccessfull.ToString(), response.Message };
                return JsonConvert.SerializeObject(errorresp);
            }
        }
    }
}