using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

using OnTaskLibrary.Accounts;


namespace WebApplication1.Admin
{


    public partial class CreateUser : System.Web.UI.Page
    {
        private static string conn = ConfigurationManager.ConnectionStrings["OnTaskDB"].ToString();
        private static string appName = Membership.ApplicationName;
        private string qUserId = "";
        Accounts account = new Accounts(conn);


        protected void Page_Load(object sender, EventArgs e)
        {
            qUserId = Request.QueryString["userId"];
           
            if (!Page.IsPostBack)
            {
                LoadDropDownLists();
                if (!string.IsNullOrEmpty(qUserId))
                {
                    CreateAccountButton.Text = "Update User";
                    LoadUser(qUserId);
                }
                else
                    CreateAccountButton.Text = "Create User";
            }
        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {

            try
            {
                string userId = GetText(hdnUserId.Value);
                string fName = txtFirstName.Text;
                string lName = txtLastName.Text;
                string userName = Username.Text;
                string password = Password.Text;
                string role = ddlRoles.SelectedValue;
                string email = Email.Text;
                DateTime? dateOfBirth = GetDate(txtDateOfBirth.Text);
                DateTime? dateOfHire = GetDate(txtHireDate.Text);
                DateTime? licenseExpiration = GetDate(txtLicExpDate.Text);
                string address1 = txtAddress1.Text;
                string address2 = txtAddress2.Text;
                string city = txtCity.Text;
                string state = txtState.Text;
                string zip = txtZip.Text;
                string officePhone = txtOfficePhone.Text;
                string mobilePhone = txtMobilePhone.Text;
                string fax = txtFaxNumber.Text;
                int? commissionPlanID = GetNullableInt(ddlCommissionPlan.SelectedValue);
                int? providerID = GetNullableInt(ddlProvider.SelectedValue);
                string almCode = txtALMCode.Text;
                string mlsID = txtMLSID.Text;

                if (string.IsNullOrEmpty(userId))
                {
                    MembershipUser newUser = Membership.CreateUser(Username.Text, Password.Text, Email.Text);
                    userId = Convert.ToString(newUser.ProviderUserKey);

                    account.AddUserToRole(appName, userId, ddlRoles.SelectedItem.Text, DateTime.Now);
                    account.User_Insert(userId, lName, fName, dateOfBirth, dateOfHire, licenseExpiration, officePhone, mobilePhone, fax, address1, address2, city, state, zip, providerID, almCode, commissionPlanID, mlsID, 1, Convert.ToString(Membership.GetUser().ProviderUserKey));
                     

                    CreateAccountResults.Text = "User successfully created";
                }
                else
                {
                    account.DeleteFromRole(userId);
                    account.AddUserToRole(appName, userId, ddlRoles.SelectedItem.Text, DateTime.Now);
                    account.UpdateEmail(userId, email);
                    account.User_Update(userId, lName, fName, dateOfBirth, dateOfHire, licenseExpiration, officePhone, mobilePhone, fax, address1, address2, city, state, zip, providerID, almCode, commissionPlanID, mlsID, 1, Convert.ToString(Membership.GetUser().ProviderUserKey));

                    CreateAccountResults.Text = "User successfully updated";
                }

            }
            catch (Exception ex)
            {
                CreateAccountResults.Text = ex.Message;
                return;
            }

        }


    

        protected void LoadDropDownLists()
        {
            LoadRoles();
            LoadCommissionPlans();
            LoadProviders();
        }


        protected void LoadRoles()
        {
            
            DataTable oDT = account.GetRoles(appName);

            ddlRoles.DataSource = oDT;
            ddlRoles.DataValueField = "RoleId";
            ddlRoles.DataTextField = "RoleName";
            ddlRoles.DataBind();

        }


        protected void LoadCommissionPlans()
        {
            DataTable oDT = account.GetCommissionPlans(null);

            ddlCommissionPlan.DataSource = oDT;
            ddlCommissionPlan.DataValueField = "CommissionRateID";
            ddlCommissionPlan.DataTextField = "CommissionRateDescription";
            ddlCommissionPlan.DataBind();
        }

        protected void LoadProviders()
        {
            DataTable oDT = account.GetProviders(null);

            ddlProvider.DataSource = oDT;
            ddlProvider.DataValueField = "ProviderID";
            ddlProvider.DataTextField = "ProviderDescription";
            ddlProvider.DataBind();
        }

        protected void LoadUser(string userId)
        {

            DataTable oDT = account.GetUser(userId);
            if (oDT.Rows.Count > 0)
            {
            DataRow dr = oDT.Rows[0];
            hdnUserId.Value = GetText(dr["UserId"]);
            txtFirstName.Text = GetText(dr["FirstName"]);
            txtLastName.Text  = GetText(dr["LastName"]);
            ddlRoles.SelectedValue = GetText(dr["RoleId"]);
            Email.Text = GetText(dr["Email"]);
            txtDateOfBirth.Text = GetText(dr["DateOfBirth"]);
            txtHireDate.Text = GetText(dr["HireDate"]);
            txtLicExpDate.Text = GetText(dr["LicenseExpiration"]);
            txtAddress1.Text = GetText(dr["Address1"]);
            txtAddress2.Text = GetText(dr["Address2"]);
            txtCity.Text = GetText(dr["City"]);
            txtState.Text = GetText(dr["State"]);
            txtZip.Text = GetText(dr["Zip"]);
            txtOfficePhone.Text = GetText(dr["OfficePhone"]);
            txtMobilePhone.Text = GetText(dr["MobilePhone"]);
            txtFaxNumber.Text = GetText(dr["FaxNumber"]);
            ddlCommissionPlan.SelectedValue = GetText(dr["CommissionRateID"]);
            ddlProvider.SelectedValue = GetText(dr["ProviderID"]);
            txtALMCode.Text = GetText(dr["ALM_Code"]);
            txtMLSID.Text = GetText(dr["MLS_ID"]);
            }
        }


        protected string GetText(object text)
        {
            string result = text == DBNull.Value ?  string.Empty : Convert.ToString(text); 
            return result;
        }

        protected DateTime? GetDate(object text)
        {
            DateTime? result = (text == DBNull.Value || string.IsNullOrEmpty(Convert.ToString(text))) ? null : (DateTime?)Convert.ToDateTime(text);
            return result;
        }
        protected int? GetNullableInt(object text)
        {
            int? result = text == DBNull.Value ? null : (int?)Convert.ToInt32(text);
            return result;
        }

    }
}