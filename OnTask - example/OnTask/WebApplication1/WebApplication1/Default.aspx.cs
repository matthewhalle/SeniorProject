using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            //if (this.User.IsInRole("broker"))
            //    Response.Redirect(ResolveUrl("~/Broker/Default.aspx"));
            //if (this.User.IsInRole("admin"))
            //    Response.Redirect(ResolveUrl("~/Admin/Default.aspx"));
            //if (this.User.IsInRole("agent"))
            //    Response.Redirect(ResolveUrl("~/Agent/Default.aspx"));
        }
    }
}