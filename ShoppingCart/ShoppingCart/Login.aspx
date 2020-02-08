<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShoppingCart.Login" MasterPageFile="~/Main.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="paddingFooter">
        <asp:Panel runat="server" DefaultButton="btnSubmit">
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
                    <asp:Label ID="lblPass" runat="server" CssClass="lbl" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Sign In" CssClass="btn" 
                        style="margin-left: 105px;" onclick="btnSubmit_Click" />
                </td>
            </tr>
            <tr>
                <td class="style1"></td>
                <td class="style1">
                    <span style="font-size:20px;color:#fff;"><a href="CreateAccount.aspx">Create an Account</a> 
                    <%--/ <a href="ForgotPassword.aspx">Forgot Password</a></span>&nbsp;--%>
                </td>
            </tr>
        </table>
        </asp:Panel>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
        #lblUser
        {
            display:none;
        }
    </style>
</asp:Content>

