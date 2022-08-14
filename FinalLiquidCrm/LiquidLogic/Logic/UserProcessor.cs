using LiquidLogic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Logic
{
    public class UserProcessor
    {
        DatabaseHandler dh = new DatabaseHandler();
        SystemUser user;
        DataTable table;
        EmailProcessor sendEmail = new EmailProcessor();
        public UserProcessor(SystemUser user)
        {
            this.user = user;
        }

        public UserProcessor() 
        { }

        /// <summary>
        /// Resets system user
        /// </summary>
        /// <returns></returns>
        public GenericResponse ResetUser()
        {
            GenericResponse response = new GenericResponse();
            try
            {
                string randompwd = CreatePassword(8);
                user.Active = bool.Parse(GetUserDetailsByEmail(user.UserEmail).Rows[0]["Active"].ToString());
                if (user.Active)
                {
                    string encpwd = MD5Hash(randompwd);
                    user.Username = user.UserEmail;
                    dh.UpdateNewPwd(user.UserEmail, encpwd);
                    dh.LogAuditTrail(user.Username, "Reset User Password for : " + user.UserEmail);
                    string Name = GetUserDetailsByEmail(user.UserEmail).Rows[0]["FullName"].ToString();
                    string Message = "Dear " + Name + ",<br>Please find below are your Customer Relationship Management system new user credentials.<br>";
                    Message += "User name : " + user.Username + "<br>User Password : " + randompwd;
                    response = sendEmail.SendEmail(Name, user.UserEmail, "USER CREDENTIALS", Message);
                    if (response.IsSuccessfull)
                    {
                        response.IsSuccessfull = true;
                        response.Message = "SUCCESSFUL";
                    }
                    else
                    {
                        dh.LogError("SendEmail", "UserProcessor", response.Message, "YassakoPortal");
                    }

                }
                else
                {
                    response.IsSuccessfull = false;
                    response.Message = "UNABLE TO RESET USER PASSWORD";
                }
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
                dh.LogError("ResetUser", "UserProcessor", ex.Message, "YassakoPortal");
            }
            return response;
        }
        /// <summary>
        /// Deactivates Activates user
        /// </summary>
        /// <param name="action"></param>
        /// <returns></returns>
        public GenericResponse DeactivateActivateUser()
        {
            GenericResponse response = new GenericResponse();
            try
            {
                user.Active = bool.Parse(GetUserDetailsByEmail(user.UserEmail).Rows[0]["Active"].ToString());
                if (user.Active)
                {
                    user.Active = false;
                    dh.LogAuditTrail(user.Username, "Deactivated User : " + user.UserEmail);
                }
                else
                {
                    user.Active = true;
                    dh.LogAuditTrail(user.Username, "Activated User : " + user.UserEmail);
                }

                dh.ActivateDeactivateUser(user.UserEmail, user.Active);
                response.IsSuccessfull = true;
                response.Message = "SUCCESSFUL";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
                dh.LogError("DeactivateActivateUser", "UserProcessor", ex.Message, "YassakoPortal");
            }
            return response;
        }
        /// <summary>
        /// Gets all system users in the system
        /// </summary>
        /// <returns></returns>
        public UserSearchResult GetSystemUsersByUsername()
        {
            UserSearchResult userSearchResult = new UserSearchResult();
            try
            {
                dh.LogAuditTrail(user.Username, "Quarried user details");
                DataTable dataTable = dh.GetSystemUsersByUsername(user.Username);
                if (dataTable.Rows.Count > 0)
                {
                    List<SystemUser> users = new List<SystemUser>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        SystemUser systemUser = new SystemUser();
                        systemUser.FullName = dr["FullName"].ToString();
                        systemUser.PhoneNumber = dr["PhoneNumber"].ToString();
                        systemUser.UserCompany = dr["UserDepartment"].ToString();
                        systemUser.UserEmail = dr["UserEmail"].ToString();
                        systemUser.Username = dr["Username"].ToString();
                        systemUser.Userrole = dr["Userrole"].ToString();
                        systemUser.Designation = dr["Designation"].ToString();
                        systemUser.Section = dr["SectionName"].ToString();
                        systemUser.SectionId = dr["SectionId"].ToString();
                        systemUser.Active = bool.Parse(dr["Active"].ToString());
                        users.Add(systemUser);
                    }
                    userSearchResult.IsSuccessfull = true;
                    userSearchResult.Message = "SUCCESS";
                    userSearchResult.results = users;
                    dh.LogAuditTrail(user.UserEmail, "Queried successfully user details");
                }
                else
                {
                    userSearchResult.IsSuccessfull = false;
                    userSearchResult.Message = "NO SYSTEM USERS FOUND";
                }
            }
            catch (Exception ex)
            {
                userSearchResult.IsSuccessfull = false;
                userSearchResult.Message = ex.Message;
                dh.LogError("GetSystemUsers", "UserProcessor", ex.Message, "YassakoPortal");
            }
            return userSearchResult;
        }

        public GenericResponse UpdateUserDetails()
        {
            GenericResponse resp = new GenericResponse();
            try
            {
                if (string.IsNullOrEmpty(user.FullName))
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "USER FULLNAME IS REQUIRED";
                }
                else if (string.IsNullOrEmpty(user.UserEmail))
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "EMAIL REQUIRED";
                }
                else if (string.IsNullOrEmpty(user.UserCompany))
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "USER DEPARTMENT IS REQUIRED";
                }
                else if (!IsValidEmail(user.UserEmail))
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "INVALID EMAIL ADDRESS";
                }
                else if (string.IsNullOrEmpty(user.SectionId))
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "USER SECTION REQUIRED";
                }
                else
                {
                    user.Username = user.UserEmail;
                    dh.UpdateSystemUser(user.FullName, user.Username, user.UserEmail, user.UserCompany, user.Userrole, user.RecodedBy, user.PhoneNumber,user.SectionId,user.Designation);
                    resp.IsSuccessfull = true;
                    resp.Message = "USER DETAILS UPDATED SUCCESSFULLY";
                    dh.LogAuditTrail(user.Username, "Updated User details user  with username : " + user.Username + " and email : " + user.UserEmail);
                }

            }
            catch (Exception ex)
            {
                resp.IsSuccessfull = false;
                resp.Message = ex.Message;
                dh.LogError("RegisterUser", "UserProcessor", ex.Message, "CRM");
            }
            return resp;
        }

        /// <summary>
        /// Gets all system users in the system
        /// </summary>
        /// <returns></returns>
        public UserSearchResult GetSystemUsers()
        {
            UserSearchResult userSearchResult = new UserSearchResult();
            try
            {
                dh.LogAuditTrail(user.Username, "Quarried user details");
                DataTable dataTable = dh.GetSystemUsers();
                if (dataTable.Rows.Count > 0)
                {
                    List<SystemUser> users = new List<SystemUser>();
                    foreach (DataRow dr in dataTable.Rows)
                    {
                        SystemUser systemUser = new SystemUser();
                        systemUser.FullName = dr["FullName"].ToString();
                        systemUser.PhoneNumber = dr["PhoneNumber"].ToString();
                        systemUser.UserCompany = dr["UserDepartment"].ToString();
                        systemUser.UserEmail = dr["UserEmail"].ToString();
                        systemUser.Username = dr["Username"].ToString();
                        systemUser.Userrole = dr["Userrole"].ToString();
                        systemUser.Active = bool.Parse(dr["Active"].ToString());
                        users.Add(systemUser);
                    }
                    userSearchResult.IsSuccessfull = true;
                    userSearchResult.Message = "SUCCESS";
                    userSearchResult.results = users;
                    dh.LogAuditTrail(user.UserEmail, "Queried successfully user details");
                }
                else
                {
                    userSearchResult.IsSuccessfull = false;
                    userSearchResult.Message = "NO SYSTEM USERS FOUND";
                }
            }
            catch (Exception ex)
            {
                userSearchResult.IsSuccessfull = false;
                userSearchResult.Message = ex.Message;
                dh.LogError("GetSystemUsers", "UserProcessor", ex.Message, "YassakoPortal");
            }
            return userSearchResult;
        }
        /// <summary>
        /// Gets the Login Details of the person logging into the system
        /// </summary>
        /// <returns></returns>
        public UserSearchResult LoginDetails()
        {
            UserSearchResult searchResult = new UserSearchResult();
            try
            {
                dh.LogAuditTrail(user.UserEmail, "Attempted to log into the system");
                DataTable dataTable = dh.GetLoginDetails(this.user.Username);
                if (dataTable.Rows.Count > 0)
                {
                    string userpassword = dataTable.Rows[0]["UserPassword"].ToString();
                    string encryptedpwd = MD5Hash(user.UserPassword);
                    if (userpassword.Equals(encryptedpwd))
                    {
                        bool IsActive = bool.Parse(dataTable.Rows[0]["Active"].ToString());
                        if (IsActive)
                        {
                            List<SystemUser> users = new List<SystemUser>();
                            foreach (DataRow dr in dataTable.Rows)
                            {
                                SystemUser systemUser = new SystemUser();
                                systemUser.FullName = dr["FullName"].ToString();
                                systemUser.PhoneNumber = dr["PhoneNumber"].ToString();
                                systemUser.UserCompany = dr["UserDepartment"].ToString();
                                systemUser.UserEmail = dr["UserEmail"].ToString();
                                systemUser.Username = dr["Username"].ToString();
                                systemUser.Userrole = dr["Userrole"].ToString();
                                users.Add(systemUser);
                            }
                            searchResult.IsSuccessfull = true;
                            searchResult.Message = "SUCCESS";
                            searchResult.results = users;
                            dh.LogAuditTrail(user.UserEmail, "Logged into the system successfully");
                        }
                        else
                        {
                            searchResult.IsSuccessfull = false;
                            searchResult.Message = "USER WAS DISABLED PLEASE CONTACT SYSTEM ADMINISTRATOR";
                        }

                    }
                    else
                    {
                        searchResult.IsSuccessfull = false;
                        searchResult.Message = "INVALID LOGIN CREDENTIALS";
                    }

                }
                else
                {
                    searchResult.IsSuccessfull = false;
                    searchResult.Message = "NO USERS FOUND";
                }
            }
            catch (Exception ex)
            {
                searchResult.IsSuccessfull = false;
                searchResult.Message = "EXCEPTION OCCURED";
                dh.LogError("GetUsers", "UserProcessor", ex.Message, "YassakoPortal");
            }
            return searchResult;
        }
        /// <summary>
        /// Deactivating user departments
        /// </summary>
        /// <param name="departmentid"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public GenericResponse DeactivateActivateDepartment(string departmentid, bool status)
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.ActivateDeactivateDepartment(departmentid, status);
                response.Message = "SUCCESS";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public UserDepartments GetUserDepartmentsById(string departmentid)
        {
            UserDepartments departments = new UserDepartments();
            try
            {
                table = dh.GetUserDepartmentsById(departmentid);
                if (table.Rows.Count > 0)
                {
                    List<Department> departments1 = new List<Department>();
                    foreach (DataRow dr in table.Rows)
                    {
                        Department department = new Department();
                        department.RecordId = dr["RecordId"].ToString();
                        department.DepartmentName = dr["DepartmentName"].ToString();
                        department.Departmentemail = dr["DepartmentEmail"].ToString();
                        department.Status = dr["Status"].ToString();
                        department.RecordDate = dr["RecordDate"].ToString();
                        department.RecordedBy = dr["RecordedBy"].ToString();
                        departments1.Add(department);
                    }
                    departments.IsSuccessfull = true;
                    departments.Message = "SUCCESS";
                    departments.departments = departments1;
                }
                else
                {
                    departments.IsSuccessfull = false;
                    departments.Message = "NO USER DEPARTMENTS FOUND";
                }
            }
            catch (Exception ex)
            {
                departments.IsSuccessfull = false;
                departments.Message = ex.Message;
            }
            return departments;
        }

        public GenericResponse UpdateUserDepartment(string recordId, string departmentName,string departemail)
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.UpdateUserDepartment(recordId, departmentName, departemail);
                response.IsSuccessfull = true;
                response.Message = "Department Details Created Successfully";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        /// <summary>
        /// Creates users in the system
        /// </summary>
        /// <returns></returns>
        public GenericResponse RegisterUser()
        {
            GenericResponse resp = new GenericResponse();
            try
            {
                if (IsUserEmailRegistered(user.UserEmail))
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "EMAIL ALREADY REGISTERED WITH ANOTHER USER";
                }
                else if (string.IsNullOrEmpty(user.FullName))
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "USER NAME REQUIRED";
                }
                else if (string.IsNullOrEmpty(user.UserEmail))
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "EMAIL REQUIRED";
                }
                else if (string.IsNullOrEmpty(user.Userrole))
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "USER ROLE REQUIRED";
                }
                else if (!IsValidEmail(user.UserEmail))
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "INVALID EMAIL ADDRESS";
                }
                else if (string.IsNullOrEmpty(user.Section))
                {
                    resp.IsSuccessfull = false;
                    resp.Message = "PLEASE ENTER USER SECTION";
                }
                else
                {
                    user.Username = user.UserEmail;
                    string randomPassword = CreatePassword(8);
                    user.UserPassword = MD5Hash(randomPassword);
                    dh.RegisterUser(user.FullName, user.Username, user.UserEmail, user.UserCompany, user.Userrole, user.RecodedBy, user.UserPassword, user.PhoneNumber,user.Section);
                    resp.IsSuccessfull = true;
                    resp.Message = "SUCCESS";
                    dh.LogAuditTrail(user.Username, "registered user  with username : " + user.Username + " and email : " + user.UserEmail);
                    string Message = "Dear " + user.FullName + ",<br>Please find below are your yassako user credentials. Please remember to change them on your initial login<br>";
                    Message += "User name : " + user.Username + "<br>User Password : " + randomPassword;
                    resp = sendEmail.SendEmail(user.FullName, user.Username, "USER CREDENTIALS", Message);
                    if (resp.IsSuccessfull)
                    {
                        resp.Message = "User details have been captured successfully and email sent to user with details";
                    }
                    else
                    {
                        resp.Message = "User details sent successfully but email has not been sent. Error : " + resp.Message;
                    }

                }

            }
            catch (Exception ex)
            {
                resp.IsSuccessfull = false;
                resp.Message = ex.Message;
                dh.LogError("RegisterUser", "UserProcessor", ex.Message, "YassakoPortal");
            }
            return resp;
        }
        /// <summary>
        /// Generates a random password for the new user and the user who's password has been reset
        /// </summary>
        /// <param name="length"></param>
        /// <returns></returns>
        private string CreatePassword(int length)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }
        /// <summary>
        /// Checks whether this is a valid email address
        /// </summary>
        /// <param name="emailaddress"></param>
        /// <returns></returns>
        internal bool IsValidEmail(string emailaddress)
        {
            try
            {
                MailAddress m = new MailAddress(emailaddress);
                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }
        /// <summary>
        /// Checks whether User email is registered
        /// </summary>
        /// <param name="userEmail"></param>
        /// <returns></returns>
        private bool IsUserEmailRegistered(string userEmail)
        {
            bool IsTrue = false;
            try
            {
                DataTable userdetails = GetUserDetailsByEmail(userEmail);
                if (userdetails.Rows.Count > 0)
                {
                    IsTrue = true;
                }
            }
            catch (Exception ex)
            {
                dh.LogError("IsUserEmailRegistered", "UserProcessor", ex.Message, "YassakoPortal");
            }
            return IsTrue;
        }
        /// <summary>
        /// Returns user details basing on the email supplied
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public DataTable GetUserDetailsByEmail(string email)
        {
            try
            {
                table = dh.GetLoginDetails(email);
            }
            catch (Exception ex)
            {
                dh.LogError("GetUserDetailsByEmail", "UserProcessor", ex.Message, "YassakoPortal");
            }
            return table;
        }
        /// <summary>
        /// Encrypts the generated password
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        private string MD5Hash(string text)
        {
            MD5 md5 = new MD5CryptoServiceProvider();

            //compute hash from the bytes of text  
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

            //get hash result after compute it  
            byte[] result = md5.Hash;

            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                //change it into 2 hexadecimal digits  
                //for each byte  
                strBuilder.Append(result[i].ToString("x2"));
            }

            return strBuilder.ToString();
        }
        
        public GenericResponse CreateUserDepartment(Department department) 
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.CreateUserDepartment(department.DepartmentName, department.RecordedBy, department.Departmentemail);
                response.IsSuccessfull = true;
                response.Message = "USER DEPARTMENT CREATED SUCCESSFULLY";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public SectionResponse GetUserSectionById(string sectionid)
        {
            SectionResponse response = new SectionResponse();
            try
            {
                table = dh.GetUserSectionsByid(sectionid);
                if (table.Rows.Count>0)
                {
                    List<DepartmentSection> departments = new List<DepartmentSection>();
                    foreach (DataRow dr in table.Rows)
                    {
                        DepartmentSection section = new DepartmentSection();
                        section.SectionId = dr["RecordId"].ToString();
                        section.SectionName = dr["SectionName"].ToString();
                        departments.Add(section);
                    }
                    response.IsSuccessfull = true;
                    response.departmentSections = departments;
                    response.Message = "SUCCESSFUL";
                }
                else
                {
                    response.IsSuccessfull = false;
                    response.Message = "NO SECTION FOUND FOR THIS USER";
                }
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public SectionResponse GetUserSectionByDepartId(string departid)
        {
            SectionResponse response = new SectionResponse();
            try
            {
                table = dh.GetUserSectionsByDepartid(departid);
                if (table.Rows.Count > 0)
                {
                    List<DepartmentSection> departments = new List<DepartmentSection>();
                    foreach (DataRow dr in table.Rows)
                    {
                        DepartmentSection section = new DepartmentSection();
                        section.SectionId = dr["RecordId"].ToString();
                        section.SectionName = dr["SectionName"].ToString();
                        departments.Add(section);
                    }
                    response.IsSuccessfull = true;
                    response.departmentSections = departments;
                    response.Message = "SUCCESSFUL";
                }
                else
                {
                    response.IsSuccessfull = false;
                    response.Message = "NO SECTION FOUND FOR THIS USER";
                }
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public GenericResponse UpdateUserSection(DepartmentSection section)
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.UpdateUserSection(section.SectionId, section.SectionName);
                response.IsSuccessfull = true;
                response.Message = "SECTION UPDATED SUCCESSFULLY";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public UserDepartments GetUserDepartments(string status) 
        {
            UserDepartments departments = new UserDepartments();
            try
            {
                table = dh.GetUserDepartments(status);
                if (table.Rows.Count>0)
                {
                    List<Department> departments1 = new List<Department>();
                    foreach (DataRow dr in table.Rows)
                    {
                        Department department = new Department();
                        department.RecordId = dr["RecordId"].ToString();
                        department.DepartmentName = dr["DepartmentName"].ToString();
                        department.Departmentemail = dr["DepartmentEmail"].ToString();
                        department.Status = dr["Status"].ToString();
                        department.RecordDate = dr["RecordDate"].ToString();
                        department.RecordedBy = dr["RecordedBy"].ToString();
                        departments1.Add(department);
                    }
                    departments.IsSuccessfull = true;
                    departments.Message = "SUCCESS";
                    departments.departments = departments1;
                }
                else
                {
                    departments.IsSuccessfull = false;
                    departments.Message = "NO USER DEPARTMENTS FOUND";
                }
            }
            catch (Exception ex)
            {
                departments.IsSuccessfull = false;
                departments.Message = ex.Message;
            }
            return departments;
        }

        public GenericResponse CreateUserSection(DepartmentSection section) 
        {
            GenericResponse response = new GenericResponse();
            try
            {
                dh.CreateUserSection(section.DepartmentId, section.SectionName);
                response.IsSuccessfull = true;
                response.Message = "SECTION CREATED SUCCESSFULLY";
            }
            catch (Exception ex)
            {
                response.IsSuccessfull = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public AuditReports GetAuditReport() 
        {
            AuditReports auditReports = new AuditReports();
            try
            {
                table = dh.GetAuditReport();
                if (table.Rows.Count>0)
                {
                    List<AuditReport> reports = new List<AuditReport>();
                    foreach (DataRow dr in table.Rows)
                    {
                        AuditReport report = new AuditReport();
                        report.RecordId = dr["RecordId"].ToString();
                        report.Username = dr["Username"].ToString();
                        report.Action = dr["Action"].ToString();
                        report.RecordDate = dr["RecordDate"].ToString();
                        reports.Add(report);
                    }
                    auditReports.IsSuccessfull = true;
                    auditReports.Message = "SUCCESS";
                    auditReports.auditReports = reports;

                }
                else
                {
                    auditReports.IsSuccessfull = false;
                    auditReports.Message = "NO AUDIT TRAIL FOUND";
                }
            }
            catch (Exception ex)
            {
                auditReports.IsSuccessfull = false;
                auditReports.Message = ex.Message;
            }
            return auditReports;
        }

        public SectionResponse GetUserSections() 
        {
            SectionResponse response = new SectionResponse();
            try
            {
                table = dh.GetUserSections();
                if (table.Rows.Count>0)
                {
                    List<DepartmentSection> departmentSections = new List<DepartmentSection>();
                    foreach (DataRow dr in table.Rows)
                    {
                        DepartmentSection section = new DepartmentSection();
                        section.SectionId = dr["RecordId"].ToString();
                        section.SectionName = dr["SectionName"].ToString();
                        section.DepartmentId = dr["DepartmentName"].ToString();
                        section.RecordDate = dr["RecordDate"].ToString();
                        departmentSections.Add(section);
                    }
                    response.IsSuccessfull = true;
                    response.departmentSections = departmentSections;
                    response.Message = "SUCCESS";
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
