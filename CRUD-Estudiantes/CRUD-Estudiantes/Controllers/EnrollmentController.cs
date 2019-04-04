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
                    //List<Enrollment> lista = db.Enrollment.Where(e => e.Grade > 5).ToList();

                    return View(db.Enrollment.ToList());
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
                    e.EnrollmentDate = DateTime.Now;

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