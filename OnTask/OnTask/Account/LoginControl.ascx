<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="OnTask.Account.LoginControl" %>
<asp:LoginView runat="server" ID="LoginView1" ViewStateMode="Disabled">
                        
                        <AnonymousTemplate>
                            <ul>
                                <%--<li><a id="registerLink" runat="server" href="~/Account/Register">Register</a></li>--%>
                                <%--<li><a id="loginLink" runat="server" href="~/Account/Login">Log in</a></li>--%>
                            </ul>
                        </AnonymousTemplate>
                        <LoggedInTemplate>
                            <p>
                                Hello, <a runat="server" class="username" href="~/Secure/Options.aspx" title="Manage your account">
                                    <asp:LoginName runat="server" CssClass="username" /></a>!
                                <asp:LoginStatus runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/Default.aspx" />
                            </p>
                        </LoggedInTemplate>
                    </asp:LoginView>
                    <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" VisibleWhenLoggedIn="False" Height="108px" Width="420px" style="margin-right: 0px">
                        <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset style="width: 983px">
                    <legend>Log in Form</legend>
                    <ol>
                        <li style="width: 792px">
                            <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
                            <asp:TextBox ID="UserName" runat="server" OnTextChanged="UserName_TextChanged" />
                            <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                            <asp:TextBox ID="Password" runat="server" TextMode="Password" />
                            <br />
                        </li>
                    </ol>
                    <ol>
                        <li style="width: 892px">
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                            &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." />
                        </li>
                    </ol>
                    <asp:Button runat="server" CommandName="Login" Text="Log in"  />
                </fieldset>
            </LayoutTemplate>
                        
                    </asp:Login>