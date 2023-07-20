using MahikariTaiV2.Controllers;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace MahikariTaiV2
{
    public class MvcApplication : HttpApplication
    {
        private MembersController funcion = new MembersController();
        protected void Application_Start()
        {
            //funcion.LibreriaDireccion();
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

    }
}
