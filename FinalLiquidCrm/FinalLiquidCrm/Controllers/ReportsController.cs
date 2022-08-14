using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalLiquidCrm.Controllers
{
    public class ReportsController : Controller
    {
        // GET: Reports
        public ActionResult ComplaintReport()
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

        public ActionResult AuditReport() 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor();
                    LiquidLogic.Models.AuditReports auditReports = new LiquidLogic.Models.AuditReports();
                    auditReports = userProcessor.GetAuditReport();
                    if (auditReports.IsSuccessfull)
                    {
                        ViewBag.AuditReport = auditReports.auditReports;
                    }
                    else
                    {
                        ViewBag.Error = auditReports.Message;
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
}