<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detailed_view.aspx.cs" Inherits="OnTask.detailed_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h3>
        Broker Detail View</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Active Agents</p>
    <p>
        Search Agents
        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sqlActiveAgents" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="MLSId" HeaderText="MLSId" SortExpression="MLSId" />
                <asp:BoundField DataField="Agent_FName" HeaderText="First Name" SortExpression="Agent_FName" />
                <asp:BoundField DataField="Agent_LName" HeaderText="Last Name" SortExpression="Agent_LName" />
                <asp:BoundField DataField="License_Num" HeaderText="License #" SortExpression="License_Num" />
                <asp:BoundField DataField="License_Exp" HeaderText="License Exp" SortExpression="License_Exp" DataFormatString="{0:MM/dd/yyyy}" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlActiveAgents" runat="server" ConnectionString="<%$ ConnectionStrings:OTBS %>" SelectCommand="SELECT MLSId, Agent_FName, Agent_LName, License_Num, License_Exp, Acct_Status FROM dbo.Agent_Log WHERE (Acct_Status = 1) AND (Agent_FName LIKE '%' + @Agent_FName + '%') OR (Acct_Status = 1) AND (Agent_LName LIKE '%' + @Agent_LName + '%') OR (Acct_Status = 1) AND (MLSId LIKE '%' + @MLSId + '%') OR (Acct_Status = @Acct_Status) AND (Agent_FName + ' ' + Agent_LName LIKE '%' + @Name + '%') OR (Acct_Status = @Acct_Status) and (1 = 1)">
            <SelectParameters>
                <asp:Parameter DefaultValue="false" Name="Acct_Status" Type="Boolean" />
                <asp:ControlParameter ControlID="TextBox1" Name="Agent_FName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox1" Name="Agent_LName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox1" Name="MLSId" PropertyName="Text" Type="String" />
                 <asp:ControlParameter ControlID="TextBox1" Name="Name" PropertyName="Text" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
