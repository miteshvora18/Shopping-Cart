<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="true" CodeBehind="Cart.aspx.cs" MasterPageFile="~/Main.Master" Inherits="ShoppingCart.Cart" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin:0 auto;width:978px;">
        <asp:GridView ID="gvCart" runat="server" CssClass="gridView" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Vertical" Width="100%"
            AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="gvCart_RowCommand">
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
                <asp:BoundField HeaderText="Category Name" DataField="cname" />
                <asp:BoundField HeaderText="Product Name" DataField="pname" />
                <asp:TemplateField HeaderText="Product Image">
                    <ItemTemplate>
                        <asp:Image ID="imgProduct" style="max-width:200px;max-height:200px" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price (Rs.)">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" CssClass="pprice" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Quantity" DataField="pquantity" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnRemove" CommandName="Remove" CommandArgument='<%#Eval("caid") %>' runat="server" Text="Remove" CssClass="btn" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:HiddenField ID="hdnPrice" runat="server" />
        <asp:HiddenField ID="hdnCaid" runat="server" />
        <asp:Label ID="lblMsg" CssClass="lbl" Text="No products added to cart yet." runat="server"></asp:Label>
        <div style="width:100%;margin:20px auto;">
            <asp:Button ID="btnCheckout" runat="server" style="width:100%;height:40px;" 
                Text="Checkout" CssClass="btn" onclick="btnCheckout_Click" />
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var price = 0;
            $(".pprice").each(function () {
                price = price + parseInt($(this).text());
            });
            $("#ContentPlaceHolder1_hdnPrice").val(price);

            var caid = "";
            $(".caidClass").each(function () {
                if (caid != "") {
                    caid = caid + "," + $(this).text();
                }
                else {
                    caid = $(this).text();
                }
            });
            $("#ContentPlaceHolder1_hdnCaid").val(caid);
        });
    </script>
</asp:Content>
