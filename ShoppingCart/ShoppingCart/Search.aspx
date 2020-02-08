<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="ShoppingCart.Search" MasterPageFile="~/Main.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:964px;margin:0 auto;">
        <div id="msg" runat="server" style="margin-bottom:20px">
            <asp:Label ID="lblMsg" runat="server" CssClass="lbl" Text=""></asp:Label>
        </div>
        <div id="products">
            <table width="100%" cellpadding="0" cellspacing="0" class="paddingFooter" id="prd" runat="server">
                <tr>
                    <td style="width:350px;">
                        <asp:Image ID="Image1" runat="server" style="max-height:300px;max-width:300px;" />
                    </td>
                    <td>
                        <div style="padding-bottom:10px;">
                            <asp:Label ID="Label1" runat="server" CssClass="lbl" Text="Label"></asp:Label>
                        </div>
                        <div class="padTop5">
                            <asp:Label ID="Label5" runat="server" Text="Rs  :" CssClass="lblDetail"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text="Label" CssClass="lblDetail"></asp:Label><br />
                            <asp:Label ID="lblProductColor" runat="server" Text="" CssClass="lblDetail"></asp:Label><br />
                            <asp:Label ID="lblBrand" runat="server" Text="" CssClass="lblDetail"></asp:Label>
                        </div>
                        <div class="padTop5">
                            <asp:Label ID="Label2" runat="server" Text="Label" CssClass="lblDetail"></asp:Label>
                        </div>
                        <div class="padTop5">
                            <asp:Label ID="Label6" runat="server" Text="Quantity Left  :" CssClass="lblDetail"></asp:Label>
                            <asp:Label ID="Label4" runat="server" Text="Label" CssClass="lblDetail"></asp:Label>
                        </div>
                        <div class="padTop5">
                            <asp:DropDownList ID="ddlSelectQuantity" Width="50" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div style="padding-top:10px;">
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn" 
                                onclick="btnAddToCart_Click" />
                        </div>
                        <div>
                            <asp:Label ID="lblAddedToCart" runat="server" CssClass="lbl" Text="This product has already been added to cart."></asp:Label>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <style type="text/css">
    #products .product
    {
        float:none;
    }
    </style>
</asp:Content>