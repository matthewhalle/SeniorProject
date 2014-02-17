using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnTaskBare
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataView DS = (DataView) odsSalesByYear.Select(DataSourceSelectArguments.Empty);
                this.Chart1.Series[0].Label = "#PERCENT{P2}";
                this.Chart1.Series[0].LegendText = "#VALX";
                
                foreach (DataRowView drvSql in DS)
                {
                    lblActiveAgents.Text = "  "+ drvSql["Total"].ToString();

                }
            }


        }

        protected void grdvwSalesByCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LoginView1_ViewChanged(object sender, EventArgs e)
        {

        }
    }
}