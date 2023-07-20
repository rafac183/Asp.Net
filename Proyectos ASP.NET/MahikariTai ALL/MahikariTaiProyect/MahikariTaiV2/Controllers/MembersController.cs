using MahikariTaiV2.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Services;
using MahikariTaiV2.SR_DB;
using NGeoNames;

namespace MahikariTaiV2.Controllers
{
    public class MembersController : Controller
    {
        // GET: Members
        db_MahikariTaiEntities db = new db_MahikariTaiEntities();
        public ActionResult Index()
        {
            return View();
        }

        //Filtrar por Integrante "Shonenbu"
        public ActionResult Shonenbu()
        {
            var modelo = from mi in db.miembro
                         join cat in db.categoria on mi.id_categoria equals cat.id_categoria
                         join nac in db.nacionality on mi.id_nac equals nac.id_nac
                         join ge in db.gender on mi.id_gender equals ge.id_gender
                         join dir in db.direccion on mi.id_direccion equals dir.id_direccion
                         join co in db.comuna on dir.id_comuna equals co.id_comuna
                         join ci in db.ciudad on co.id_ciudad equals ci.id_ciudad
                         join re in db.region on ci.id_region equals re.id_region
                         where cat.categoria_name == "Shonenbu"
                         select new ElIntegrante
                         {
                             rut = mi.rut_user,
                             names = mi.nombres,
                             firstLastname = mi.first_lastname,
                             secondLastname = mi.second_lastname,
                             gender = ge.gender1,
                             category = cat.categoria_name,
                             email = mi.email,
                             birthdate = mi.birthdate,
                             nacionality = nac.nacionality1,
                             phone = mi.phone_number,
                             street = dir.calle,
                             number = dir.number.ToString(),
                             region = re.name_region,
                             ciudad = ci.name_ciudad,
                             comuna = co.name_comuna,
                             hobbies = mi.hobbies
                         };

            return View(modelo.ToList());
        }

        //Filtrar por Miembro Seinenbu "Juntaiin"
        public ActionResult Juntaiin()
        {
            var modelo = from mi in db.miembro
                         join cat in db.categoria on mi.id_categoria equals cat.id_categoria
                         join nac in db.nacionality on mi.id_nac equals nac.id_nac
                         join ge in db.gender on mi.id_gender equals ge.id_gender
                         join dir in db.direccion on mi.id_direccion equals dir.id_direccion
                         join co in db.comuna on dir.id_comuna equals co.id_comuna
                         join ci in db.ciudad on co.id_ciudad equals ci.id_ciudad
                         join re in db.region on ci.id_region equals re.id_region
                         where cat.categoria_name == "Seinenbu"
                         select new ElIntegrante
                         {
                             rut = mi.rut_user,
                             names = mi.nombres,
                             firstLastname = mi.first_lastname,
                             secondLastname = mi.second_lastname,
                             gender = ge.gender1,
                             category = cat.categoria_name,
                             email = mi.email,
                             birthdate = mi.birthdate,
                             nacionality = nac.nacionality1,
                             phone = mi.phone_number,
                             street = dir.calle,
                             number = dir.number.ToString(),
                             region = re.name_region,
                             ciudad = ci.name_ciudad,
                             comuna = co.name_comuna,
                             hobbies = mi.hobbies
                         };

            return View(modelo.ToList());
        }

        //Filtrar por Miembro Seinenbu "Taiin"
        public ActionResult Taiin()
        {
            var modelo = from mi in db.miembro
                         join cat in db.categoria on mi.id_categoria equals cat.id_categoria
                         join nac in db.nacionality on mi.id_nac equals nac.id_nac
                         join ge in db.gender on mi.id_gender equals ge.id_gender
                         join dir in db.direccion on mi.id_direccion equals dir.id_direccion
                         join co in db.comuna on dir.id_comuna equals co.id_comuna
                         join ci in db.ciudad on co.id_ciudad equals ci.id_ciudad
                         join re in db.region on ci.id_region equals re.id_region
                         where cat.categoria_name == "Seinenbu"
                         select new ElIntegrante
                         {
                             rut = mi.rut_user,
                             names = mi.nombres,
                             firstLastname = mi.first_lastname,
                             secondLastname = mi.second_lastname,
                             gender = ge.gender1,
                             category = cat.categoria_name,
                             email = mi.email,
                             birthdate = mi.birthdate,
                             nacionality = nac.nacionality1,
                             phone = mi.phone_number,
                             street = dir.calle,
                             number = dir.number.ToString(),
                             region = re.name_region,
                             ciudad = ci.name_ciudad,
                             comuna = co.name_comuna,
                             hobbies = mi.hobbies
                         };


            return View(modelo.ToList());
        }

        //Filtrar por Miembro "Seijimbu"
        public ActionResult Seijimbu()
        {
            var modelo = from mi in db.miembro
                         join cat in db.categoria on mi.id_categoria equals cat.id_categoria
                         join nac in db.nacionality on mi.id_nac equals nac.id_nac
                         join ge in db.gender on mi.id_gender equals ge.id_gender
                         join dir in db.direccion on mi.id_direccion equals dir.id_direccion
                         join co in db.comuna on dir.id_comuna equals co.id_comuna
                         join ci in db.ciudad on co.id_ciudad equals ci.id_ciudad
                         join re in db.region on ci.id_region equals re.id_region
                         where cat.categoria_name == "Seijimbu"
                         select new ElIntegrante
                         {
                             rut = mi.rut_user,
                             names = mi.nombres,
                             firstLastname = mi.first_lastname,
                             secondLastname = mi.second_lastname,
                             gender = ge.gender1,
                             category = cat.categoria_name,
                             email = mi.email,
                             birthdate = mi.birthdate,
                             nacionality = nac.nacionality1,
                             phone = mi.phone_number,
                             street = dir.calle,
                             number = dir.number.ToString(),
                             region = re.name_region,
                             ciudad = ci.name_ciudad,
                             comuna = co.name_comuna,
                             hobbies = mi.hobbies
                         };

            return View(modelo.ToList());
        }

        //Añadir Miembro a la base de datos
        [HttpPost]
        public JsonResult AñadirMiembro(string rut, string nombres, string primerApellido, string segundoApellido, string genero, string categoria, string email, string birthdate, string nacionalidad, string phone, string calle, int numero, string region, string ciudad, string comuna, string hobbies)
        {
            // Lógica para obtener las ciudades según la región desde tu servicio web
            DataBase_WSSoapClient WS = new DataBase_WSSoapClient();
            WS.AñadirMiembro(rut,nombres,primerApellido,segundoApellido,genero,categoria,email,birthdate,nacionalidad,phone,calle,numero,region,ciudad,comuna,hobbies);

            var resultado = new
            {
                exitoso = true,
                mensaje = "El Miembro se agregó correctamente.",
                mensaje2 = "Miembro Creado"
            };

            return Json(resultado);
        }

        //Modificar Miembro a la base de datos
        [HttpPost]
        public JsonResult ModificarMiembro(string rut, string nombres, string primerApellido, string segundoApellido, string genero, string categoria, string email, string birthdate, string nacionalidad, string phone, string calle, int numero, string region, string ciudad, string comuna, string hobbies)
        {
            // Lógica para obtener las ciudades según la región desde tu servicio web
            DataBase_WSSoapClient WS = new DataBase_WSSoapClient();
            WS.ModificarMiembro(rut, nombres, primerApellido, segundoApellido, genero, categoria, email, birthdate, nacionalidad, phone, calle, numero, region, ciudad, comuna, hobbies);

            var resultado = new
            {
                exitoso = true,
                mensaje = "El Miembro se modificó correctamente.",
                mensaje2 = "Miembro Modificado"
            };

            return Json(resultado);
        }

        //Eliminar miembro de la base de datos
        [HttpPost]
        public JsonResult EliminarMiembro(string rut)
        {
            // Lógica para obtener las ciudades según la región desde tu servicio web
            DataBase_WSSoapClient WS = new DataBase_WSSoapClient();
            WS.EliminarMiembro(rut);

            var resultado = new
            {
                exitoso = true,
                mensaje = "El Miembro se eliminó correctamente.",
                mensaje2 = "Miembro Eliminado"
            };

            return Json(resultado);
        }

        //Mostrar todos los miembros de la base de datos
        [HttpGet]
        public JsonResult AllMembers()
        {
            // Lógica para obtener los miembros desde tu servicio web
            DataBase_WSSoapClient WS = new DataBase_WSSoapClient();
            DataSet miembros = WS.AllMembers();

            var listaMiembros = new List<ElIntegrante>();

            foreach (DataRow row in miembros.Tables[0].Rows)
            {
                DateTime.TryParse(row["Fecha de Nacimiento"].ToString(), out DateTime birthdate);
                var elMiembro = new ElIntegrante
                {
                    rut = row["Rut"].ToString(),
                    names = row["Nombres"].ToString(),
                    firstLastname = row["Apellido Paterno"].ToString(),
                    secondLastname = row["Apellido Materno"].ToString(),
                    gender = row["Genero"].ToString(),
                    category = row["Categoria"].ToString(),
                    email = row["Correo"].ToString(),
                    birthdate = birthdate, 
                    nacionality = row["Nacionalidad"].ToString(),
                    phone = row["Telefono"].ToString(),
                    street = row["Calle"].ToString(),
                    number = row["Numero"].ToString(),
                    region = row["Region"].ToString(),
                    ciudad = row["Ciudad"].ToString(),
                    comuna = row["Comuna"].ToString(),
                    hobbies = row["Hobbies"].ToString()
                };

                listaMiembros.Add(elMiembro);
            }

            return Json(new { data = listaMiembros }, JsonRequestBehavior.AllowGet);
        }

        //Mostrar toda la informacion de cada miembro de la base de datos
        [HttpPost]
        public JsonResult AllInfoMember(string rut)
        {
            // Lógica para obtener las ciudades según la región desde tu servicio web
            DataBase_WSSoapClient WS = new DataBase_WSSoapClient();
            DataSet miembros = WS.AllInfo(rut);
            

            var miembro = new List<ElIntegrante>();

            if (miembros != null && miembros.Tables.Count > 0 && miembros.Tables[0].Rows.Count > 0)
            {
                DataRow row = miembros.Tables[0].Rows[0];
                var elMiembro = new ElIntegrante
                {
                    rut = row["Rut"].ToString(),
                    names = row["Nombres"].ToString(),
                    firstLastname = row["Apellido Paterno"].ToString(),
                    secondLastname = row["Apellido Materno"].ToString(),
                    gender = row["Genero"].ToString(),
                    category = row["Categoria"].ToString(),
                    email = row["Correo"].ToString(),
                    birthdate = row.Field<DateTime>("Fecha de Nacimiento"),
                    nacionality = row["Nacionalidad"].ToString(),
                    phone = row["Telefono"].ToString(),
                    street = row["Calle"].ToString(),
                    number = row["Numero"].ToString(),
                    region = row["Region"].ToString(),
                    ciudad = row["Ciudad"].ToString(),
                    comuna = row["Comuna"].ToString(),
                    hobbies = row["Hobbies"].ToString()
                };

                miembro.Add(elMiembro);
            }


            return Json(new { miembros = miembro }, JsonRequestBehavior.AllowGet);
        }

        //Traer las ciudades de cada region desde la base de datos
        [HttpPost]
        public JsonResult GetCiudadesByRegion(string region)
        {
            // Lógica para obtener las ciudades según la región desde tu servicio web
            DataBase_WSSoapClient WS = new DataBase_WSSoapClient();
            DataSet ciudades = WS.SearchCiudadAndShow(region);

            var ciudadesList = new List<string>();
            foreach (DataRow row in ciudades.Tables[0].Rows)
            {
                ciudadesList.Add(row["Ciudad"].ToString());
            }

            return Json(new { ciudades = ciudadesList }, JsonRequestBehavior.AllowGet);
        }

        //Traer las comunas de cada ciudad desde la base de datos
        [HttpPost]
        public JsonResult GetComunasByCiudad(string ciudad)
        {
            // Lógica para obtener las comunas según la ciudad desde tu servicio web
            DataBase_WSSoapClient WS = new DataBase_WSSoapClient();
            DataSet comunas = WS.SearchComunaAndShow(ciudad);

            var comunasList = new List<string>();
            foreach (DataRow row in comunas.Tables[0].Rows)
            {
                comunasList.Add(row["Comuna"].ToString());
            }

            return Json(new { comunas = comunasList }, JsonRequestBehavior.AllowGet);
        }



    }
}