using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

using OnTaskLibrary.BrokerLogs;
using OnTaskLibrary.Accounts; 


namespace WebApplication1.Broker
{
    public partial class EditBrokerLog : System.Web.UI.Page
    {

        private static string conn = ConfigurationManager.ConnectionStrings["OnTaskDB"].ToString();
        BrokerLogs log = new BrokerLogs(conn);
        Accounts acct = new Accounts(conn);
        string mFileNumber = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
           mFileNumber = Convert.ToString(Request.QueryString["fileNumber"]);
            if (!Page.IsPostBack)
            {
                LoadDropDownLists();
                if (!string.IsNullOrEmpty(mFileNumber))
                    LoadBrokerLog(mFileNumber);
            }
        }

       

        protected void LoadBrokerLog(string fileNumber)
        {
            DataTable oDT = log.GetBrokerLog(fileNumber);
            if (oDT.Rows.Count > 0)
            {
                DataRow dr = oDT.Rows[0];
                txtFileNumber.Text = GetText(dr["Listing_Sales_file_Num"]);
                txtContractReceivedDate.Text = GetText(dr["ContractReceivedDate"]);
                txtContractExpirationDate.Text = GetText(dr["ContractExpirationDate"]);
                cbAgent.SelectedValue = GetText(dr["AgentUserId"]);
                cbSeller.SelectedValue = GetText(dr["SellerUserId"]);
                ddlContractType.SelectedValue = GetText(dr["ContractTypeID"]);
                txtPropertyAddress1.Text = GetText(dr["PropertyAddress1"]);
                txtPropertyAddress2.Text = GetText(dr["PropertyAddress2"]);
                txtPropertyCity.Text = GetText(dr["PropertyCity"]);
                txtPropertyState.Text = GetText(dr["PropertyState"]);
                txtPropertyZip.Text = GetText(dr["PropertyZip"]);
                txtOriginalAskingPrice.Text = GetText(dr["OriginalAskingprice"]);
                txtCurrentAskingPrice.Text = GetText(dr["CurrentAskingPrice"]);
                txtClosingPrice.Text = GetText(dr["ActualClosingPrice"]);
                ddlStatus.SelectedValue = GetText(dr["StatusID"]);
                txtCommission.Text = GetText(dr["TotalCommission"]);
                txtEscroActualDate.Text = GetText(dr["ActualCloseOfEscro"]);
                txtEstimateEscroDate.Text = GetText(dr["EstimatedCloseOfEscro"]);
                txtStatusDate.Text = GetText(dr["StatusDate"]);

                txtFileNumber.Enabled = false;
                
            }

            
        }

        protected void LoadDropDownLists()
        {
            LoadAgents();
            LoadContractStatus();
            LoadContractType();

        
        }

        protected void LoadAgents()
        {
            DataTable oDT = acct.GetAgents();
            cbAgent.DataSource = oDT;
            cbAgent.DataTextField = "UserName";
            cbAgent.DataValueField = "userId";
            cbAgent.DataBind();

            cbSeller.DataSource = oDT;
            cbSeller.DataTextField = "UserName";
            cbSeller.DataValueField = "userId";
            cbSeller.DataBind();

           
        }

        protected void LoadContractStatus()
        {
            DataTable oDT = acct.GetContractStatus();
            ddlStatus.DataSource = oDT;
            ddlStatus.DataTextField = "StatusDescription";
            ddlStatus.DataValueField = "StatusID";
            ddlStatus.DataBind();
        }

        protected void LoadContractType()
        {
            DataTable oDT = acct.GetContractTypes();
            ddlContractType.DataSource = oDT;
            ddlContractType.DataTextField = "ContractTypeDescription";
            ddlContractType.DataValueField = "ContractTypeID";
            ddlContractType.DataBind();
        }

        protected string GetText(object text)
        {
            string result = text == DBNull.Value ? null : Convert.ToString(text);
            if (result == "-1")
                result = null;
            return result;
        }

        protected Guid GetGuid(object text)
        {
            Guid result = Guid.Empty;
            bool canConvert = Guid.TryParse(Convert.ToString(text), out result);
            if (canConvert == true)
                return result;
            else
                return Guid.Empty;
        }

        protected DateTime? GetDate(object text)
        {
            DateTime d = DateTime.Now;
            bool canConvert = DateTime.TryParse(Convert.ToString(text), out d);
            if (canConvert == true)
                return Convert.ToDateTime(text);
            else
                return null;
        }
        protected int? GetNullableInt(object text)
        {
            int i = 0;
            bool canConvert = int.TryParse(Convert.ToString(text), out i);
            if (canConvert == true)
                return Convert.ToInt32(text);
            else
                return null;
        }

        protected decimal? GetNullableDecimal(object text)
        {
            decimal dec = 0;
            bool canConvert = Decimal.TryParse(Convert.ToString(text), out dec);
            if (canConvert == true)
                return (decimal?)Convert.ToDecimal(text);
            else
                return null;

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            string fileNum = txtFileNumber.Text;
            DateTime? contRecDate = GetDate(txtContractReceivedDate.Text);
            DateTime? contExpDate = GetDate(txtContractExpirationDate.Text);
            Guid agentUserId = GetGuid(cbAgent.SelectedValue);
            string agent = GetText(cbAgent.Text);
            Guid sellerUserId = GetGuid(cbSeller.SelectedValue);
            string seller = GetText(cbSeller.Text);
            int? contractType = GetNullableInt(ddlContractType.SelectedValue);
            string address1 = GetText(txtPropertyAddress1.Text);
            string address2 = GetText(txtPropertyAddress2.Text);
            string city = GetText(txtPropertyCity.Text);
            string state = GetText(txtPropertyState.Text);
            string zip = GetText(txtPropertyZip.Text);
            decimal? originalPrice = GetNullableDecimal(txtOriginalAskingPrice.Text);
            decimal? currentprice = GetNullableDecimal(txtCurrentAskingPrice.Text);
            decimal? closingprice = GetNullableDecimal(txtClosingPrice.Text);
            int? statusId = GetNullableInt(ddlStatus.SelectedValue);
            decimal?  commission = GetNullableDecimal(txtCommission.Text);
            DateTime? escroActualDate = GetDate(txtEscroActualDate.Text);
            DateTime? estmatedEscroDate = GetDate(txtEstimateEscroDate.Text);
            DateTime? statusDate = GetDate(txtStatusDate.Text);

            if (string.IsNullOrEmpty(mFileNumber))
                log.NewBrokerLog(fileNum, contractType, contRecDate, contExpDate, address1, address2, city, state, zip, originalPrice, currentprice, closingprice, seller, sellerUserId, agent, agentUserId, statusId, statusDate, estmatedEscroDate, escroActualDate, commission);
            else
                log.UpdateBrokerLog(fileNum, contractType, contRecDate, contExpDate, address1, address2, city, state, zip, originalPrice, currentprice, closingprice, seller, sellerUserId, agent, agentUserId, statusId, statusDate, estmatedEscroDate, escroActualDate, commission);
            Response.Redirect("ViewBrokerLog.aspx", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBrokerLog.aspx", true);
        }

    }
}