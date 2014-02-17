using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnTaskBare
{
    public partial class LoginControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            //if (Login1.UserName == "Matthew")
            //{
            //    e.Authenticated = true;
            //    FormsAuthentication.SetAuthCookie(Login1.UserName, false); //note in live turn this to false
            //    Response.Redirect("~/Dashboard.aspx");
            //    Session["UserLevel"] = "Broker";
            //    Login1.Visible = false;
            //}
            //else
            //{
            //    Login1.Visible = true;
            //    e.Authenticated = false;
            //    Login1.FailureText = "Either your username or password was incorrect";
            //}
        }

        protected void UserName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void cmdLogIn_Click(object sender, EventArgs e)
        {
            //web config method
            if (System.Web.Security.FormsAuthentication.Authenticate(txtUserName.Text, txtPassword.Text))
            {
                //good you logged in.
                System.Web.Security.FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, false);
                Response.Redirect("Dashboard.aspx");
                

            }
            else
            {
                lblError.Text = "Your username or password was incorrect";
                lblError.Visible = true;
            }

        }
    }
}