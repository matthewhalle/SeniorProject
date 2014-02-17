<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OnTask.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <h3>Sales By Employee</h3>
     <p>&nbsp;</p>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="odsSalesByEmployee" BackColor="239, 238, 239" BorderlineColor="239, 238, 239">
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
    </asp:Chart>
   
    <asp:SqlDataSource ID="odsSalesByEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:OTBS %>" SelectCommand="SELECT Plan_Desc AS [Plan Type], Count(*) AS Total FROM  mhalle.V_Active_Agent_List GROUP BY Plan_Desc"></asp:SqlDataSource>
      
    &nbsp;<h3>Active Agents</h3>
    <asp:Label ID="lblActiveAgents" runat="server" Text=""></asp:Label><asp:HyperLink ID="HyperLink1" NavigateUrl="detailed_view.aspx" runat="server">Details</asp:HyperLink>
       <%-- <asp:GridView ID="grdViewSalesByYear" runat="server" AutoGenerateColumns="False" 
            DataSourceID="odsSalesByYear" EnableModelValidation="True" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="MLSId" HeaderText="MLSId" SortExpression="MLSId" />
                <asp:BoundField DataField="Agent_FName" HeaderText="Agent_FName" SortExpression="Agent_FName" />
                <asp:BoundField DataField="Agent_LName" HeaderText="Agent_LName" SortExpression="Agent_LName" />
                <asp:BoundField DataField="License_Num" HeaderText="License_Num" SortExpression="License_Num" />
            </Columns>
        </asp:GridView>--%>
    <asp:SqlDataSource ID="odsSalesByYear" runat="server" ConnectionString="<%$ ConnectionStrings:OTBS %>" SelectCommand="SELECT COUNT(*) AS [Total] FROM dbo.Agent_Log where Acct_Status=1">
        </asp:SqlDataSource>
    
 

        <h3>Upcoming Expiring Agents</h3>
        <asp:GridView ID="grdvwSalesByCategory" runat="server" AutoGenerateColumns="False" 
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
        <br />
       <h3>Properties to close</h3>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="File_Num" DataSourceID="Properties">
            <Columns>
                <asp:BoundField DataField="File_Num" HeaderText="File #" ReadOnly="True" SortExpression="File_Num" />
                <asp:BoundField DataField="Trans_Type" HeaderText="Trans_Type" SortExpression="Trans_Type" />
                <asp:BoundField DataField="Agent_FName" HeaderText="First Name" SortExpression="Agent_FName" />
                <asp:BoundField DataField="Agent_LName" HeaderText="Last Name" SortExpression="Agent_LName" />
                <asp:BoundField DataField="Property_Address" HeaderText="Property Address" SortExpression="Property_Address" />
                <asp:BoundField DataField="EST_COE_Date" HeaderText="EST_COE_Date" SortExpression="EST_COE_Date" DataFormatString="{0:MM/dd/yyyy}" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Properties" runat="server" ConnectionString="<%$ ConnectionStrings:OTBS %>" SelectCommand="SELECT File_Num, Trans_Type, Agent_FName, Agent_LName, Property_Address, EST_COE_Date FROM V_Broker_Log WHERE (EST_COE_Date &lt; GETDATE() - 1)"></asp:SqlDataSource>
<br />
</asp:Content>
