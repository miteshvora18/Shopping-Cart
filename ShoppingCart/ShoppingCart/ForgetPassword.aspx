<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="ShoppingCart.Forgetpass" %>


<asp:Content ID="body" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
    
    <div class="paddingFooter">
        <table cellpadding="0" cellspacing="10" border="0" width="978px" style="margin:0 auto;">
            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="lblUsername" runat="server" CssClass="lbl" Text="Username"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPass" runat="server" CssClass="lbl" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Get Password" CssClass="btn" 
                        style="margin-left: 105px;" onclick="btnSubmit_Click" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    
    </div>
</asp:Content>
