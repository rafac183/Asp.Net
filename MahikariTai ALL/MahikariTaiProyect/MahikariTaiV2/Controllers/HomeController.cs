using NGeoNames;
using System.Web.Mvc;

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