<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detailed_view.aspx.cs" Inherits="OnTaskBare.detailed_view" %>

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
    <title>Detailed View</title>
    </head>
 <body>
    <div id="wrapper">
    <form id="form1" runat="server">
         
    <asp:LoginView runat="server" ID="LoginView1" ViewStateMode="Disabled">
                        
                        <LoggedInTemplate>
                            <div id="header">
                              <br/>
                                  <p>
                                Hello, <a id="A1" runat="server" class="username" title="Manage your account">
                                    <asp:LoginName ID="LoginName1" runat="server" CssClass="username" /></a>!
                                <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/Default.aspx" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Arizona Premier Realty

                            </p>
                           </div>
                        </LoggedInTemplate>
                    </asp:LoginView>
    <div id="content2">
        <br />
        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Dashboard.aspx" runat="server">Dashboard</asp:HyperLink>
         <p>
        Active Agents</p>
    <p class="pure-form pure-button-primary pure-button">
        Search Agents
        <asp:TextBox ID="TextBox1" runat="server" Text="" AutoPostBack="False" CssClass="pure-form pure-button"></asp:TextBox>
    &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnBack" runat="server" Text="OK" OnClick="btnBack_Click" />
    </p>
    <%--<p style="width: 333px">--%>
           <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="False" AllowSorting="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="MLSId" HeaderText="MLSId" SortExpression="MLSId" />
                <asp:BoundField DataField="Agent_FName" HeaderText="First Name" SortExpression="Agent_FName" />
                <asp:BoundField DataField="Agent_LName" HeaderText="Last Name" SortExpression="Agent_LName" />
                <asp:BoundField DataField="License_Num" HeaderText="License #" SortExpression="License_Num" />
                <asp:BoundField DataField="License_Exp" HeaderText="License Exp" SortExpression="License_Exp" DataFormatString="{0:MM/dd/yyyy}" />
            </Columns>
        </asp:GridView>--%>
        <br/>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="pure-table pure-table-bordered pure-table-striped" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound1" OnPageIndexChanging="GridView1_PageIndexChanging" OnSorting="GridView1_Sorting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" >
            <Columns>
                <asp:BoundField DataField="MLSId" HeaderText="MLSId" SortExpression="MLSId" />
                <asp:BoundField DataField="Agent_FName" HeaderText="First Name" SortExpression="Agent_FName" />
                <asp:BoundField DataField="Agent_LName" HeaderText="Last Name" SortExpression="Agent_LName" />
                <asp:BoundField DataField="License_Num" HeaderText="License #" SortExpression="License_Num" />
                <asp:TemplateField HeaderText="License Exp" SortExpression="License_Exp">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("License_Exp") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("License_Exp", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        
        

       <%-- <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sqlActiveAgents" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="MLSId" HeaderText="MLSId" SortExpression="MLSId" />
                <asp:BoundField DataField="Agent_FName" HeaderText="First Name" SortExpression="Agent_FName" />
                <asp:BoundField DataField="Agent_LName" HeaderText="Last Name" SortExpression="Agent_LName" />
                <asp:BoundField DataField="License_Num" HeaderText="License #" SortExpression="License_Num" />
                <asp:BoundField DataField="License_Exp" HeaderText="License Exp" SortExpression="License_Exp" DataFormatString="{0:MM/dd/yyyy}" />
            </Columns>
        </asp:GridView>--%>

        <asp:Label ID="lblStatus" runat="server" Text="" CssClass="pure-table pure-table-striped"></asp:Label>
        <asp:SqlDataSource ID="sqlActiveAgents" runat="server"  ConnectionString="<%$ ConnectionStrings:OTBS %>" SelectCommand="SELECT DISTINCT MLSId, Agent_FName, Agent_LName, License_Num, License_Exp, Acct_Status FROM dbo.Agent_Log WHERE (Acct_Status = 1) AND (Agent_FName LIKE '%' + @Agent_FName + '%') OR (Acct_Status = 1) AND (Agent_LName LIKE '%' + @Agent_LName + '%') OR (Acct_Status = 1) AND (MLSId LIKE '%' + @MLSId + '%') OR (Acct_Status = 1) AND (Agent_FName + ' ' + Agent_LName LIKE '%' + @Name + '%') ">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Agent_FName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox1" Name="Agent_LName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox1" Name="MLSId" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="TextBox1" Name="Name" PropertyName="Text" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>
   <%-- </p>--%>
        <p> &nbsp;</p>
    
    </div>
    </form>
        
</div>
</body>
</html>
