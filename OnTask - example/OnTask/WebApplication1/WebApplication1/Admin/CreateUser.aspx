<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="CreateUser.aspx.cs" Inherits="WebApplication1.Admin.CreateUser" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
          
            <div style="display: inline-block; width: 500px; vertical-align: top;">
                <table style="font-family: Verdana; font-size: 100%;">

                    <tr>
                        <td align="right">
                            <asp:HiddenField runat="server" ID="hdnUserId" />
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="txtFirstName">First Name:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required." ToolTip="First Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label2" runat="server" AssociatedControlID="txtLastName">Last Name:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required." ToolTip="Last Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="Username">User Name:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Username" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="Username" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                       <tr>
                        <td align="right">
                            <asp:Label ID="Label18" runat="server">User Role:</asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlRoles" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                   
                   
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label3" runat="server">Date of Birth (mm/dd/yyyy):</asp:Label>
                        </td>
                        <td>
                           <asp:TextBox ID="txtDateOfBirth" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label4" runat="server">Hire Date (mm/dd/yyyy):</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtHireDate" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label5" runat="server">License Expiration Date (mm/dd/yyyy):</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLicExpDate" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                      <tr>
                        <td align="right">
                            <asp:Label ID="Label17" runat="server">MLS ID:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMLSID" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                </table>

            </div>
            <div style="display: inline-block; width: 500px; vertical-align: top;">
                <table style="font-family: Verdana; font-size: 100%; vertical-align: top;">
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label9" runat="server">Address 1:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label10" runat="server">Address 2:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label11" runat="server">City:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label12" runat="server">State:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label13" runat="server">Zip Code:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label6" runat="server">Office Phone:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOfficePhone" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label7" runat="server">Mobile Phone:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMobilePhone" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label8" runat="server">Fax Number:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFaxNumber" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td align="right">
                            <asp:Label ID="Label16" runat="server">Commission Plan:</asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlCommissionPlan" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label14" runat="server">Provider:</asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlProvider" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label15" runat="server">ALM Code:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtALMCode" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                   
                  

                </table>

            </div>
            <div>
                 <table style="font-family: Verdana; font-size: 100%;">
                      <tr>
                        <td align="center" colspan="2" style="color: Red;" class="auto-style1">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="CreateUserWizard1" />
                         
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2" >
                            <asp:Button runat="server" ID="CreateAccountButton" Text="" OnClick="btnCreateUser_Click" /> 
                         </td>
                    </tr>
                      <tr>
                        <td align="left" colspan="2" style="color:red;">
                           <asp:Label runat="server" ID="CreateAccountResults" ></asp:Label>
                         </td>
                    </tr>
                  
                </table>
            </div>
       
        </div>
    </form>
</body>
</html>
