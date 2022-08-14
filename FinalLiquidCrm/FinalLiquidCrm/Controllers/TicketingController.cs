using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalLiquidCrm.Controllers
{
    public class TicketingController : Controller
    {
        // GET: Ticketing
        public ActionResult CreateTicket()
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.ComplaintCategories complaintCategories = new LiquidLogic.Models.ComplaintCategories();
                    LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor();
                    complaintCategories = ticketProcessor.GetComplaintCategories();
                    if (complaintCategories.IsSuccessfull)
                    {
                        ViewBag.Categories = complaintCategories.complaintCategories;
                        //GetOperationAreas("10");
                    }
                    else
                    {
                        ViewBag.Error = complaintCategories.Message;
                    }
                }
                catch (Exception ex)
                {

                    ViewBag.Error = ex.Message;
                }
                return View();
            }
            
        }

        public ActionResult InstantResolve(string ticketid) 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.ticketid = ticketid;
                ViewBag.Message = "COMPLAINT REGISTERED SUCCESSFULLY WITH ID "+ ticketid;
                return View();
            }
                
        }
        public ActionResult AssignTicket(string ticketid)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.TicketId = ticketid;
                LiquidLogic.Models.UserDepartments userDepartments = new LiquidLogic.Models.UserDepartments();
                LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor();
                userDepartments = userProcessor.GetUserDepartments("");
                if (userDepartments.IsSuccessfull)
                {
                    ViewBag.UserDepartments = userDepartments.departments;
                }
                else
                {
                    ViewBag.Error = userDepartments.Message;
                }
                return View();
            }
            
        }
        [HttpPost]
        public ActionResult AssignTicket() 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.Ticket ticket = new LiquidLogic.Models.Ticket();
                    ticket.ticket_id = Request["ticketId"];
                    ticket.admin_remark = Request["reason"];
                    ticket.AssignedTo = Request["todepart"];
                    ticket.resolvedby = Session["Uname"].ToString();
                    ticket.email_id = Session["UserEmail"].ToString();
                    LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor(ticket);
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    response = ticketProcessor.EscalateTicket();
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
        [HttpPost]
        public ActionResult CreateTicket(FormCollection collection)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.Ticket ticket = new LiquidLogic.Models.Ticket();
                    ticket.ComplainantType = Request["comptype"];
                    ticket.CustRef = Request["complainantref"];
                    ticket.CustName = Request["custname"];
                    ticket.ComplaintSource = Request["ticketsrc"];
                    ticket.ComplaintCategory = Request["compcategory"];
                    ticket.ComplaintSubCategory = Request["subcategory"];
                    ticket.CustName = Request["custName"];
                    ticket.CustContact = Request["custcontact"];
                    ticket.email_id = Request["emailcontact"];
                    ticket.prioprity = Request["priority"];
                    ticket.TicketDetails = Request["tickdet"];
                    ticket.AreaCode = Request["oparea"];
                    ticket.BranchCode = Request["branch"];
                    if (string.IsNullOrEmpty(ticket.ComplainantType))
                    {
                        ViewBag.Error = "Please Select Complainant Type";
                    }
                    else if (string.IsNullOrEmpty(ticket.CustRef) && ticket.ComplainantType.Equals("Registered"))
                    {
                        ViewBag.Error = "Please Enter Customer Ref";
                    }
                    else if (string.IsNullOrEmpty(ticket.prioprity))
                    {
                        ViewBag.Error = "Please Select Ticket Priority";
                    }
                    else
                    {
                        LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor(ticket);
                        LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                        LiquidLogic.Models.GenericAreaTerritoryResponse respbranch,resparea = new LiquidLogic.Models.GenericAreaTerritoryResponse();
                        resparea = ticketProcessor.GetAreaCodeById("1");//assigned one to get default areas since billing system had not operationalised the areas//ticketProcessor.GetAreaCodeById(ticket.AreaCode);
                        respbranch = ticketProcessor.GetBrachCodeById(ticket.BranchCode);
                        ticket.BranchCode = respbranch.genericAreaTerritories[0].Code;
                        ticket.BranchName = respbranch.genericAreaTerritories[0].name;
                        ticket.AreaName = resparea.genericAreaTerritories[0].name;
                        ticket.AreaCode = resparea.genericAreaTerritories[0].Code;
                        response = ticketProcessor.RecordTicket();
                        if (response.IsSuccessfull)
                        {
                            return RedirectToAction("InstantResolve", "Ticketing", new { ticketid = response.Message });
                        }
                        else
                        {
                            ViewBag.Error = response.Message;
                        }
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                }
                return View();
            }
            
        }
        public ActionResult TicketDetails(string ticketid) 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.Ticket ticket = new LiquidLogic.Models.Ticket();
                    ticket.ticket_id = ticketid;
                    LiquidLogic.Models.TicketSearch ticketSearch = new LiquidLogic.Models.TicketSearch();
                    LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor(ticket);
                    ticketSearch = ticketProcessor.GetTicketById();
                    if (ticketSearch.IsSuccessfull)
                    {
                        ViewBag.Ticket = ticketSearch.tickets;
                        LiquidLogic.Models.TicketResolutionSearch ticketResolutionSearch = new LiquidLogic.Models.TicketResolutionSearch();
                        ticketResolutionSearch = ticketProcessor.GetTicketResolutionDetails();
                        if (ticketResolutionSearch.IsSuccessfull)
                        {
                            ViewBag.TicketResolutionSearch = ticketResolutionSearch.ticketResolutions;
                        }
                    }
                    else
                    {
                        ViewBag.Error = ticketSearch.Message;
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                }
                return View();
            }
            
        }
        public ActionResult ViewTickets() 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.TicketSearch ticketSearch = new LiquidLogic.Models.TicketSearch();
                    LiquidLogic.Models.Ticket ticket = new LiquidLogic.Models.Ticket();
                    LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor(ticket);
                    ticketSearch = ticketProcessor.GetTickets();
                    if (ticketSearch.IsSuccessfull)
                    {
                        ViewBag.Tickets = ticketSearch.tickets;
                    }
                    else
                    {
                        ViewBag.Error = ticketSearch.Message;
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                }
                return View();
            }
            
        }
        public ActionResult ResolveTicket(string ticketid) 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.Ticket ticket = new LiquidLogic.Models.Ticket();
                    ticket.ticket_id = ticketid;
                    LiquidLogic.Models.TicketSearch ticketSearch = new LiquidLogic.Models.TicketSearch();
                    LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor(ticket);
                    ticketSearch = ticketProcessor.GetTicketById();
                    if (ticketSearch.IsSuccessfull)
                    {
                        ViewBag.Ticket = ticketSearch.tickets;
                        LiquidLogic.Models.TicketResolutionSearch ticketResolutionSearch = new LiquidLogic.Models.TicketResolutionSearch();
                        ticketResolutionSearch = ticketProcessor.GetTicketResolutionDetails();
                        if (ticketResolutionSearch.IsSuccessfull)
                        {
                            ViewBag.TicketResolutionSearch = ticketResolutionSearch.ticketResolutions;
                        }
                    }
                    else
                    {
                        ViewBag.Error = ticketSearch.Message;
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                }
                return View();
            }
            
        }
        [HttpPost]
        public ActionResult ResolveTicket(FormCollection collection)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.Ticket ticket = new LiquidLogic.Models.Ticket();
                    ticket.ticket_id = Request["ticket_id"];
                    ticket.admin_remark = Request["resolution"];
                    ticket.resolvedby = Session["FullName"].ToString();
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor(ticket);
                    response = ticketProcessor.ResolveTicket();
                    if (response.IsSuccessfull)
                    {
                        ViewBag.Message = response.Message;
                        return RedirectToAction("ViewTickets", "Ticketing");
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

        public string GetComplaintSubCategoriesByid(string CustRef)
        {
            LiquidLogic.Models.BillingCustomers billingCustomers = new LiquidLogic.Models.BillingCustomers();
            try
            {

                LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor();

                billingCustomers = ticketProcessor.GetBillingCustomerDetails(CustRef);
                if (billingCustomers.IsSuccessfull)
                {
                    string serialize = JsonConvert.SerializeObject(billingCustomers.billingCustomers) ;

                }
                else
                {
                    ViewBag.Error = billingCustomers.Message;
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
            }
            return JsonConvert.SerializeObject(billingCustomers.billingCustomers);
        }

        public string GetOperationAreas(string id)
        {
            string serialize = "";
                try
                {
                    LiquidLogic.Models.GenericAreaTerritoryResponse response = new LiquidLogic.Models.GenericAreaTerritoryResponse();
                    LiquidLogic.Models.Ticket ticket = new LiquidLogic.Models.Ticket();
                    LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor(ticket);
                    response = ticketProcessor.GetBillingOperationAreaDetails(id);
                    if (response.IsSuccessfull)
                    {
                    serialize = JsonConvert.SerializeObject(response.genericAreaTerritories);
                    }
                    else
                    {
                      serialize = response.Message;
                    }
                }
                catch (Exception ex)
                {
                serialize = ex.Message;
                }
            return serialize;

        }

        public string GetBranchesByOpsId(string opsid)
        {
            LiquidLogic.Models.GenericAreaTerritoryResponse response = new LiquidLogic.Models.GenericAreaTerritoryResponse();
            try
            {

                LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor();

                response = ticketProcessor.GetBranchesByOpsId(opsid);
                if (response.IsSuccessfull)
                {
                    string serialize = JsonConvert.SerializeObject(response.genericAreaTerritories);

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
            return JsonConvert.SerializeObject(response.genericAreaTerritories);
        }
    }
}