using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace YassakoPortalLogic.Logic
{
    class DatabaseHandler
    {
        DbCommand command;
        Database DbConnection;
        DataTable returntable;
        internal DatabaseHandler()
        {
            try
            {
                DbConnection = DatabaseFactory.CreateDatabase("liveyassakodbconnectionstring");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal DataTable GetLoanRepayments()
        {
            command = DbConnection.GetStoredProcCommand("GetRepaymentHist");
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetLoans(bool repaid, bool penaltyApplied)
        {
            command = DbConnection.GetStoredProcCommand("GetLoans", repaid, penaltyApplied);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal DataTable GetLoginDetails(string username)
        {
            command = DbConnection.GetStoredProcCommand("GetUserDetailsByEmail", username);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void ActivateDeactivateUser(string userEmail, bool active)
        {
            command = DbConnection.GetStoredProcCommand("DeactivateActivateUser", userEmail, active);
            DbConnection.ExecuteNonQuery(command);
        }

        internal void UpdateNewPwd(string useremail, string encryptedpwd)
        {
            command = DbConnection.GetStoredProcCommand("UpdateNewPwd", useremail, encryptedpwd);
            DbConnection.ExecuteNonQuery(command);
        }

        internal DataTable GetSystemUsers()
        {
            command = DbConnection.GetStoredProcCommand("GetUSers");
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
        }

        internal void RegisterUser(string Fullname, string Username, string UserEmail, string UserCompany, string UserRole, string RecordedBy, string UserPassword, string UserPhone)
        {
            try
            {
                command = DbConnection.GetStoredProcCommand("CreateSystemUser", Fullname, Username, UserEmail, UserCompany, UserRole, RecordedBy, UserPassword, UserPhone);
                DbConnection.ExecuteNonQuery(command);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal DataTable SearchLoansByRepaidOrOverdue(bool repaid, bool penaltyApplied)
        {
            command = DbConnection.GetStoredProcCommand("SearchLoansByRepaidOrOverdue", repaid, penaltyApplied);
            returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            return returntable;
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

        internal DataTable GetRequestedTransactions(string custPhone, string fromDate, string meterNumber, string toDate, string tranStatus, string vendor, string vendorId, string yassakoid)
        {
            try
            {
                command = DbConnection.GetStoredProcCommand("TranHist", custPhone, fromDate, meterNumber, toDate, tranStatus
                    , vendor, vendorId, yassakoid);
                returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return returntable;
        }

        internal DataTable GetUtilityTransacltions(string custPhone, string fromDate, string meterNumber, string toDate, string tranStatus, string vendor, string vendorId, string yassakoid)
        {
            try
            {
                command = DbConnection.GetStoredProcCommand("GetUtilityTransacltions", custPhone, fromDate, meterNumber, toDate, tranStatus
                    , vendor, vendorId, yassakoid);
                returntable = DbConnection.ExecuteDataSet(command).Tables[0];
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return returntable;
        }
    }
}
