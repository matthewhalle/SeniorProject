using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnTask
{
    public partial class detailed_view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
        
                
                //SqlDataSource query = new SqlDataSource();
                //query.ID = "query";
                //this.Page.Controls.Add(query);
                //query.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["OTBS"].ConnectionString;
                //query.SelectCommand =
                //    "SELECT MLSId, Agent_FName, Agent_LName, License_Num, License_Exp, Acct_Status FROM dbo.Agent_Log WHERE (Acct_Status = false)";
                //GridView1.DataSource = query;
                //GridView1.DataBind();
            }
            
            

        }
    }
}