using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CRUD_Estudiantes.Models
{
    public class EnrollmentsCE
    {
        public int EnrollmentID { get; set; }

        [Display(Name = "Course")]
        public int CourseID { get; set; }

        [Display(Name = "Student")]
        public int StudentID { get; set; }
        
        [Display(Name = "Enrollment Date")]
        public System.DateTime EnrollmentDate { get; set; }
        
        public int Grade { get; set; }
    }

    [MetadataType(typeof(EnrollmentsCE))]
    public partial class Enrollment
    {
        //public string CourseName { get; set; }
        // public string StudentName { get; set; }

        public string getCourseName(int p_courseID)
        {
            var db = new VenonCollegeEntities();

            Course entCourse = db.Course.Find(p_courseID);

            return entCourse.Title;
        }

        public string getStudentName(int p_personID)
        {
            var db = new VenonCollegeEntities();

            Person entPerson  = db.Person.Find(p_personID);

            string completeName = entPerson.LastName + " " + entPerson.FirstName;

            return completeName;
        }


    }
}