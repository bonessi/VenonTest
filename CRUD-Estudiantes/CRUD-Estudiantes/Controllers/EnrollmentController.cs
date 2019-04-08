using CRUD_Estudiantes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace CRUD_Estudiantes.Controllers
{
    public class EnrollmentController : Controller
    {
        // GET: Enrollment
        public ActionResult Index()
        {
            try
            {
                using (var db = new VenonCollegeEntities())
                {
                    
                    var data = from e in db.Enrollment
                               join p in db.Person on e.StudentID equals p.ID
                               join c in db.Course on e.CourseID equals c.CourseID
                               select new EnrollmentCE()
                               {
                                   EnrollmentID = e.EnrollmentID,
                                   CourseName = c.Title,
                                   StudentName = (p.LastName +" "+ p.FirstName),
                                   EnrollmentDate = e.EnrollmentDate,
                                   Grade = e.Grade
                               };

                    return View(data.ToList());
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        
        [HttpGet]
        public ActionResult Agregar()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Agregar(Enrollment e)
        {
            try
            {
                if (!ModelState.IsValid)
                    return View();
                using (var db = new VenonCollegeEntities())
                {

                    db.Enrollment.Add(e);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Enrollment add error - " + ex.Message);
                return View();
            }
        }

        public static string getCourseName(int p_courseID)
        {
            try
            {
                using (var db = new VenonCollegeEntities())
                {
                    Course entCourse = db.Course.Find(p_courseID);

                    return entCourse.Title;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static string getStudentName(int p_personID)
        {
            try
            {
                using (var db = new VenonCollegeEntities())
                {
                    Person entPerson = db.Person.Find(p_personID);

                    string completeName = entPerson.LastName + " " + entPerson.FirstName;

                    return completeName;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public ActionResult ListaCursos()
        {
            using (var db = new VenonCollegeEntities())
            {
                return PartialView(db.Course.ToList());
            }
        }

        public ActionResult ListaEstudiantes()
        {
            using (var db = new VenonCollegeEntities())
            {
                return PartialView(db.Person.Where(e => e.Discriminator == "Student").ToList());
            }
        }

        [HttpGet]
        public ActionResult Editar(int id)
        {
            try
            {
                
                using (var db = new VenonCollegeEntities())
                {
                    Enrollment en = db.Enrollment.Find(id);

                    return View(en);
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Enrollment edit error - " + ex.Message);
                return View();
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(Enrollment e)
        {
            try
            {
                if (!ModelState.IsValid)
                    return View();
                using (var db = new VenonCollegeEntities())
                {
                    Enrollment en = db.Enrollment.Find(e.EnrollmentID);
                    

                    en.Grade = e.Grade;

                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        public ActionResult Detalle(int id)
        {
            try
            {
                using (var db = new VenonCollegeEntities())
                {
                    Enrollment en = db.Enrollment.Find(id);

                    return View(en);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public ActionResult Eliminar(int id)
        {
            try
            {
                using (var db = new VenonCollegeEntities())
                {
                    Enrollment en = db.Enrollment.Find(id);
                    db.Enrollment.Remove(en);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }



    }
}