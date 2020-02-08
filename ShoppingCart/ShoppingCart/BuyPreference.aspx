<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyPreference.aspx.cs" Inherits="ShoppingCart.BuyPreference" MasterPageFile="~/Main.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:964px;margin:0 auto;">
        <table cellpadding="0" cellspacing="10" border="0" width="978px" style="margin:0 auto;">
            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="lblCategory" runat="server" CssClass="lbl" Text="Category"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" Height="28px" Width="142px" AutoPostBack="true" 
                        onselectedindexchanged="ddlCategory_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="lblBrand" runat="server" CssClass="lbl" Text="Brand"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlBrand" runat="server" Height="28px" Width="142px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="lblColor" runat="server" CssClass="lbl" Text="Color"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlColor" runat="server" Height="28px" Width="142px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="lblLowerPrice" runat="server" CssClass="lbl" Text="Lower Range"></asp:Label>
                </td>
                <td>
                     <%--<asp:DropDownList ID="ddlLowerPrice" runat="server" Height="28px" Width="142px">
                    </asp:DropDownList>--%>
                    <asp:TextBox ID="txtLowerPrice" runat="server" CssClass="txt" Width="150px" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLowerPrice" Text="*" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="lblHighPrice" runat="server" CssClass="lbl" Text="Higher Range"></asp:Label>
                </td>
                <td>
                    <%-- <asp:DropDownList ID="ddlHighPrice" runat="server" Height="28px" Width="142px">
                    </asp:DropDownList>--%>
                    <asp:TextBox ID="txtHighPrice" runat="server" CssClass="txt" Width="150px" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHighPrice" Text="*" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    
                </td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="BUY FOR ME" CssClass="btn" 
                        onclick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        function allowOnlyNumber(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
</asp:Content>