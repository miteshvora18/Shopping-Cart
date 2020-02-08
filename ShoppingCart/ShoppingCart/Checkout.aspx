<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" MasterPageFile="~/Main.Master" Inherits="ShoppingCart.Checkout" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin:0 auto;width:978px;padding-bottom:20px;">
        <div style="font-size:20px;color:#fff;padding-bottom:20px;">Checkout Process</div>
        <table cellpadding="0" cellspacing="10" width="100%" style="color:#fff;font-size:15px;">
            <tr>
                <td style="width:250px;">
                    <asp:Label ID="lblName" runat="server" Text="Enter Name on Card"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:250px;">
                    <asp:Label ID="lblCardNumber" runat="server" Text="Enter Card Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCardNumber" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:250px;">
                    <asp:Label ID="lblCvvCode" runat="server" Text="Enter CVV Code"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCvvCode" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:200px;">
                    <asp:Label ID="lblExpiryDate" runat="server" Text="Card Expiry Date (mm/yy)"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtExpiryDate" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:200px;">
                    <asp:Label ID="lblAmount" runat="server" Text="Amount (Rs.)"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAmount" ReadOnly="true" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:200px;">
                 
                </td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit" 
                        onclick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
