<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddP.aspx.cs" Inherits="ShoppingCart.AddP" %>


<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        
        <br />
        <table cellpadding="0" cellspacing="10" border="0" width="978px" style="margin:0 auto;">
            <tr style="display:none;">
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="lblUsername" runat="server" CssClass="lbl" Text="Product Id"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="Pid" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="lblPass" runat="server" CssClass="lbl" Text="Category "></asp:Label>
                </td>
                <td class="style1">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="28px" Width="142px">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="Label1" runat="server" CssClass="lbl" Text="Product Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="lblProductColor" runat="server" CssClass="lbl" Text="Colour"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProductColor" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:20%;margin-bottom:20px;">
                    <asp:Label ID="lblBrand" runat="server" CssClass="lbl" Text="Brand"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBrand" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label2" runat="server" CssClass="lbl" Text="Product Description"></asp:Label>
                </td>
                <td class="style1">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" CssClass="txt"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="style1">
                    <asp:Label ID="Label3" runat="server" CssClass="lbl" Text="Product Price"></asp:Label>
                </td>
                <td class="style1">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="style1">
                    <asp:Label ID="Label4" runat="server" CssClass="lbl" Text="Product Quantity"></asp:Label>
                </td>
                <td class="style1">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="style1">
                    <asp:Label ID="Label5" runat="server" CssClass="lbl" Text="Product Image"></asp:Label>
                </td>
                <td class="style1">
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="25px" Width="201px" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Add" CssClass="btn" 
                        style="margin-left: 105px;" onclick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            height: 40px;
        }
    </style>
</asp:Content>

