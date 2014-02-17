<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OnTaskBare.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.3.0/forms-min.css"/>   
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.3.0/forms-nr-min.css"/> 
<link href="css/main-grid-old-ie.css" rel="stylesheet" />
<link href="css/main-grid.css" rel="stylesheet" />
<link href="css/table.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
 <link href="css/main.css" rel="stylesheet" />    
    <title>Dashboard</title>
    </head>
<body>
     <div id="wrapper">
         <form id="form1" runat="server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LoginView runat="server" ID="LoginView1" ViewStateMode="Disabled" OnViewChanged="LoginView1_ViewChanged">
                        
                        <AnonymousTemplate>
                            <ul>
                                <%--<li><a id="registerLink" runat="server" href="~/Account/Register">Register</a></li>--%>
                                <%--<li><a id="loginLink" runat="server" href="~/Account/Login">Log in</a></li>--%>
                            </ul>
                        </AnonymousTemplate>
      
                           <LoggedInTemplate>
                             <div id="header">
                                <p>
                                Hello, <a id="A1" runat="server" class="username" title="Manage your account">
                                    <asp:LoginName ID="LoginName1" runat="server" CssClass="username" /></a>!
                                <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/Default.aspx" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Arizona Premier Realty

                            </p>
                           </div>
                          </LoggedInTemplate>
                         </asp:LoginView>
                      
  
 
  <%--  <asp:Chart ID="Chart1" runat="server" DataSourceID="odsSalesByEmployee" BackColor="239, 238, 239" BorderlineColor="239, 238, 239">
        <Series>
            <asp:Series Name="Series1" ChartType="Pie" XValueMember="Plan Type" YValueMembers="Total" IsValueShownAsLabel="true"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
        <Legends>
                <asp:Legend>
                </asp:Legend>
            </Legends>
    </asp:Chart>--%>
  <div id="content2">           
<table>  
    <tr>
    <td>
        <h3>Properties to close</h3>
         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="File_Num" DataSourceID="Properties" CssClass="pure-table pure-table-bordered pure-table-striped">
            <Columns>
                <asp:BoundField DataField="File_Num" HeaderText="File #" ReadOnly="True" SortExpression="File_Num" />
                <asp:BoundField DataField="Trans_Type" HeaderText="Transaction Type" SortExpression="Trans_Type" />
                <asp:BoundField DataField="Agent_FName" HeaderText="First Name" SortExpression="Agent_FName" />
                <asp:BoundField DataField="Agent_LName" HeaderText="Last Name" SortExpression="Agent_LName" />
                <asp:BoundField DataField="Property_Address" HeaderText="Property Address" SortExpression="Property_Address" />
                <asp:BoundField DataField="EST_COE_Date" HeaderText="EST COE Date" SortExpression="EST_COE_Date" DataFormatString="{0:MM/dd/yyyy}" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Properties" runat="server" ConnectionString="<%$ ConnectionStrings:OTBS %>" SelectCommand="SELECT File_Num, Trans_Type, Agent_FName, Agent_LName, Property_Address, EST_COE_Date FROM V_Broker_Log WHERE (EST_COE_Date &lt; GETDATE() - 1)"></asp:SqlDataSource>
    </td>
        </tr>

</table>
  </div>
        <div id="content2">
        <table>   
        <tr>
        <td>
            <h3>Upcoming Expiring Agents</h3>
        <asp:GridView ID="grdvwSalesByCategory" runat="server" AutoGenerateColumns="False" CssClass="pure-table pure-table-bordered pure-table-striped"
            DataSourceID="odsSalesByCategory" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="grdvwSalesByCategory_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Agent_FName" HeaderText="First Name" 
                    SortExpression="Agent_FName" />
                <asp:BoundField DataField="Agent_LName" HeaderText="Last Name" 
                    SortExpression="Agent_LName" />
                <asp:BoundField DataField="License_Num" HeaderText="License #" SortExpression="License_Num" />
                <asp:BoundField DataField="License_Exp" HeaderText="License Exp Date" SortExpression="License_Exp" DataFormatString="{0:MM/dd/yyyy}" >
                <ControlStyle BorderStyle="Solid" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    <asp:SqlDataSource ID="odsSalesByCategory" runat="server" ConnectionString="<%$ ConnectionStrings:OTBS %>" SelectCommand="SELECT Agent_FName, Agent_LName, License_Num, License_Exp FROM V_Active_Agent_List WHERE (License_Exp &lt; GETDATE() + 15)"></asp:SqlDataSource>
        

            </td>
        </tr>
      </>
    </table>
      </div>              
       <div id="content2">
             <table>
           
           <tr>      
        <td>
      
         <h3>Commission Type</h3>
        <asp:Chart ID="Chart1" runat="server"  DataSourceID="odsSalesByEmployee">
            <Series>
                <asp:Series Name="Series1" ChartType="Pie" XValueMember="Plan Type" YValueMembers="Total" ></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1"  Area3DStyle-Enable3D="true" ></asp:ChartArea>
            </ChartAreas>
            <Legends>  
                <asp:Legend Name="Legend1" BackColor="Transparent" Alignment="Center">
                </asp:Legend>
            </Legends>     
            
        </asp:Chart>
            <asp:SqlDataSource ID="odsSalesByEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:OTBS %>" SelectCommand="SELECT Plan_Desc AS [Plan Type], Count(*) AS Total FROM  mhalle.V_Active_Agent_List GROUP BY Plan_Desc"></asp:SqlDataSource>
      
    <h3>Active Agents <asp:HyperLink ID="HyperLink1" NavigateUrl="detailed_view.aspx" runat="server" Font-Size="Small">Details</asp:HyperLink><asp:Label ID="lblActiveAgents" runat="server" Text=""></asp:Label></h3>&nbsp; 
     
    <asp:SqlDataSource ID="odsSalesByYear" runat="server" ConnectionString="<%$ ConnectionStrings:OTBS %>" SelectCommand="SELECT COUNT(*) AS [Total] FROM dbo.Agent_Log where Acct_Status=1">
        </asp:SqlDataSource>
          

    </td>
    </tr>
    </table>
</div>
</form>

</div>
</body>
</html>
