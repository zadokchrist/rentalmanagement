using LiquidLogic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Logic
{
    public class TicketProcessor
    {
        Ticket ticket;
        DatabaseHandler dh = new DatabaseHandler();
        DataTable dataTable;
        public TicketProcessor(Ticket ticket)
        {
            this.ticket = ticket;
        }
        public TicketProcessor() 
        { }

        public TicketSearch GetTickets()
        {
            TicketSearch ticketSearch = new TicketSearch();
            try
            {
                dataTable = dh.GetTicketes();
                if (dataTable.Rows.Count > 0)
                {
                    List<Ticket> tickets = new List<Ticket>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        Ticket ticket = new Ticket();
                        ticket.ticket_id = dr["ticket_id"].ToString();
                        ticket.ComplainantType = dr["ComplaintType"].ToString();
                        ticket.CustRef = dr["CustRef"].ToString();
                        ticket.CustName = dr["CustName"].ToString();
                        ticket.ComplaintSource = dr["ComplaintSource"].ToString();
                        ticket.ComplaintCategoryId = dr["CategoryId"].ToString();
                        ticket.ComplaintCategory = dr["ComplaintCategory"].ToString();
                        ticket.ComplaintSubCategory = dr["CompSubCategory"].ToString();
                        ticket.CustContact = dr["CustPhone"].ToString();
                        ticket.email_id = dr["email_id"].ToString();
                        ticket.prioprity = dr["prioprity"].ToString();
                        ticket.BranchName = dr["BranchName"].ToString();
                        ticket.AreaName = dr["AreaName"].ToString();
                        ticket.status = dr["status"].ToString();
                        ticket.posting_date = dr["posting_date"].ToString();
                        
                        tickets.Add(ticket);
                    }
                    ticketSearch.tickets = tickets;
                    ticketSearch.IsSuccessfull = true;
                    ticketSearch.Message = "SUCCESS";
                }
                else
                {
                    ticketSearch.IsSuccessfull = false;
                    ticketSearch.Message = "NO TICKETS FOUND";

                }
            }
            catch (Exception ex)
            {
                dh.LogError("GetTickets", "TicketProcessor", ex.Message, "LiquidCRM");
                ticketSearch.IsSuccessfull = false;
                ticketSearch.Message = ex.Message;
            }
            return ticketSearch;
        }
        public TicketSearch GetTicketById()
        {
            TicketSearch ticketSearch = new TicketSearch();
            try
            {
                dataTable = dh.GetTicketById(ticket.ticket_id);
                if (dataTable.Rows.Count > 0)
                {
                    List<Ticket> tickets = new List<Ticket>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        Ticket ticket = new Ticket();
                        ticket.ticket_id = dr["ticket_id"].ToString();
                        ticket.ComplainantType = dr["ComplaintType"].ToString();
                        ticket.CustRef = dr["CustRef"].ToString();
                        ticket.CustName = dr["CustName"].ToString();
                        ticket.ComplaintSource = dr["ComplaintSource"].ToString();
                        ticket.ComplaintCategory = dr["ComplaintCategory"].ToString();
                        ticket.ComplaintSubCategory = dr["CompSubCategory"].ToString();
                        ticket.CustContact = dr["CustPhone"].ToString();
                        ticket.email_id = dr["email_id"].ToString();
                        ticket.prioprity = dr["prioprity"].ToString();
                        ticket.TicketDetails = dr["TicketDetails"].ToString();
                        ticket.status = dr["status"].ToString();
                        ticket.posting_date = dr["posting_date"].ToString();
                        ticket.BranchName = dr["BranchName"].ToString();
                        ticket.AreaName = dr["AreaName"].ToString();
                        tickets.Add(ticket);
                    }
                    ticketSearch.tickets = tickets;
                    ticketSearch.IsSuccessfull = true;
                    ticketSearch.Message = "SUCCESS";
                }
                else
                {
                    ticketSearch.IsSuccessfull = false;
                    ticketSearch.Message = "NO TICKETS FOUND";

                }
            }
            catch (Exception ex)
            {
                dh.LogError("GetTickets", "TicketProcessor", ex.Message, "LiquidCRM");
                ticketSearch.IsSuccessfull = false;
                ticketSearch.Message = ex.Message;
            }
            return ticketSearch;
        }

        public TicketSearch GetTicketById(string ticketid)
        {
            TicketSearch ticketSearch = new TicketSearch();
            try
            {
                dataTable = dh.GetTicketById(ticketid);
                if (dataTable.Rows.Count > 0)
                {
                    List<Ticket> tickets = new List<Ticket>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        Ticket ticket = new Ticket();
                        ticket.ticket_id = dr["ticket_id"].ToString();
                        ticket.ComplainantType = dr["ComplaintType"].ToString();
                        ticket.CustRef = dr["CustRef"].ToString();
                        ticket.CustName = dr["CustName"].ToString();
                        ticket.ComplaintSource = dr["ComplaintSource"].ToString();
                        ticket.ComplaintCategory = dr["ComplaintCategory"].ToString();
                        ticket.ComplaintSubCategory = dr["CompSubCategory"].ToString();
                        ticket.CustContact = dr["CustPhone"].ToString();
                        ticket.email_id = dr["email_id"].ToString();
                        ticket.prioprity = dr["prioprity"].ToString();
                        ticket.TicketDetails = dr["TicketDetails"].ToString();
                        ticket.status = dr["status"].ToString();
                        ticket.posting_date = dr["posting_date"].ToString();
                        tickets.Add(ticket);
                    }
                    ticketSearch.tickets = tickets;
                    ticketSearch.IsSuccessfull = true;
                    ticketSearch.Message = "SUCCESS";
                }
                else
                {
                    ticketSearch.IsSuccessfull = false;
                    ticketSearch.Message = "NO TICKETS FOUND";

                }
            }
            catch (Exception ex)
            {
                dh.LogError("GetTickets", "TicketProcessor", ex.Message, "LiquidCRM");
                ticketSearch.IsSuccessfull = false;
                ticketSearch.Message = ex.Message;
            }
            return ticketSearch;
        }

        public TicketResolutionSearch GetTicketResolutionDetails() 
        {
            TicketResolutionSearch ticketResolutionSearch = new TicketResolutionSearch();
            try
            {
                dataTable = dh.GetTicketResolutionDetails(ticket.ticket_id);
                if (dataTable.Rows.Count>0)
                {
                    ticketResolutionSearch.IsSuccessfull = true;
                    List<TicketResolution> ticketResolutions = new List<TicketResolution>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        TicketResolution ticketResolution = new TicketResolution();
                        ticketResolution.RecordDate = dr["RecordDate"].ToString();
                        ticketResolution.RecordId = dr["RecordId"].ToString();
                        ticketResolution.ResolutionDetails = dr["ResolutionDetails"].ToString();
                        ticketResolution.Status = dr["Status"].ToString();
                        ticketResolution.Ticket_id = dr["Ticket_id"].ToString();
                        ticketResolution.EscalatedTo = dr["EscalatedTo"].ToString();
                        ticketResolution.RecordedBy = dr["RecordedBy"].ToString();
                        ticketResolutions.Add(ticketResolution);
                        
                    }
                    ticketResolutionSearch.ticketResolutions = ticketResolutions;
                }
                else
                {
                    ticketResolutionSearch.IsSuccessfull = false;
                    ticketResolutionSearch.Message = "NO RESOLUTION FOUND";
                }
            }
            catch (Exception ex)
            {
                ticketResolutionSearch.IsSuccessfull = false;
                ticketResolutionSearch.Message = ex.Message;
            }
            return ticketResolutionSearch;
        }
        public GenericResponse EscalateTicket() 
        {
            GenericResponse response = new GenericResponse();
            try
            {
                
                dh.EscalateTicket(ticket.ticket_id, ticket.admin_remark, ticket.AssignedTo,ticket.resolvedby);
                //Send email to the department
                EmailProcessor emailProcessor = new EmailProcessor();
                UserProcessor userProcessor = new UserProcessor();
                UserDepartments userDepartments = new UserDepartments();
                TicketSearch ticketSearch = new TicketSearch();
                GenericResponse resp = new GenericResponse();
                userDepartments = userProcessor.GetUserDepartmentsById(ticket.AssignedTo);
                string departmentname = userDepartments.departments[0].DepartmentName;
                string departmentemail = userDepartments.departments[0].Departmentemail;
                ticketSearch = GetTicketById(ticket.ticket_id);
                string complaintdetails = ticketSearch.tickets[0].TicketDetails;
                string Message = "Dear " + departmentname + ",<br>A new complaint has been created in the customer care system that requires your attention.<br>";
                Message += "Complaint id: " + ticket.ticket_id + "<br>Complaint Details : " + complaintdetails;
                resp = emailProcessor.SendEmailWithCopy(departmentemail, "CUSTOMER COMPLAINT", Message, ticket.email_id);
                if (resp.IsSuccessfull)
                {
                    response.IsSuccessfull = true;
                    response.Message = "TICKET SUCCESSFULLY ESCALATED AND EMAIL SENT TO THE HEAD OF DEPARTMENT";
                }
                else
                {
                    response.IsSuccessfull = true;
                    response.Message = "TICKET SUCCESSFULLY ESCALATED BUT EMAIL HAS FAILED TO BE SENT DUE TO ERROR :" + resp.Message;
                }
                
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }
        public GenericResponse ResolveTicket()
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.Resolveticket(ticket.ticket_id, ticket.admin_remark,ticket.resolvedby);
                response.IsSuccessfull = true;
                response.Message = "SUCCESSFUL";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public GenericResponse RecordTicket()
        {
            GenericResponse response = new GenericResponse();
            try
            {
                
                dataTable = dh.InsertTicket(ticket.ComplainantType, ticket.CustRef, ticket.CustName, ticket.ComplaintSource, ticket.ComplaintCategory,
                    ticket.ComplaintSubCategory, ticket.CustContact, ticket.email_id, ticket.prioprity, ticket.TicketDetails,ticket.BranchCode,ticket.AreaCode,DateTime.Now.ToString("yyyymmdd"),ticket.AreaName,ticket.BranchName);
                if (dataTable.Rows.Count > 0)
                {
                    response.IsSuccessfull = true;
                    response.Message =  dataTable.Rows[0]["ticket_id"].ToString();
                }
                else
                {
                    response.IsSuccessfull = false;
                    response.Message = "";
                }
            }
            catch (Exception ex)
            {

                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }
        public GenericResponse AssignTicket()
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.AssignTicket(ticket.ticket_id, ticket.AssignedTo, ticket.admin_remark);
                ticket.status = "ESCALATED";
                dh.UpdateTicketStatus(ticket.ticket_id, ticket.status);
                response.IsSuccessfull = true;
                response.Message = "TICKET HAS BEEN ASSIGNED";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public GenericResponse RegisterComplaintCategory(ComplaintCategory category)
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.RegisterComplaintCategory(category.Category);
                response.IsSuccessfull = true;
                response.Message = "COMPLAINT CATEGORY REGISTERED SUCCESSFULLY";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public ComplaintCategories GetComplaintCategoriesById(string categoryid)
        {
            ComplaintCategories complaintCategories = new ComplaintCategories();
            try
            {
                dataTable = dh.GetComplaintCategoriesById(categoryid);
                if (dataTable.Rows.Count > 0)
                {
                    List<ComplaintCategory> complaints = new List<ComplaintCategory>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        ComplaintCategory complaintCategory = new ComplaintCategory();
                        complaintCategory.CategoryId = dr["CategoryId"].ToString();
                        complaintCategory.Category = dr["Category"].ToString();
                        complaintCategory.RecordDate = dr["RecordDate"].ToString();
                        complaints.Add(complaintCategory);
                    }
                    complaintCategories.IsSuccessfull = true;
                    complaintCategories.complaintCategories = complaints;
                    complaintCategories.Message = "SUCCESSFUL";

                }
                else
                {
                    complaintCategories.IsSuccessfull = false;
                    complaintCategories.Message = "NO COMPLAINT CATEGORY FOUND";
                }
            }
            catch (Exception ex)
            {
                complaintCategories.IsSuccessfull = false;
                complaintCategories.Message = ex.Message;
            }
            return complaintCategories;
        }

        public GenericAreaTerritoryResponse GetBranchesByOpsId(string opsid)
        {
            GenericAreaTerritoryResponse response = new GenericAreaTerritoryResponse();
            try
            {
                dataTable = dh.GetBillingBranchesByOpsId(opsid);
                if (dataTable.Rows.Count>0)
                {
                    List<GenericAreaTerritory> branches = new List<GenericAreaTerritory>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        GenericAreaTerritory branch = new GenericAreaTerritory();
                        branch.id = dr["branchId"].ToString();
                        branch.name = dr["branchName"].ToString();
                        branches.Add(branch);
                    }
                    response.IsSuccessfull = true;
                    response.genericAreaTerritories = branches;

                }
                else
                {
                    response.IsSuccessfull = false;
                    response.Message = "NO BRANCHES FOUND FOR OPERATION ID "+opsid;
                }
                
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public ComplaintSubCategories GetComplaintSubCategoriesById(string subcategoryid)
        {
            ComplaintSubCategories complaintSubCategories = new ComplaintSubCategories();
            try
            {
                dataTable = dh.GetComplaintSubCategoriesById(subcategoryid);
                if (dataTable.Rows.Count > 0)
                {
                    List<ComplaintSubCategory> complaintSubs = new List<ComplaintSubCategory>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        ComplaintSubCategory complaintSubCategory = new ComplaintSubCategory();
                        complaintSubCategory.Category = dr["Category"].ToString();
                        complaintSubCategory.Status = (bool.Parse(dr["Status"].ToString()) == true) ? "ACTIVE" : "DISABLED";
                        complaintSubCategory.RecordDate = dr["RecordDate"].ToString();
                        complaintSubCategory.SubCategoryName = dr["SubCategoryName"].ToString();
                        complaintSubCategory.SubCategoryId = dr["SubCategoryId"].ToString();
                        complaintSubs.Add(complaintSubCategory);
                    }
                    complaintSubCategories.IsSuccessfull = true;
                    complaintSubCategories.Message = "SUCCESS";
                    complaintSubCategories.complaintSubCategories = complaintSubs;
                }
                else
                {
                    complaintSubCategories.IsSuccessfull = false;
                    complaintSubCategories.Message = "NO SUB CATEGORIES FOUND";
                }
            }
            catch (Exception ex)
            {
                complaintSubCategories.IsSuccessfull = false;
                complaintSubCategories.Message = ex.Message;
            }
            return complaintSubCategories;
        }

        public GenericResponse UpdateComplaintSubCategory(string subCategoryId, string subCategoryName)
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.UpdateComplaintSubCategory(subCategoryId, subCategoryName);
                response.IsSuccessfull = true;
                response.Message = "Complaint Sub Category Updated Successfully";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public GenericResponse UpdateComplaintCategory(string category, string categoryId)
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.UpdateComplaintCategory(category, categoryId);
                response.IsSuccessfull = true;
                response.Message = "COMPLAINT CATEGORY UPDATED SUCCESSFULLY";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public ComplaintCategories GetComplaintCategories() 
        {
            ComplaintCategories complaintCategories = new ComplaintCategories();
            try
            {
                dataTable = dh.GetComplaintCategories();
                if (dataTable.Rows.Count>0)
                {
                    List<ComplaintCategory> complaints = new List<ComplaintCategory>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        ComplaintCategory complaintCategory = new ComplaintCategory();
                        complaintCategory.CategoryId = dr["CategoryId"].ToString();
                        complaintCategory.Category = dr["Category"].ToString();
                        complaintCategory.RecordDate = dr["RecordDate"].ToString();
                        complaints.Add(complaintCategory);
                    }
                    complaintCategories.IsSuccessfull = true;
                    complaintCategories.complaintCategories = complaints;
                    complaintCategories.Message = "SUCCESSFUL";

                }
                else
                {
                    complaintCategories.IsSuccessfull = false;
                    complaintCategories.Message = "NO COMPLAINT CATEGORY FOUND";
                }
            }
            catch (Exception ex)
            {
                complaintCategories.IsSuccessfull = false;
                complaintCategories.Message = ex.Message;
            }
            return complaintCategories;
        }

        public GenericResponse RegisterComplaintSubCategory(ComplaintSubCategory subCategory) 
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.RegisterComplaintSubCategory(subCategory.CategoryId,subCategory.SubCategoryName);
                response.IsSuccessfull = true;
                response.Message = "COMPLAINT SUBCATEGORY RECORDED SUCCESSFULLY";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = true;
                response.Message = ex.Message;
            }
            return response;
        }

        public ComplaintSubCategories GetComplaintSubCategories() 
        {
            ComplaintSubCategories complaintSubCategories = new ComplaintSubCategories();
            try
            {
                dataTable = dh.GetComplaintSubCategories();
                if (dataTable.Rows.Count>0)
                {
                    List<ComplaintSubCategory> complaintSubs = new List<ComplaintSubCategory>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        ComplaintSubCategory complaintSubCategory = new ComplaintSubCategory();
                        complaintSubCategory.Category = dr["Category"].ToString();
                        complaintSubCategory.Status = (bool.Parse(dr["Status"].ToString()) == true) ? "ACTIVE" : "DISABLED";
                        complaintSubCategory.RecordDate = dr["RecordDate"].ToString();
                        complaintSubCategory.SubCategoryName = dr["SubCategoryName"].ToString();
                        complaintSubCategory.SubCategoryId = dr["SubCategoryId"].ToString();
                        complaintSubs.Add(complaintSubCategory);
                    }
                    complaintSubCategories.IsSuccessfull = true;
                    complaintSubCategories.Message = "SUCCESS";
                    complaintSubCategories.complaintSubCategories = complaintSubs;
                }
                else
                {
                    complaintSubCategories.IsSuccessfull = false;
                    complaintSubCategories.Message = "NO SUB CATEGORIES FOUND";
                }
            }
            catch (Exception ex)
            {
                complaintSubCategories.IsSuccessfull = false;
                complaintSubCategories.Message = ex.Message;
            }
            return complaintSubCategories;
        }

        public ComplaintSubCategories GetComplaintSubCategoriesByCategoryId(string categoryid)
        {
            ComplaintSubCategories complaintSubCategories = new ComplaintSubCategories();
            try
            {
                dataTable = dh.GetComplaintSubCategoriesByCategoryId(categoryid);
                if (dataTable.Rows.Count > 0)
                {
                    List<ComplaintSubCategory> complaintSubs = new List<ComplaintSubCategory>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        ComplaintSubCategory complaintSubCategory = new ComplaintSubCategory();
                        complaintSubCategory.Category = dr["Category"].ToString();
                        complaintSubCategory.Status = (bool.Parse(dr["Status"].ToString()) == true) ? "ACTIVE" : "DISABLED";
                        complaintSubCategory.RecordDate = dr["RecordDate"].ToString();
                        complaintSubCategory.SubCategoryName = dr["SubCategoryName"].ToString();
                        complaintSubCategory.SubCategoryId = dr["SubCategoryId"].ToString();
                        complaintSubs.Add(complaintSubCategory);
                    }
                    complaintSubCategories.IsSuccessfull = true;
                    complaintSubCategories.Message = "SUCCESS";
                    complaintSubCategories.complaintSubCategories = complaintSubs;
                }
                else
                {
                    complaintSubCategories.IsSuccessfull = false;
                    complaintSubCategories.Message = "NO SUB CATEGORIES FOUND";
                }
            }
            catch (Exception ex)
            {
                complaintSubCategories.IsSuccessfull = false;
                complaintSubCategories.Message = ex.Message;
            }
            return complaintSubCategories;
        }

        public BillingCustomers GetBillingCustomerDetails(string custRef) 
        {
            BillingCustomers billingCustomers = new BillingCustomers();
            try
            {
                dataTable = dh.GetBillingCustomerDetails(custRef);
                if (dataTable.Rows.Count>0)
                {
                    List<BillingCustomer> customers = new List<BillingCustomer>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        BillingCustomer billingCustomer = new BillingCustomer();
                        billingCustomer.customerRef = dr["customerRef"].ToString();
                        billingCustomer.customerName = dr["customerName"].ToString();
                        billingCustomer.custEmail = dr["custEmail"].ToString();
                        billingCustomer.phoneNo1 = dr["phoneNo1"].ToString();
                        billingCustomer.Area = dr["Area"].ToString();
                        billingCustomer.AreaId = dr["areaId"].ToString();
                        billingCustomer.BranchId = dr["branchId"].ToString();
                        billingCustomer.Branch = dr["branch"].ToString();
                        customers.Add(billingCustomer);
                    }
                    billingCustomers.billingCustomers = customers;
                    billingCustomers.IsSuccessfull = true;
                    billingCustomers.Message = "SUCCESS";
                }
                else
                {
                    billingCustomers.IsSuccessfull = false;
                    billingCustomers.Message = "CUSTOMER FOUND WITH REF "+ custRef;
                }
            }
            catch (Exception ex)
            {
                billingCustomers.IsSuccessfull = false;
                billingCustomers.Message = ex.Message;
            }
            return billingCustomers;
        }

        public GenericAreaTerritoryResponse GetBillingOperationAreaDetails(string id)
        {
            GenericAreaTerritoryResponse response = new GenericAreaTerritoryResponse();
            try
            {
                dataTable = dh.GetBillingOperationAreas(id);
                if (dataTable.Rows.Count > 0)
                {
                    List<GenericAreaTerritory> areas = new List<GenericAreaTerritory>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        GenericAreaTerritory area = new GenericAreaTerritory();
                        area.id = dr["operationId"].ToString();
                        area.name = dr["operationAreaName"].ToString();
                        areas.Add(area);
                    }
                    response.genericAreaTerritories = areas;
                    response.IsSuccessfull = true;
                    response.Message = "SUCCESS";
                }
                else
                {
                    response.IsSuccessfull = false;
                    response.Message = "NO OPERATION AREA FOUND ";
                }
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public GenericAreaTerritoryResponse GetBrachCodeById(string id) 
        {
            GenericAreaTerritoryResponse response = new GenericAreaTerritoryResponse();
            try
            {
                dataTable = dh.GetBranchCodeById(id);
                if (dataTable.Rows.Count > 0)
                {
                    List<GenericAreaTerritory> areas = new List<GenericAreaTerritory>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        GenericAreaTerritory area = new GenericAreaTerritory();
                        area.id = dr["branchId"].ToString();
                        area.name = dr["branchName"].ToString();
                        area.Code = dr["branchAlias"].ToString();
                        areas.Add(area);
                    }
                    response.genericAreaTerritories = areas;
                    response.IsSuccessfull = true;
                    response.Message = "SUCCESS";
                }
                else
                {
                    response.IsSuccessfull = false;
                    response.Message = "NO BRANCH FOUND ";
                }
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = true;
                response.Message = ex.Message;
            }
            return response;
        }

        public GenericAreaTerritoryResponse GetAreaCodeById(string id)
        {
            GenericAreaTerritoryResponse response = new GenericAreaTerritoryResponse();
            try
            {
                dataTable = dh.GetAreaCodeById(id);
                if (dataTable.Rows.Count > 0)
                {
                    List<GenericAreaTerritory> areas = new List<GenericAreaTerritory>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        GenericAreaTerritory area = new GenericAreaTerritory();
                        area.id = dr["operationId"].ToString();
                        area.name = dr["operationAreaName"].ToString();
                        area.Code = dr["operationAlias"].ToString();
                        areas.Add(area);
                    }
                    response.genericAreaTerritories = areas;
                    response.IsSuccessfull = true;
                    response.Message = "SUCCESS";
                }
                else
                {
                    response.IsSuccessfull = false;
                    response.Message = "NO BRANCH FOUND ";
                }
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = true;
                response.Message = ex.Message;
            }
            return response;
        }
    }
}
