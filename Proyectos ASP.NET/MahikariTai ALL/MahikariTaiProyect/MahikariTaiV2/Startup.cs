using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MahikariTaiV2.Startup))]
namespace MahikariTaiV2
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
