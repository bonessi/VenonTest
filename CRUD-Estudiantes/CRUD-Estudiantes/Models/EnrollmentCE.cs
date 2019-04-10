using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CRUD_Estudiantes.Models
{
    public class EnrollmentCE
    {
        public int EnrollmentID { get; set; }

        [Display(Name = "Course")]
        public int CourseID { get; set; }

        [Display(Name = "Student")]
        public int StudentID { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        [Display(Name = "Enrollment Date")]
        public System.DateTime EnrollmentDate { get; set; }
        
        public int Grade { get; set; }

        public string CourseName { get; set; }

        public string StudentName { get; set; }

    }

    [MetadataType(typeof(EnrollmentCE))]
    public partial class Enrollment
    {
        public string CourseName { get; set; }

        public string StudentName { get; set; }
    }
}