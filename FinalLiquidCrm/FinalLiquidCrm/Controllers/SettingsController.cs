using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace FinalLiquidCrm.Controllers
{
    public class SettingsController : Controller
    {
        // GET: Settings
        public ActionResult RegisterComplaintCategory()
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View();
            }
            
        }

        [HttpPost]
        public ActionResult RegisterComplaintCategory(FormCollection form) 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.ComplaintCategory category = new LiquidLogic.Models.ComplaintCategory();
                    LiquidLogic.Logic.TicketProcessor processor = new LiquidLogic.Logic.TicketProcessor();
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    category.Category = Request["ComplaintCategory"];
                    response = processor.RegisterComplaintCategory(category);
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

        public ActionResult AddComplaintSubCategories() 
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

        [HttpPost]
        public ActionResult AddComplaintSubCategories(FormCollection collection)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.ComplaintSubCategory complaintSubCategory = new LiquidLogic.Models.ComplaintSubCategory();
                    complaintSubCategory.CategoryId = Request["category"];
                    complaintSubCategory.SubCategoryName = Request["subcategory"];
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor();
                    response = ticketProcessor.RegisterComplaintSubCategory(complaintSubCategory);
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

        public ActionResult ViewComplaintCategories() 
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

        public ActionResult ViewComplaintSubCategory()
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.ComplaintSubCategories complaintSubCategories = new LiquidLogic.Models.ComplaintSubCategories();
                    LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor();
                    complaintSubCategories = ticketProcessor.GetComplaintSubCategories();
                    if (complaintSubCategories.IsSuccessfull)
                    {
                        ViewBag.SubCategories = complaintSubCategories.complaintSubCategories;
                    }
                    else
                    {
                        ViewBag.Error = complaintSubCategories.Message;
                    }
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex.Message;
                }
                return View();
            }
            
        }

        public string GetComplaintSubCategoriesByid(string subcategoryid) 
        {
            LiquidLogic.Models.ComplaintSubCategories complaintSubCategories = new LiquidLogic.Models.ComplaintSubCategories();
            try
            {
                
                LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor();
                
                complaintSubCategories = ticketProcessor.GetComplaintSubCategoriesByCategoryId(subcategoryid);
                if (complaintSubCategories.IsSuccessfull)
                {
                    string serialize = JsonConvert.SerializeObject(complaintSubCategories.complaintSubCategories);
  
                }
                else
                {
                    ViewBag.Error = complaintSubCategories.Message;
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
            }
            return JsonConvert.SerializeObject(complaintSubCategories.complaintSubCategories);
        }

        public ActionResult CreateDepartment() 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View();
            }
            
        }
        [HttpPost]
        public ActionResult CreateDepartment(FormCollection collection) 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    LiquidLogic.Models.Department department = new LiquidLogic.Models.Department();
                    department.DepartmentName = Request["departmentname"];
                    department.Departmentemail = Request["departmentemail"];
                    department.RecordedBy = Session["Uname"].ToString();
                    LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor();
                    response = userProcessor.CreateUserDepartment(department);
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

        [HttpGet]
        public ActionResult ViewUserDepartments() 
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
                    userDepartments = userProcessor.GetUserDepartments("");
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

        
        public ActionResult DeactivateReactivateDepartment(string departmentid , Boolean status)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Logic.UserProcessor processor = new LiquidLogic.Logic.UserProcessor();
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    response = processor.DeactivateActivateDepartment(departmentid, status);
                    if (response.IsSuccessfull)
                    {
                        if (status)
                        {
                            ViewBag.Message = "Department Activated Successfully";
                        }
                        else
                        {
                            ViewBag.Message = "Department Deactivated Successfully";
                        }
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
                return RedirectToAction("ViewUserDepartments", "Settings");
            }
            
        }

        public ActionResult EditCategory(string categoryid) 
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
                    complaintCategories = ticketProcessor.GetComplaintCategoriesById(categoryid);
                    if (complaintCategories.IsSuccessfull)
                    {
                        ViewBag.Categories = complaintCategories.complaintCategories;
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

        [HttpPost]
        public ActionResult EditCategory(FormCollection collection)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.ComplaintCategory category = new LiquidLogic.Models.ComplaintCategory();
                    LiquidLogic.Logic.TicketProcessor processor = new LiquidLogic.Logic.TicketProcessor();
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    category.Category = Request["ComplaintCategory"];
                    category.CategoryId = Request["categoryid"];
                    response = processor.UpdateComplaintCategory(category.Category, category.CategoryId);
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

        public ActionResult EditComplaintSubCategories(string subcategoryid)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.ComplaintSubCategories complaintSubCategories = new LiquidLogic.Models.ComplaintSubCategories();
                    LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor();
                    complaintSubCategories = ticketProcessor.GetComplaintSubCategoriesById(subcategoryid);
                    if (complaintSubCategories.IsSuccessfull)
                    {
                        ViewBag.SubCategories = complaintSubCategories.complaintSubCategories;
                    }
                    else
                    {
                        ViewBag.Error = complaintSubCategories.Message;
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
        public ActionResult EditComplaintSubCategories(FormCollection collection) 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.ComplaintSubCategory complaintSubCategory = new LiquidLogic.Models.ComplaintSubCategory();
                    complaintSubCategory.SubCategoryId = Request["subcategoryid"];
                    complaintSubCategory.SubCategoryName = Request["subcategory"];
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    LiquidLogic.Logic.TicketProcessor ticketProcessor = new LiquidLogic.Logic.TicketProcessor();
                    response = ticketProcessor.UpdateComplaintSubCategory(complaintSubCategory.SubCategoryId, complaintSubCategory.SubCategoryName);
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

        public ActionResult EditUserDepartment(string departmentid) 
        {
            try
            {
                LiquidLogic.Models.UserDepartments userDepartments = new LiquidLogic.Models.UserDepartments();
                LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor();
                userDepartments = userProcessor.GetUserDepartmentsById(departmentid);
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

        [HttpPost]
        public ActionResult EditUserDepartment(FormCollection collection)
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                try
                {
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    LiquidLogic.Models.Department department = new LiquidLogic.Models.Department();
                    department.DepartmentName = Request["departmentname"];
                    department.Departmentemail = Request["departmentemail"];
                    department.RecordId = Request["departmentid"];
                    LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor();
                    response = userProcessor.UpdateUserDepartment(department.RecordId, department.DepartmentName, department.Departmentemail);
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

        public ActionResult UserSection() 
        {
            if (Session["FullName"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
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
                return View();
            }
        }

        [HttpPost]
        public ActionResult UserSection(FormCollection collection) 
        {
            try
            {
                if (Session["FullName"] == null)
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    LiquidLogic.Models.DepartmentSection section = new LiquidLogic.Models.DepartmentSection();
                    section.DepartmentId = Request["departmentname"];
                    section.SectionName = Request["sectionname"];
                    LiquidLogic.Logic.UserProcessor userProcessor = new LiquidLogic.Logic.UserProcessor();
                    LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                    response = userProcessor.CreateUserSection(section);
                    if (response.IsSuccessfull)
                    {
                        ViewBag.Message = response.Message;
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

        public ActionResult ViewDepartmentSections() 
        {
            try
            {
                LiquidLogic.Models.SectionResponse sectionResponse = new LiquidLogic.Models.SectionResponse();
                LiquidLogic.Logic.UserProcessor processor = new LiquidLogic.Logic.UserProcessor();
                sectionResponse = processor.GetUserSections();
                if (sectionResponse.IsSuccessfull)
                {
                    ViewBag.UserSections = sectionResponse.departmentSections;
                }
                else
                {
                    ViewBag.Error = sectionResponse.Message;
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
            }
            return View();
        }

        public ActionResult EditUserSection(string sectionid) 
        {
            try
            {
                LiquidLogic.Models.SectionResponse response = new LiquidLogic.Models.SectionResponse();
                LiquidLogic.Logic.UserProcessor processor = new LiquidLogic.Logic.UserProcessor();
                response = processor.GetUserSectionById(sectionid);
                if (response.IsSuccessfull)
                {
                    ViewBag.UserSection = response.departmentSections;
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
        public ActionResult EditUserSection()
        {
            try
            {
                LiquidLogic.Models.GenericResponse response = new LiquidLogic.Models.GenericResponse();
                LiquidLogic.Models.DepartmentSection section = new LiquidLogic.Models.DepartmentSection();
                section.SectionId = Request["sectionid"];
                section.SectionName = Request["sectionname"];
                LiquidLogic.Logic.UserProcessor processor = new LiquidLogic.Logic.UserProcessor();
                response = processor.UpdateUserSection(section);
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