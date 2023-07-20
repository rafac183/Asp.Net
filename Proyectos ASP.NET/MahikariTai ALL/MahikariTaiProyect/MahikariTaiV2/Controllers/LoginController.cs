using MahikariTaiV2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MahikariTaiV2.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login

        db_MahikariTaiEntities db = new db_MahikariTaiEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Validar()
        {
            return View();
        }

        //Validar el usuario de la base de datos
        [HttpPost]
        public ActionResult Validar(string user, string pass)
        {
            login us = db.login.FirstOrDefault(d => d.user_name == user && d.clave == pass);

            if (us != null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return RedirectToAction("NoHallado", "Login");
            }
        }

        //Redireccionamiento si no encuentra el usuario
        public ActionResult NoHallado()
        {
            ViewBag.Error = "No se encontro Usuario";
            return View();
        }
    }


}