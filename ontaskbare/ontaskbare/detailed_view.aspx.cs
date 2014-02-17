using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnTaskBare
{
    public partial class detailed_view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                search();
                ViewState["PreviousPage"] = Request.UrlReferrer;//Saves the Previous page url in ViewState
            }

        }

        public void search()
        {
            try
            {
                GridView1.DataSource = sqlActiveAgents;
                GridView1.DataBind();

            }
            catch (Exception)
            {

                lblStatus.Text = "";

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            search();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (ViewState["PreviousPage"] != null)	//Check if the ViewState 
            //contains Previous page URL
            {
                Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to 
                //Previous page by retrieving the PreviousPage Url from ViewState.
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
            //search();
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
        }

        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string dateText = ((Label)e.Row.FindControl("Label1")).Text;

                if (!string.IsNullOrEmpty(dateText))
                {
                    DateTime dateValue = DateTime.ParseExact(dateText, "MM/dd/yyyy", null);

                    if (dateValue <= DateTime.Now.AddDays(15))
                    {
                        e.Row.Cells[4].BackColor = Color.Red;
                    }
                    else if (dateValue >= DateTime.Now.AddDays(16) && dateValue <= DateTime.Now.AddDays(30))
                    {
                        e.Row.Cells[4].BackColor = Color.Yellow;
                    }
                    else
                    {
                        e.Row.Cells[4].BackColor = Color.LightBlue;
                    }
                }
                else
                {
                    e.Row.Cells[4].BackColor = Color.LightBlue;
                }
            }




           
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataView dv = (DataView)sqlActiveAgents.Select(DataSourceSelectArguments.Empty);
            DataTable dt = new DataTable();
            dt = dv.ToTable();

            if (dt != null)
            {
                
                dv.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);
                GridView1.DataSource = dv;
                GridView1.DataBind();
            }

           
         }

        private string ConvertSortDirectionToSql(SortDirection sortDirection)
        {
            string m_SortDirection = String.Empty;

            switch (sortDirection)
            {
                case SortDirection.Ascending:
                    m_SortDirection = "ASC";
                    break;

                case SortDirection.Descending:
                    m_SortDirection = "DESC";
                    break;
            }

            return m_SortDirection;
        }
        protected SortDirection GetSortDirection(SortDirection column)
        {
            SortDirection nextDir = SortDirection.Ascending; // Default next sort expression behaviour.
            if (ViewState["sort"] != null && ViewState["sort"].ToString() == column.ToString())
            {   // Exists... DESC.
                nextDir = SortDirection.Descending;
                ViewState["sort"] = null;
            }
            else
            {   // Doesn't exists, set ViewState.
                ViewState["sort"] = column;
            }
            return nextDir;
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

    }
}