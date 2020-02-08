<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="Collections.aspx.cs" Inherits="ShoppingCart.Collection" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:964px;margin:0 auto;">
        <div id="products">
            <h2 id="catName" runat="server">
                <asp:Label ID="lblCatName" runat="server" style="color:#fff;" Text=""></asp:Label>
                <span class="title-bottom">&nbsp;</span>
            </h2>
            <div style="padding-bottom:20px;">
                <asp:Label ID="lblNoProducts" runat="server" style="color:#d0d0d0;font-size:16px;" Text="Sorry.. No Products in this collection yet."></asp:Label>
            </div>
            <asp:ListView ID="dlProducts" CellPadding="0" CellSpacing="0" RepeatDirection="Vertical" 
                ShowHeader="false" runat="server" OnItemDataBound="dlProducts_ItemDataBound">
                <ItemTemplate>
                    <div class="product last">
                        <asp:HyperLink ID="hyProducts" runat="server">
                            <asp:HiddenField ID="hdnPid" runat="server" Value='<%# Eval("pid") %>'></asp:HiddenField>
						    <span class="title">
                                <asp:Label ID="lblProdName" runat="server" Text='<%# Eval("pname") %>'></asp:Label>
                            </span>
                            <asp:Image ID="prodImg" runat="server" ImageUrl='<%#Eval("pimage")%>' style="max-width:150px;max-height:150px;" />
						    <span class="price">
                                <span>Rs.</span>
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("pprice") %>'></asp:Label>
                            </span>
					    </asp:HyperLink>
				    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <style type="text/css">
        #footer
        {
            float:left;
            padding-bottom:10px;
            width:100%;
        }
    </style>
</asp:Content>
