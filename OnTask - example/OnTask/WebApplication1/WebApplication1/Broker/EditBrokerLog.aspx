<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditBrokerLog.aspx.cs" Inherits="WebApplication1.Broker.EditBrokerLog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .myTable {
            font-family: Calibri;
            font-size: 8pt;
            color: black;
            border: solid 1px #ccc;
            border-collapse: collapse;
        }

            .myTable td {
                border: solid 1px #ccc;
            }

        .header {
            background-color: #ccc;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
         <asp:ScriptManager runat="server" ID="scriptmanager1"></asp:ScriptManager>
   
        <div>

            <table class="myTable" cellpadding="4">
                <tr>

                    <td class="header">File Number</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtFileNumber" /></td>

                    <td class="header">Contract Type</td>
                    <td>
                        <asp:DropDownList runat="server" ID="ddlContractType"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="header">Contract Received</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtContractReceivedDate"></asp:TextBox></td>
                    <td class="header">Contract Expiration</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtContractExpirationDate"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="header">Property Address 1</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtPropertyAddress1"></asp:TextBox></td>
                    <td class="header">Original Asking Price</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtOriginalAskingPrice"></asp:TextBox></td>

                </tr>
                <tr>
                    <td class="header">Property Address 2</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtPropertyAddress2"></asp:TextBox></td>
                    <td class="header">Current Asking Price</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtCurrentAskingPrice"></asp:TextBox></td>

                </tr>
                <tr>
                    <td class="header">Property City</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtPropertyCity"></asp:TextBox></td>
                    <td class="header">Actual Closing Price</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtClosingPrice"></asp:TextBox></td>

                </tr>
                <tr>
                    <td class="header">Property State</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtPropertyState"></asp:TextBox></td>
                    <td class="header">Seller</td>
                    <td>
                        <ajaxToolkit:ComboBox ID="cbSeller" runat="server"></ajaxToolkit:ComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="header">Property Zip</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtPropertyZip"></asp:TextBox></td>

                    <td class="header">Agent</td>
                    <td>
                        <ajaxToolkit:ComboBox ID="cbAgent" runat="server"></ajaxToolkit:ComboBox>
                    </td>
                </tr>
                <tr>
                 <td class="header">Status</td>
                    <td>
                        <asp:DropDownList runat="server" ID="ddlStatus"></asp:DropDownList></td>
                    <td class="header">Status Date</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtStatusDate"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="header">Estimate Close of Escro</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtEstimateEscroDate"></asp:TextBox></td>
                    <td class="header">Actual Close of Escro</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtEscroActualDate"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="header">Total Commission</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtCommission"></asp:TextBox></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr runat="server" id="itemPlaceholder">
                </tr>
                <tr>
                    <td colspan="4"><asp:Button runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" /><asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click"/></td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
