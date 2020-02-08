<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewSales.aspx.cs" Inherits="ShoppingCart.ViewSales" %>

<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin:0 auto;width:978px;margin-bottom:40px;">
        <asp:GridView ID="gvSales" runat="server" CssClass="gridView" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Vertical" Width="100%"
            AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" CssClass="cartHeader" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
            <Columns>
                <asp:BoundField HeaderText="caid" DataField="caid"  HeaderStyle-CssClass="displayNone" ItemStyle-CssClass="displayNone caidClass" />
                <asp:BoundField HeaderText="User" DataField="uname" HeaderStyle-Width="90" />
                <asp:BoundField HeaderText="Product Name" DataField="pname" />
                <asp:TemplateField HeaderText="Product Image">
                    <ItemTemplate>
                        <asp:Image ID="imgProduct" style="max-width:200px;max-height:200px" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Brand" DataField="pbrand" />
                <asp:TemplateField HeaderText="Total Price (Rs.)">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" CssClass="pprice" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Quantity" DataField="quantity" />
                <asp:BoundField HeaderText="Date" DataField="cadate" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblMsg" CssClass="lbl" Text="No products added to cart yet." runat="server"></asp:Label>
    </div>
</asp:Content>