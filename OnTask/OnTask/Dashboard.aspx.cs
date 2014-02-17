using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnTask
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //if (Session["Userlevel"] == null || Session["UserLevel"].ToString() != "Broker")
            //{
            //    Session.Abandon();
            //    FormsAuthentication.SignOut();
            //    Response.Redirect("Default.aspx");
            //    Response.End();

            //}

            DataView DS = (DataView)odsSalesByYear.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in DS)
            {
                lblActiveAgents.Text = drvSql["Total"].ToString();

            }

        }
        protected void bindData()
        {

            

        }

        protected void grdvwSalesByCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}