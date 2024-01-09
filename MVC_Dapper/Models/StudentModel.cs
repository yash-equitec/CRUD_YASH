using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVC_Dapper.Models
{
    public class StudentModel
    {
        
        public int Student_ID { get; set; }
        [Required(ErrorMessage = "Student Name is required.")]
        public string Student_Name { get; set; }

        public string Student_DOB{ get; set; }
                
        public int Student_Age { get; set; }

        public string Student_Gender { get; set; }

        public int Student_Mobile { get; set; }
        [Required(ErrorMessage = "Student Address is required.")]
        public string Student_Address { get; set; }

        public bool IsDeleted { get; set; }


    }
}