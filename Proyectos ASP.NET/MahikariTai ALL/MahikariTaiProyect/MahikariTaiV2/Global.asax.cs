using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace MahikariTaiV2
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {

            string serviceUrl = "https://localhost:44317/DataBase_WS.asmx"; // URL del servicio

            Task.Run(() =>
            {
                // Verificar si el servicio ya está en ejecución
                if (!IsServiceRunning(serviceUrl))
                {
                    // Iniciar el servicio en segundo plano
                    StartService(serviceUrl);
                }
            });

            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);            
        }

        private bool IsServiceRunning(string serviceUrl)
        {
            try
            {
                using (var client = new WebClient())
                {
                    client.DownloadString(serviceUrl);
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        private void StartService(string serviceUrl)
        {
            string iisExpressPath = @"C:\Program Files (x86)\IIS Express\iisexpress.exe"; // Ruta al ejecutable de IIS Express
            string projectPath = AppDomain.CurrentDomain.BaseDirectory; // Ruta de tu proyecto

            ProcessStartInfo startInfo = new ProcessStartInfo
            {
                FileName = iisExpressPath,
                Arguments = $"/path:\"{projectPath}\" /port:44317",
                CreateNoWindow = true,
                UseShellExecute = false
            };

            using (Process process = new Process { StartInfo = startInfo })
            {
                process.Start();
                process.WaitForExit();
            }
        }
    }
}
