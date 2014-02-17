<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnTask._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>&nbsp;</h2>
                <h1>Front page upon non logged in members will see</h1>
            </hgroup>
            <p>
                leave this page to design implementaion</p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>We suggest the following:</h3>
    <ol class="round">
       <li class="one">
            <h5>Getting Started</h5>

            Let Ontask Buiness Solutions offer latest uptoday technologies to bring your organization farther then the rest. <a href="/About.aspx">Learn more…</a>
        </li>
        <li class="two">
            <h5>Add value</h5>
            OnTask Business Solutions makes it easy to retrieve and update business analytics.
            <a href="/About.aspx">Learn more…</a>
        </li>
        <li class="three">
            <h5>Increase Profitability</h5>
            With increased analytics agent impact is monitored and realized in hours not days.&nbsp;
            <a href="/About.aspx">Learn more…</a>
        </li>
    </ol>
</asp:Content>
