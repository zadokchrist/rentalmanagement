using LiquidLogic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Logic
{
    public class ApplicationProcessor
    {
        DatabaseHandler dh = new DatabaseHandler();
        EmailProcessor emailProcessor = new EmailProcessor();
        Application app;
        AppAssignment appAssignment;
        public ApplicationProcessor(Application application)
        {
            this.app = application;
        }
        public ApplicationProcessor(AppAssignment appAssignment)
        {
            this.appAssignment = appAssignment;
        }

        public GenericResponse RecordApplication()
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.RecordApplication(app.FirstName,app.LastName,app.Gender,app.DOB,app.District,app.SubcountyDivision,app.LC1,app.Village,app.City,app.Nationality,app.Parish,app.ApartmentNumber,app.CustomerTel,app.CustomerEmail,app.IdNumber);

                string Message = "Dear Customer, Please your request for new connection has been received and will receive feedback from our team.";
                //emailProcessor.SendEmail(app.CustomerName, app.CustomerEmail, "APPLICATION FOR NEW CONNECTION", Message);
                response.IsSuccessfull = true;
                response.Message = "APPLICATION REGISTERED SUCCESSFULLY AND EMAIL SENT FOR TRACKING";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public ApplicationSearch GetApplications()
        {
            ApplicationSearch applicationSearch = new ApplicationSearch();
            try
            {
                DataTable table = dh.GetApplications();
                if (table.Rows.Count > 0)
                {
                    List<Application> applications = new List<Application>();
                    foreach (DataRow dr in table.Rows)
                    {
                        Application app = new Application();
                        app.FirstName = dr["Fname"].ToString();
                        app.LastName = dr["Lname"].ToString();
                        app.Gender = dr["Gender"].ToString();
                        app.DOB = dr["DOB"].ToString();
                        app.District = dr["district"].ToString();
                        app.SubcountyDivision = dr["SubCounty"].ToString();
                        app.LC1 = dr["LC1"].ToString();
                        app.Village = dr["Village"].ToString();
                        app.City = dr["City"].ToString();
                        app.Nationality = dr["Nationality"].ToString();
                        app.Parish = dr["Parish"].ToString();
                        app.ApartmentNumber = dr["ApartmentNo"].ToString();
                        app.CustomerTel = dr["CustomerTel"].ToString();
                        app.CustomerEmail = dr["CustomerEmail"].ToString();
                        app.IdNumber = dr["IdNumber"].ToString();
                        app.CustomerTel = dr["CustomerTel"].ToString();
                        app.AppId = dr["ApplicationId"].ToString();
                        app.RecordId = dr["RecordId"].ToString();
                        app.Status = dr["Status"].ToString();
                        app.RecordDate = dr["RecordDate"].ToString();
                        applications.Add(app);
                    }
                    applicationSearch.Applications = applications;
                    applicationSearch.IsSuccessfull = true;
                    applicationSearch.Message = "SUCCESS";
                }
                else
                {
                    applicationSearch.IsSuccessfull = false;
                    applicationSearch.Message = "NO APPLICATIONS AVAILABLE";
                }
            }
            catch (Exception ex)
            {
                applicationSearch.IsSuccessfull = false;
                applicationSearch.Message = ex.Message;
            }
            return applicationSearch;
        }

        public ApplicationSearch GetApplicationsByEmail()
        {
            ApplicationSearch applicationSearch = new ApplicationSearch();
            try
            {
                DataTable table = dh.GetCustomerApplByEmail(app.CustomerEmail);
                if (table.Rows.Count > 0)
                {
                    List<Application> applications = new List<Application>();
                    foreach (DataRow dr in table.Rows)
                    {
                        Application app = new Application();
                        app.FirstName = dr["Fname"].ToString();
                        app.LastName = dr["Lname"].ToString();
                        app.Gender = dr["Gender"].ToString();
                        app.DOB = dr["DOB"].ToString();
                        app.District = dr["district"].ToString();
                        app.SubcountyDivision = dr["SubCounty"].ToString();
                        app.LC1 = dr["LC1"].ToString();
                        app.Village = dr["Village"].ToString();
                        app.City = dr["City"].ToString();
                        app.Nationality = dr["Nationality"].ToString();
                        app.Parish = dr["Parish"].ToString();
                        app.ApartmentNumber = dr["ApartmentNo"].ToString();
                        app.CustomerTel = dr["CustomerTel"].ToString();
                        app.CustomerEmail = dr["CustomerEmail"].ToString();
                        app.IdNumber = dr["IdNumber"].ToString();
                        app.CustomerTel = dr["CustomerTel"].ToString();
                        app.AppId = dr["ApplicationId"].ToString();
                        app.RecordId = dr["RecordId"].ToString();
                        app.Status = dr["Status"].ToString();
                        app.RecordDate = dr["RecordDate"].ToString();
                        applications.Add(app);
                    }
                    applicationSearch.Applications = applications;
                    applicationSearch.IsSuccessfull = true;
                    applicationSearch.Message = "SUCCESS";
                }
                else
                {
                    applicationSearch.IsSuccessfull = false;
                    applicationSearch.Message = "NO APPLICATIONS AVAILABLE";
                }
            }
            catch (Exception ex)
            {
                applicationSearch.IsSuccessfull = false;
                applicationSearch.Message = ex.Message;
            }
            return applicationSearch;
        }
        public ApplicationSearch GetApplicationsById()
        {
            ApplicationSearch applicationSearch = new ApplicationSearch();
            try
            {
                DataTable table = dh.GetApplicationsById(app.AppId);
                if (table.Rows.Count > 0)
                {
                    List<Application> applications = new List<Application>();
                    foreach (DataRow dr in table.Rows)
                    {
                        Application app = new Application();
                        app.FirstName = dr["Fname"].ToString();
                        app.LastName = dr["Lname"].ToString();
                        app.Gender = dr["Gender"].ToString();
                        app.DOB = dr["DOB"].ToString();
                        app.District = dr["district"].ToString();
                        app.SubcountyDivision = dr["SubCounty"].ToString();
                        app.LC1 = dr["LC1"].ToString();
                        app.Village = dr["Village"].ToString();
                        app.City = dr["City"].ToString();
                        app.Nationality = dr["Nationality"].ToString();
                        app.Parish = dr["Parish"].ToString();
                        app.ApartmentNumber = dr["ApartmentNo"].ToString();
                        app.CustomerTel = dr["CustomerTel"].ToString();
                        app.CustomerEmail = dr["CustomerEmail"].ToString();
                        app.IdNumber = dr["IdNumber"].ToString();
                        app.CustomerTel = dr["CustomerTel"].ToString();
                        app.AppId = dr["ApplicationId"].ToString();
                        app.RecordId = dr["RecordId"].ToString();
                        app.Status = dr["Status"].ToString();
                        app.RecordDate = dr["RecordDate"].ToString();
                        applications.Add(app);
                    }
                    applicationSearch.Applications = applications;
                    applicationSearch.IsSuccessfull = true;
                    applicationSearch.Message = "SUCCESS";
                }
                else
                {
                    applicationSearch.IsSuccessfull = false;
                    applicationSearch.Message = "NO APPLICATIONS AVAILABLE";
                }
            }
            catch (Exception ex)
            {
                applicationSearch.IsSuccessfull = false;
                applicationSearch.Message = ex.Message;
            }
            return applicationSearch;
        }

        public GenericResponse UpdateApplicationStatus()
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.UpdateApplicationStatus(app.RecordId, app.Status);
                response.IsSuccessfull = true;
                response.Message = "SUCCESS";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public GenericResponse AssignApplication() 
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.AssignApplication(appAssignment.ApplicationId, appAssignment.FromDepart, appAssignment.ToDepart, appAssignment.Reason, appAssignment.Status,appAssignment.AssignedBy);
                response.IsSuccessfull = true;
                response.Message = "APPLICATION HAS BEEN SUCCEFFULLY ASSIGNED";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public AppAssignmentSearch GetAppAssignments() 
        {
            AppAssignmentSearch appAssignmentSearch = new AppAssignmentSearch();
            try
            {
                DataTable table = dh.GetApplicationsAssigments(appAssignment.ApplicationId, appAssignment.Status);
                if (table.Rows.Count > 0)
                {
                    List<AppAssignment> applications = new List<AppAssignment>();
                    foreach (DataRow dr in table.Rows)
                    {
                        AppAssignment app = new AppAssignment();
                        app.RecordId = dr["RecordId"].ToString();
                        app.ApplicationId = dr["ApplicationId"].ToString();
                        app.AssignedBy = dr["AssignedBy"].ToString();
                        app.FromDepart = dr["FromDepartment"].ToString();
                        app.Reason = dr["ReasonEscalated"].ToString();
                        app.RecordDate = dr["RecordDate"].ToString();
                        app.Status = dr["Status"].ToString();
                        app.ToDepart = dr["ToDepartment"].ToString();
                        applications.Add(app);
                    }
                    appAssignmentSearch.appAssignments = applications;
                    appAssignmentSearch.IsSuccessfull = true;
                    appAssignmentSearch.Message = "SUCCESS";
                }
                else
                {
                    appAssignmentSearch.IsSuccessfull = false;
                    appAssignmentSearch.Message = "NO APPLICATIONS AVAILABLE";
                }
            }
            catch (Exception ex)
            {
                appAssignmentSearch.IsSuccessfull = false;
                appAssignmentSearch.Message = ex.Message;
            }
            return appAssignmentSearch;
        }
    }
}
