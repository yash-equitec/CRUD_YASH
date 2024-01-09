using ClosedXML.Excel;
using Dapper;
using MVC_Dapper.Models;
using MVC_Dapper.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web.Mvc;
namespace MVC_Dapper.Controllers
{
    public class StudentController : Controller
    {
        static string conStr = @"Data Source = DESKTOP-6BQAM4C;Initial Catalog = StudentDb;User ID=sa;Password=123;";
        private StudentRepository Repo = new StudentRepository(conStr);
        public ActionResult AddStudent()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddStudent(StudentModel Stu)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Stu.IsDeleted = true;
                    Repo.AddStudent(Stu);
                    return RedirectToAction("GetAllStudentDetails");
                }   
                else
                {
                    return View(Stu);
                }
            }
            catch
            {
                return View();
            }
        }
        public ActionResult EditStudentDetails(int id)
        {
            return View(Repo.GetAllStudents().Find(Stu => Stu.Student_ID == id));
        }
        [HttpPost]
        public ActionResult EditStudentDetails(int id, StudentModel obj)
        {
            try
            {
                Repo.UpdateStudent(obj);
                return RedirectToAction("GetAllStudentDetails");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult GetAllStudentDetails(int page = 1, int pageSize = 3)
        {
            var allStudents = Repo.GetAllStudents();
            var totalCount = allStudents.Count();
            var totalPages = (int)Math.Ceiling((double)totalCount / pageSize);
            var paginatedStudents = allStudents.Skip((page - 1) * pageSize).Take(pageSize);
            ViewBag.PageNumber = page;
            ViewBag.TotalPages = totalPages;
            ViewBag.PageSize = pageSize;
            return View(paginatedStudents);
        }

        public ActionResult DeleteStudent(int Id)
        {
            try
            {
                using (IDbConnection dbConnection = new SqlConnection(conStr))
                {
                    dbConnection.Open();
                    dbConnection.Execute("StudentDelete", new { Student_ID = Id });
                }
                return RedirectToAction("GetAllStudentDetails");
            }
            catch
            {
                return RedirectToAction("GetAllStudentDetails");
            }
        }
        public ActionResult SoftDeletedStudents()
        {
            using (IDbConnection dbConnection = new SqlConnection(conStr))
            {
                dbConnection.Open();
                IList<StudentModel> st = dbConnection.Query<StudentModel>("SoftDelete", commandType: CommandType.StoredProcedure).ToList();
                return View(st);
            }
        }
        public ActionResult RestoreStudent(int ID)
        {
            using (IDbConnection dbConnection = new SqlConnection(conStr))
            {
                dbConnection.Open();
                IList<StudentModel> st = dbConnection.Query<StudentModel>("RestoreData", new { Student_ID = ID }, commandType: CommandType.StoredProcedure).ToList();
                return RedirectToAction("GetAllStudentDetails");
            }
        }
        public ActionResult ExportToExcel()
        {
            var data = Repo.GetAllStudents();

            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Sheet1");
                worksheet.Cell(1, 1).InsertTable(data, "DataTable", true);
                Response.Clear();
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=ExportedData.xlsx");
                workbook.SaveAs(Response.OutputStream);
                Response.End();
            }
            return View();
        }
        private List<StudentModel> GetSampleData()
        {
            return new List<StudentModel>
        {
            new StudentModel {},
        };
        }

        public ActionResult PrintTable()
        {
           // List<StudentModel> student; 

            using (IDbConnection dbConnection = new SqlConnection(conStr))
            {
                dbConnection.Open();
                IList<StudentModel> st = dbConnection.Query<StudentModel>("StudentView", commandType: CommandType.StoredProcedure).ToList();
                StringBuilder tableHtml = new StringBuilder();
                tableHtml.AppendLine("<style>");
                tableHtml.AppendLine("table { border-collapse: collapse; width: 100%; }");
                tableHtml.AppendLine("th, td { border: 1px solid black; padding: 8px; text-align: left; }");
                tableHtml.AppendLine("</style>");
                tableHtml.AppendLine("<table>");
                tableHtml.AppendLine("<tr><th>Name</th><th>DOB</th><th>Age</th><th>Gender</th><th>Mobile</th><th>Address</th></tr>");
                foreach (var s in st)
                {
                    tableHtml.AppendLine("<tr>");
                    tableHtml.AppendLine($"<td>{s.Student_Name}</td>");
                    tableHtml.AppendLine($"<td>{s.Student_DOB}</td>");
                    tableHtml.AppendLine($"<td>{s.Student_Age}</td>");
                    tableHtml.AppendLine($"<td>{s.Student_Gender}</td>");
                    tableHtml.AppendLine($"<td>{s.Student_Mobile}</td>");
                    tableHtml.AppendLine($"<td>{s.Student_Address}</td>");
                    tableHtml.AppendLine("</tr>");
                }
                tableHtml.AppendLine("</table>");
                string script = "<script type='text/javascript'>window.onload = function() { window.print(); }</script>";
                string content = tableHtml.ToString() + script;
                return Content(content, "text/html");
            }
        }
    }
}
