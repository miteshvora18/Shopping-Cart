<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="ShoppingCart.ViewP" %>

<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <center>        
        <table cellpadding="0" cellspacing="10" border="0" width="978px" 
            style="margin:0 auto; height: 123px;">
            <tr >
                <td colspan="2" style=" height:40%; padding-bottom:20px; " class="style2">
                    <asp:Label ID="lblUsername" runat="server" CssClass="lbl" 
                        Text="Product List" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>

            <tr >
                <td colspan="2" style=" height:40%; margin-bottom:20px; " class="style1">
                    <asp:GridView ID="GridView1" runat="server" CssClass="gridView" BackColor="White" 
                        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        ForeColor="Black" GridLines="Vertical"
                        AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                        <Columns>
                            <asp:BoundField HeaderText="Category Name" DataField="cname" />
                            <asp:BoundField HeaderText="Product Name" DataField="pname" />
                            <asp:BoundField HeaderText="Brand" DataField="pbrand" />
                            <asp:BoundField HeaderText="Color" DataField="pcolor" HeaderStyle-Width="50" />
                            <asp:BoundField HeaderText="Product Description" DataField="pdesc" />
                            <asp:TemplateField HeaderText="Product Image">
                                <ItemTemplate>
                                    <asp:Image ID="imgProduct" style="max-width:200px;max-height:200px" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField HeaderText="Features" DataField="pfeatures"></asp:BoundField>--%>
                            <asp:BoundField HeaderText="Price (Rs.)" DataField="pprice" />
                            <asp:BoundField HeaderText="Quantity" DataField="pquantity" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>

        </table>
</center>

        
        <br />
        <br />
        <br />
        <br />
        <br />
        
    </div>
    </div>
</asp:Content>