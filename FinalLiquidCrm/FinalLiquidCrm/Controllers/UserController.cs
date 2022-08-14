using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalLiquidCrm.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult CreateUser()
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.UserDepartments userDepartments = new LiquidLogic.Models.UserDepartments();
                    LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor();
                    userDepartments = userProcessor.GetUserDepartments("1");
                    if (userDepartments.IsSuccessfull)
                    {
                        ViewBag.UserDepartments = userDepartments.departments;
                    }
                    else
                    {
                        ViewBag.Error = userDepartments.Message;
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
        public ActionResult CreateUser(FormCollection form) 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.SystemUser systemUser = new LiquidLogic.Models.SystemUser();
                    systemUser.FullName = Request["name"];
                    systemUser.Designation = Request["designation"];
                    systemUser.Userrole = Request["depart"];
                    systemUser.UserEmail = Request["email"];
                    systemUser.Section = Request["usersect"];
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor(systemUser);
                    response = userProcessor.RegisterUser();
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

        public ActionResult ViewUsers()
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.SystemUser systemUser = new LiquidLogic.Models.SystemUser();
                    LiquidLogic.Models.UserSearchResult response = new LiquidLogic.Models.UserSearchResult();
                    LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor(systemUser);
                    response = userProcessor.GetSystemUsers();
                    if (response.IsSuccessfull)
                    {
                        ViewBag.SystemUsers = response.results;
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
        public ActionResult DeactivateActivateResetUser(string username,string activity)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {

                    LiquidLogic.Models.SystemUser systemUser = new LiquidLogic.Models.SystemUser();
                    systemUser.UserEmail = username;
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor(systemUser);
                    if (activity.Equals("reset"))
                    {
                        response = userProcessor.ResetUser();
                    }
                    else
                    {
                        response = userProcessor.DeactivateActivateUser();
                    }

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
                return RedirectToAction("ViewUsers", "User");
            }
            
        }
        public ActionResult EditUser(string username) 
        {
            try
            {
                LiquidLogic.Models.SystemUser systemUser = new LiquidLogic.Models.SystemUser();
                systemUser.Username = username;
                LiquidLogic.Models.UserSearchResult response = new LiquidLogic.Models.UserSearchResult();
                LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor(systemUser);
                response = userProcessor.GetSystemUsersByUsername();
                if (response.IsSuccessfull)
                {
                    LiquidLogic.Models.UserDepartments userDepartments = new LiquidLogic.Models.UserDepartments();
                    userDepartments = userProcessor.GetUserDepartments("1");
                    if (userDepartments.IsSuccessfull)
                    {
                        ViewBag.UserDepartments = userDepartments.departments;
                        LiquidLogic.Models.SectionResponse sectionResponse = new LiquidLogic.Models.SectionResponse();
                        sectionResponse = userProcessor.GetUserSectionById(response.results[0].Userrole);
                        if (sectionResponse.IsSuccessfull)
                        {
                            ViewBag.UserSections = sectionResponse.departmentSections;
                        }
                        else
                        {
                            ViewBag.Error = sectionResponse.Message;
                        }
                        
                    }
                    else
                    {
                        ViewBag.Error = userDepartments.Message;
                    }
                    ViewBag.UserToEdit = response.results;
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

        [HttpPost]
        public ActionResult EditUser(FormCollection collection)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.SystemUser systemUser = new LiquidLogic.Models.SystemUser();
                    systemUser.Username = Request["username"];
                    systemUser.FullName = Request["name"];
                    systemUser.UserEmail = Request["email"];
                    systemUser.UserCompany = Request["depart"];
                    systemUser.SectionId = Request["usersect"];
                    systemUser.Designation = Request["designation"];
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor(systemUser);
                    response = userProcessor.UpdateUserDetails();
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

        public string GetDepartmentSection(string sectionid)
        {
            LiquidLogic.Models.SectionResponse response = new LiquidLogic.Models.SectionResponse();
            try
            {
                LiquidLogic.Logic.UserProcessor processor = new LiquidLogic.Logic.UserProcessor();

                response = processor.GetUserSectionById(sectionid);
                if (response.IsSuccessfull)
                {
                    string serialize = JsonConvert.SerializeObject(response.departmentSections);

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
            return JsonConvert.SerializeObject(response.departmentSections);
        }
    }
}