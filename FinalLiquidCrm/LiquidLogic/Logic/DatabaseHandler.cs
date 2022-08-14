using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Logic
{
    class DatabaseHandler
    {
        DbCommand command;
        Database DbConnection,billingdb;
        
        DataTable returntable;
        internal DatabaseHandler()
        {
            try
            {
                DbConnection = DatabaseFactory.CreateDatabase("testcrmconstring");
                //billingdb = DatabaseFactory.CreateDatabase("billingdb");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal DataTable GetLandLords()
        {
            command = DbConnection.GetStoredProcCommand("GetLandlords");
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable AddRequiredMaterials(string materialType, string size, string qty,string ticketid)
        {
            command = DbConnection.GetStoredProcCommand("AddRequiredMaterials", materialType, size, qty, ticketid);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable AddMaterialsPurchased(string materialType, string size, string qty, string ticketid,string cost)
        {
            command = DbConnection.GetStoredProcCommand("AddMaterialsPurchased", materialType, size, qty, ticketid, cost);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void InsertCustomerTrans(string tranRef, string amount, string narration, string customerEmail, string status)
        {
            command = DbConnection.GetStoredProcCommand("InsertCustomerTrans", tranRef, amount, narration, customerEmail, status);
            DbConnection.ExecuteNonQuery(command);
        }

        internal void RecordApplication(string firstName, string lastName, string gender, string dOB, string district, string subcountyDivision, string lC1, string village, string city, string nationality, string parish, string apartmentNumber, string customerTel, string customerEmail, string idNumber)
        {
            command = DbConnection.GetStoredProcCommand("RecordApplication", firstName, lastName, gender, dOB, district, subcountyDivision, lC1, village, city, nationality, parish, apartmentNumber, customerTel, customerEmail, idNumber);
            DbConnection.ExecuteNonQuery(command);
        }

        internal void AddLandlord(string name, string email, string tel)
        {
            command = DbConnection.GetStoredProcCommand("AddLandlord", name, email, tel);
            DbConnection.ExecuteNonQuery(command);
        }

        internal void CreateJobCard(string ticketId, string jobType, string oppArea, string branch, string territory, string subTerritory, string assetCategory, string assetDescription, string assetLocation, string assetReference, string jobCategory, string address, string assetType, string ycordinates, string xcordinates, string blockMapRef)
        {
            command = DbConnection.GetStoredProcCommand("CreateJobCard", ticketId, jobType, oppArea, branch, territory, subTerritory, assetCategory, assetDescription, assetLocation, assetReference, jobCategory, address, assetType, ycordinates, xcordinates, blockMapRef);
            DbConnection.ExecuteNonQuery(command);
        }

        internal DataTable GetJobCards()
        {
            command = DbConnection.GetStoredProcCommand("GetJobCards");
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetCustomerTransactionsByEmail(string customerEmail)
        {
            command = DbConnection.GetStoredProcCommand("GetCustomerTransactionsByEmail", customerEmail);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetTicketes()
        {
            command = DbConnection.GetStoredProcCommand("GetTickets");
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void RegisterUser(string Fullname, string Username, string UserEmail, string UserCompany, string UserRole, string RecordedBy, string UserPassword, string UserPhone,string section)
        {
            try
            {
                command = DbConnection.GetStoredProcCommand("CreateSystemUser", Fullname, Username, UserEmail, UserCompany, UserRole, RecordedBy, UserPassword, UserPhone, section);
                DbConnection.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal DataTable GetCustomerApplByEmail(string email) 
        {
            try
            {
                command = DbConnection.GetStoredProcCommand("GetCustomerByEmail", email);
                returntable = DbConnection.ExecuteDataSet(command).Tables[0];
                return returntable;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal DataTable GetApplications()
        {
            command = DbConnection.GetStoredProcCommand("GetApplications");
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void UpdateNewPwd(string useremail, string encryptedpwd)
        {
            command = DbConnection.GetStoredProcCommand("UpdateNewPwd", useremail, encryptedpwd);
            DbConnection.ExecuteNonQuery(command);
        }

        internal void LogAuditTrail(string userid, string action)
        {
            try
            {
                command = DbConnection.GetStoredProcCommand("InsertAudittrail", userid, action);
                DbConnection.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal DataTable InsertTicket1(string description, string prioprity, string subject, string task_type, string email_id, string attachment,string areacode,string branchcode, string datestring)
        {
            command = DbConnection.GetStoredProcCommand("InsertTicket", description, prioprity, subject, task_type, email_id, attachment, areacode, branchcode, datestring);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetTicketById(string ticket_id)
        {
            command = DbConnection.GetStoredProcCommand("GetTicketById", ticket_id);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetTicketResolutionDetails(string ticket_id)
        {
            command = DbConnection.GetStoredProcCommand("GetTicketResolutionDetails", ticket_id);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetApplicationsById(string recordId)
        {
            command = DbConnection.GetStoredProcCommand("GetApplicationsById", recordId);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetSystemUsersByUsername(string username)
        {
            command = DbConnection.GetStoredProcCommand("GetSystemUsersByUsername", username);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void UpdateApplicationStatus(string recordId, string status)
        {
            command = DbConnection.GetStoredProcCommand("UpdateApplicationStatus", recordId, status);
            DbConnection.ExecuteNonQuery(command);
        }

        /// <summary>
        /// Logs system errors in the database
        /// </summary>
        /// <param name="method"></param>
        /// <param name="Level"></param>
        /// <param name="error"></param>
        /// <param name="loggedby"></param>
        internal void LogError(string method, string Level, string error, string loggedby)
        {
            try
            {
                command = DbConnection.GetStoredProcCommand("LogSystemError", method, Level, error, loggedby);
                DbConnection.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        internal void EscalateTicket(string ticket_id, string admin_remark, string assignedTo,string assignedby)
        {
            command = DbConnection.GetStoredProcCommand("EscalateTicket", ticket_id, admin_remark, assignedTo, assignedby);
            DbConnection.ExecuteNonQuery(command);
        }

        internal void ActivateDeactivateUser(string userEmail, bool active)
        {
            command = DbConnection.GetStoredProcCommand("DeactivateActivateUser", userEmail, active);
            DbConnection.ExecuteNonQuery(command);
        }

        internal DataTable GetLoginDetails(string username)
        {
            command = DbConnection.GetStoredProcCommand("GetUserDetailsByEmail", username);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void UpdateSystemUser(string fullName, string username, string userEmail, string userCompany, string userrole, string recodedBy, string phoneNumber,string sectionid,string designtation)
        {
            command = DbConnection.GetStoredProcCommand("UpdateSystemUser", fullName, username, userEmail, userCompany, userrole, recodedBy, phoneNumber, sectionid, designtation);
            DbConnection.ExecuteNonQuery(command);
        }

        internal DataTable GetSystemUsers()
        {
            command = DbConnection.GetStoredProcCommand("GetUSers");
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable InsertTicket(string complainantType, string custRef, string custName, string complaintSource, string complaintCategory, string complaintSubCategory, string custContact, string email_id, string prioprity, string ticketDetails,string areacode,string branchcode,string datestring,string areaname, string branchname)
        {
            command = DbConnection.GetStoredProcCommand("InsertTicket", complainantType, custRef, custName, complaintSource, complaintCategory, complaintSubCategory, custContact, email_id, prioprity, ticketDetails, areacode, branchcode, datestring, areaname, branchname);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void UpdateTicketStatus(string ticket_id, string status)
        {
            command = DbConnection.GetStoredProcCommand("UpdateTicketStatus", ticket_id, status);
            DbConnection.ExecuteNonQuery(command);
        }

        internal void AssignTicket(string ticket_id, string assignedTo, string narration)
        {
            command = DbConnection.GetStoredProcCommand("AssignTicket", ticket_id, assignedTo, narration);
            DbConnection.ExecuteNonQuery(command);
        }

        internal void Resolveticket(string ticket_id, string admin_remark,string resolvedby)
        {
            command = DbConnection.GetStoredProcCommand("Resolveticket", ticket_id, admin_remark, resolvedby);
            DbConnection.ExecuteNonQuery(command);
        }

        internal void AssignApplication(string applicationId, string fromDepart, string toDepart, string reason, string status,string assignedby)
        {
            command = DbConnection.GetStoredProcCommand("AssignApplication", applicationId, fromDepart, toDepart, reason, status, assignedby);
            DbConnection.ExecuteNonQuery(command);
        }

        internal DataTable GetApplicationsAssigments(string applicationId, string status)
        {
            command = DbConnection.GetStoredProcCommand("GetApplicationsAssigments", applicationId, status);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void RegisterComplaintCategory(string category)
        {
            command = DbConnection.GetStoredProcCommand("RegisterComplaintCategory", category);
            DbConnection.ExecuteNonQuery(command);
        }

        internal DataTable GetComplaintCategories()
        {
            command = DbConnection.GetStoredProcCommand("GetComplaintCategories");
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetComplaintCategoriesById(string categoryid)
        {
            command = DbConnection.GetStoredProcCommand("GetComplaintCategoriesById", categoryid);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void RegisterComplaintSubCategory(string categoryId, string subCategoryName)
        {
            command = DbConnection.GetStoredProcCommand("RegisterComplaintSubCategory", categoryId, subCategoryName);
            DbConnection.ExecuteNonQuery(command);
        }

        internal DataTable GetComplaintSubCategories()
        {
            command = DbConnection.GetStoredProcCommand("GetComplaintSubCategories");
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetComplaintSubCategoriesByCategoryId(string categoryid)
        {
            command = DbConnection.GetStoredProcCommand("GetComplaintSubCategoriesByCategoryId", categoryid);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetBillingCustomerDetails(string custref) 
        {
            command = billingdb.GetStoredProcCommand("GetCrmCustomerDetails", custref);
            returntable = billingdb.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetBillingOperationAreas(string areaid)
        {
            command = billingdb.GetStoredProcCommand("Sp_GetOperationAreaList", areaid);
            returntable = billingdb.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetComplaintSubCategoriesById(string subcategoryid)
        {
            command = DbConnection.GetStoredProcCommand("GetComplaintSubCategoriesById", subcategoryid);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void UpdateComplaintCategory(string category, string categoryId)
        {
            command = DbConnection.GetStoredProcCommand("UpdateComplaintCategory", category, categoryId);
            DbConnection.ExecuteNonQuery(command);
        }

        internal void CreateUserDepartment(string departmentName,string recordedby,string departmentemail)
        {
            command = DbConnection.GetStoredProcCommand("CreateUserDepartment", departmentName, recordedby, departmentemail);
            DbConnection.ExecuteNonQuery(command);
        }

        internal void ActivateDeactivateDepartment(string departmentid, bool status)
        {
            command = DbConnection.GetStoredProcCommand("ActivateDeactivateDepartment", departmentid, status);
            DbConnection.ExecuteNonQuery(command);
        }

        internal DataTable GetUserDepartments(string status)
        {
            command = DbConnection.GetStoredProcCommand("GetUserDepartments", status);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void UpdateComplaintSubCategory(string subCategoryId, string subCategoryName)
        {
            command = DbConnection.GetStoredProcCommand("UpdateComplaintSubCategory", subCategoryId, subCategoryName);
            DbConnection.ExecuteNonQuery(command);
        }

        internal DataTable GetUserDepartmentsById(string departmentid)
        {
            command = DbConnection.GetStoredProcCommand("GetUserDepartmentsById", departmentid);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void UpdateUserDepartment(string recordId, string departmentName,string departemail)
        {
            command = DbConnection.GetStoredProcCommand("UpdateUserDepartment", recordId, departmentName, departemail);
            DbConnection.ExecuteNonQuery(command);
        }

        internal DataTable GetAuditReport()
        {
            command = DbConnection.GetStoredProcCommand("GetAuditReport");
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetBillingBranchesByOpsId(string opsid)
        {
            command = billingdb.GetStoredProcCommand("Sp_GetBranhListByOperationalId",opsid);
            returntable = billingdb.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetBranchCodeById(string id)
        {
            command = billingdb.GetStoredProcCommand("GetBranchCodeById", id);
            returntable = billingdb.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetAreaCodeById(string id)
        {
            command = billingdb.GetStoredProcCommand("Sp_GetOperationAreaById", id);
            returntable = billingdb.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void CreateUserSection(string departmentId, string sectionName)
        {
            command = DbConnection.GetStoredProcCommand("CreateUserSection", departmentId, sectionName);
            DbConnection.ExecuteNonQuery(command);
        }

        internal DataTable GetUserSections() 
        {
            command = DbConnection.GetStoredProcCommand("GetUserSection");
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetUserSectionsByid(string sectionid)
        {
            command = DbConnection.GetStoredProcCommand("GetUserSectionsByid", sectionid);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetUserSectionsByDepartid(string departid)
        {
            command = DbConnection.GetStoredProcCommand("GetUserSectionsByDepartid", departid);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void UpdateUserSection(string sectionId, string sectionName)
        {
            command = DbConnection.GetStoredProcCommand("UpdateUserSection", sectionId, sectionName);
            DbConnection.ExecuteNonQuery(command);
        }
    }
}
