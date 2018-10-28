using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VKR.Startup))]
namespace VKR
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
