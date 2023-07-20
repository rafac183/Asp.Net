using MahikariTaiV2.Models;
using NGeoNames;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Data.Entity.Core.Metadata.Edm;

namespace MahikariTaiV2.Controllers
{
    public class HomeController : Controller
    {
        //private string datadir = "~/MahikariTaiV2/lib";
        public ActionResult Index()
        {
            return View();
        }

        public void LibreriaDireccion(string datadir)
        {            
            GeoFileDownloader downloader = GeoFileDownloader.CreateGeoFileDownloader();
            downloader.DownloadFile("CL.zip", datadir);
        }
    }
}