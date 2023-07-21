using MahikariTaiV2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MahikariTaiV2.Controllers
{
    public class MiyakushaController : Controller
    {
        // GET: Miyakusha
        db_MahikariTaiEntities db = new db_MahikariTaiEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Shonenbu()
        {
            var modelo = from mi in db.miembro
                         join cat in db.categoria on mi.id_categoria equals cat.id_categoria
                         join nac in db.nacionality on mi.id_nac equals nac.id_nac
                         join ge in db.gender on mi.id_gender equals ge.id_gender
                         join dir in db.direccion on mi.id_direccion equals dir.id_direccion
                         join co in db.comuna on dir.id_comuna equals co.id_comuna
                         join pr in db.provincia on co.id_provincia equals pr.id_provincia
                         join re in db.region on pr.id_region equals re.id_region
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
                             provincia = pr.name_provincia,
                             comuna = co.name_comuna,
                             hobbies = mi.hobbies
                         };

            return View(modelo.ToList());
        }
        public ActionResult Juntaiin()
        {
            return View();
        }
        public ActionResult TaiinMale()
        {
            return View();
        }
        public ActionResult TaiinFemale()
        {
            return View();
        }

        public ActionResult ListaMaestraCargos()
        {
            var modelo = (from ca in db.cargo_names
                          group ca by ca.cargo_name into g
                          select new Cargos
                          {
                              cargo = g.Key
                          });

            return View(modelo.ToList());
        }


        public ActionResult Miembros(string cargo)
        {
            var modelo = from ca in db.cargo
                         join cn in db.cargo_names on ca.id_cargo_name equals cn.id_cargo_name
                         join mi in db.miembro on ca.rut_user equals mi.rut_user
                         where cn.cargo_name == cargo
                         select new Cargos
                         {
                             cargo = cn.cargo_name,
                             nombre = mi.nombres,
                             rut = mi.rut_user
                         };

            return View(modelo.ToList());
        }

    }
}