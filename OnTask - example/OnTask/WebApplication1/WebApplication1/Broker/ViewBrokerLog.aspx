<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBrokerLog.aspx.cs" Inherits="WebApplication1.Broker.ViewBrokerLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .myTable {font-family:Calibri;font-size:8pt;color:black;border:solid 1px #ccc; border-collapse:collapse;}
        .myTable td {border:solid 1px #ccc;}
        .header {background-color:#ccc;}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView runat="server" ID="lvBrokerLog" OnItemCommand="lvBrokerLog_ItemCommand" ClientIDMode="AutoID">
                <LayoutTemplate>
                    <table class="myTable" cellpadding="4">
                        <tr>
                            <td class="header">&nbsp;</td>
                            <td class="header">File Number</td>
                            <td class="header">Contract Type</td>
                            <td class="header">Contract Received</td>
                            <td class="header">Contract Expiration</td>
                            <td class="header">Poperty Address</td>
                            <td class="header">Property City</td>
                            <td class="header">Property State</td>
                            <td class="header">Property Zip</td>
                            <td class="header">Original Asking Price</td>
                            <td class="header">Current Asking Price</td>
                            <td class="header">Actual Closing Price</td>
                            <td class="header">Seller</td>
                            <td class="header">Agent</td>
                            <td class="header">Status</td>
                            <td class="header">Status Date</td>
                            <td class="header">Estimate Close of Escro</td>
                            <td class="header">Actual Close of Escro</td>
                            <td class="header">Total Commission</td>
                        </tr>
                        <tr runat="server" id="itemPlaceholder">
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                   
                        <tr>
                            <td>
                                <p>
                                    <asp:LinkButton runat="server" ID="lbEdit" Text="Edit" CommandName="edit" CommandArgument='<%#Eval("Listing_Sales_file_Num") %>'>Edit</asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="lbDelete" Text="Delete" CommandName="delete" CommandArgument='<%#Eval("Listing_Sales_file_Num") %>'>Delete</asp:LinkButton>
                                </p>
                            </td>
                            <td><%#Eval("Listing_Sales_file_Num")%></td>
                            <td><%#Eval("ContractTypeDescription")%></td>
                            <td><%#Eval("ContractReceivedDate")%></td>
                            <td><%#Eval("ContractExpirationDate")%></td>
                            <td><%#Eval("PropertyAddress1")%> <%#Eval("PropertyAddress2")%></td>
                            <td><%#Eval("PropertyCity")%></td>
                            <td><%#Eval("PropertyState")%></td>
                            <td><%#Eval("PropertyZip")%></td>
                            <td><%#Eval("OriginalAskingPrice")%></td>
                            <td><%#Eval("CurrentAskingPrice")%></td>
                            <td><%#Eval("ActualClosingPrice")%></td>
                            <td><%#Eval("Seller")%></td>
                            <td><%#Eval("Agent")%></td>
                            <td><%#Eval("StatusDescription")%></td>
                            <td><%#Eval("StatusDate")%></td>
                            <td><%#Eval("EstimatedCloseofEscro")%></td>
                            <td><%#Eval("ActualCloseOfEscro")%></td>
                            <td><%#Eval("TotalCommission")%></td>
                        </tr>
                 
                </ItemTemplate>

            </asp:ListView>
        </div>
    </form>
</body>
</html>
