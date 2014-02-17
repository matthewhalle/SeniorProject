using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

using OnTaskLibrary.BrokerLogs; 


namespace WebApplication1.Broker
{
    public partial class ViewBrokerLog : System.Web.UI.Page
    {

        private static string conn = ConfigurationManager.ConnectionStrings["OnTaskDB"].ToString();
        BrokerLogs log = new BrokerLogs(conn);

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadBrokerLog();
        }

        protected void lvBrokerLog_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            switch (e.CommandName)
            { 
                case "edit":
                    Response.Redirect(string.Format("EditBrokerLog.aspx?fileNumber={0}", e.CommandArgument.ToString()), true);
                    break;
                case "delete":
                    break;
            }
        }

        protected void LoadBrokerLog()
        {
            DataTable oDT = log.GetBrokerLog();
            if (oDT.Rows.Count > 0)
            {
                lvBrokerLog.DataSource = oDT;
                lvBrokerLog.DataBind();
            }
        }
    }
}