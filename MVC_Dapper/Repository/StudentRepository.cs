using Dapper;
using MVC_Dapper.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
namespace MVC_Dapper.Repository     
{
    public class StudentRepository
    {
        private readonly string _connectionString;
        public StudentRepository(string connectionString)
        {
            this._connectionString = connectionString;
        }

        public void AddStudent(StudentModel objStu)
        {
            try
            {
                DynamicParameters dynamicParameters = new DynamicParameters();
                dynamicParameters.Add("Student_Name", objStu.Student_Name);
                dynamicParameters.Add("Student_DOB", objStu.Student_DOB);
                dynamicParameters.Add("Student_Gender", objStu.Student_Gender);
                dynamicParameters.Add("Student_Address", objStu.Student_Address);
                dynamicParameters.Add("Student_Age", objStu.Student_Age);
                dynamicParameters.Add("Student_Mobile", objStu.Student_Mobile);
                dynamicParameters.Add("IsDeleted", true);
                    
                using (IDbConnection db = new SqlConnection(_connectionString))
                {
                    db.Open();
                    db.Execute("StudentAdd", dynamicParameters, commandType: CommandType.StoredProcedure);
                    db.Close();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<StudentModel> GetAllStudents()
        {
            try
            {
                using (IDbConnection db = new SqlConnection(_connectionString))
                {
                    db.Open();
                    IList<StudentModel> studentList = db.Query<StudentModel>("StudentView", commandType: CommandType.StoredProcedure).ToList();
                    db.Close();
                    return studentList.ToList();
                }

            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public void UpdateStudent(StudentModel objUpdate)
        {
            try
            {
                DynamicParameters dynamicParameters = new DynamicParameters();
                dynamicParameters.Add("Student_ID", objUpdate.Student_ID);
                dynamicParameters.Add("Student_Name", objUpdate.Student_Name);
                dynamicParameters.Add("Student_DOB", objUpdate.Student_DOB);
                dynamicParameters.Add("Student_Gender", objUpdate.Student_Gender);
                dynamicParameters.Add("Student_Address", objUpdate.Student_Address);
                dynamicParameters.Add("Student_Age", objUpdate.Student_Age);
                dynamicParameters.Add("Student_Mobile", objUpdate.Student_Mobile);
                dynamicParameters.Add("IsDeleted", true);

                using (IDbConnection db = new SqlConnection(_connectionString))
                {
                    db.Open();
                    objUpdate.IsDeleted = true;
                    db.Execute("StudentUpdate", dynamicParameters, commandType: CommandType.StoredProcedure);
                    db.Close();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool DeleteStudent(int Id)
        {
            try
            {
                using (IDbConnection db = new SqlConnection(_connectionString))
                {
                    db.Open();
                    db.Execute("StudentDelete", Id, commandType: CommandType.StoredProcedure);
                    db.Close();
                    return true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IPagedList<StudentModel> GetPagedStudents(int page, int pageSize)
        {
            try
            {
                using (IDbConnection db = new SqlConnection(_connectionString))
                {
                    db.Open();
                    var parameters = new DynamicParameters();
                    parameters.Add("@PageSize", pageSize);
                    parameters.Add("@PageNumber", page);
                    var result = db.QueryMultiple("Pagination", parameters, commandType: CommandType.StoredProcedure);
                    var studentList = result.Read<StudentModel>().ToList();
                    var totalRecords = result.ReadSingle<int>();
                    db.Close();
                    return new StaticPagedList<StudentModel>(studentList, page, pageSize, totalRecords);
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}