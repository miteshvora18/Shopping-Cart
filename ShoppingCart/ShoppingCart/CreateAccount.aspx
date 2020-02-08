<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="CreateAccount.aspx.cs" Inherits="ShoppingCart.CreateAccount" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="paddingFooter">
        <table cellpadding="0" cellspacing="10" border="0" width="978px" style="margin:0 auto;">
            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="lblName" runat="server" CssClass="lbl" Text="Enter name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="lblGender" runat="server" CssClass="lbl" Text="Select Gender"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlGender" CssClass="ddl" runat="server">
                        <asp:ListItem Text="Male"></asp:ListItem>
                        <asp:ListItem Text="Female"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
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
                <td>
                    <asp:Label ID="lblConfirmPass" runat="server" CssClass="lbl" Text="Confirm Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtConfirmPass" TextMode="Password" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAddress" runat="server" CssClass="lbl" Text="Enter Address"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" style="max-height:100px;min-height:100px;max-width:200px;min-width:200px;" TextMode="MultiLine" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" CssClass="lbl" Text="Enter Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Sign Up" CssClass="btn" 
                        style="margin-left: 105px;" onclick="btnSubmit_Click" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <span style="font-size:20px;color:#fff;"><a href="Login.aspx">Sign In</a></span>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>