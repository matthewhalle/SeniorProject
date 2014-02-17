using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnTask.Account
{
    public partial class LoginControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Login1.UserName == "Matthew")
            {
                
                Login1.Visible = false;
            }
            else
            {
                Login1.Visible = true;
                
            }

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (Login1.UserName == "Matthew")
            {
                e.Authenticated = true;
                FormsAuthentication.SetAuthCookie(Login1.UserName, false); //note in live turn this to false
                Response.Redirect("~/Dashboard.aspx");
                Session["UserLevel"] = "Broker";
                Login1.Visible = false;
            }
            else
            {
                Login1.Visible = true;
                e.Authenticated = false;
                Login1.FailureText = "Either your username or password was incorrect";
            }

            //SqlConnection conn = new SqlConnection();
            //string connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
            //conn.ConnectionString = connectionstring;
            //conn.Open();
            //SqlCommand comm = new SqlCommand();
            //comm.Connection = conn;
            ////this needs to be tested and clarified with Dennis
            //string sql = "select userlevel from table where userid or Email_Address = @userid and Password = @password";
            //comm.CommandText = sql;
            //comm.Parameters.AddWithValue("@userid", Login1.UserName);
            //comm.Parameters.AddWithValue("@password", Login1.Password);

            //object result = comm.ExecuteScalar();
            //if (result != null)
            //{
            //    //send them where i choose:
            //    e.Authenticated = true;
            //    Session["UserLevel"] = result.ToString();
            //    FormsAuthentication.SetAuthCookie(Login1.UserName, false);
            //    System.Threading.Thread.Sleep(1000);
            //    Response.Redirect("~/Secure/Dashboard.aspx");

            //}
            //else
            //{
            //    e.Authenticated = false;
            //    Login1.FailureText = "Either your username or password was incorrect";

            //}
            //conn.Close();
        }

        protected void UserName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}