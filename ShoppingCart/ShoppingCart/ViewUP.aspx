<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewUP.aspx.cs" Inherits="ShoppingCart.ViewUP" %>

<asp:Content ID="body" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

<center>        
        <table cellpadding="0" cellspacing="10" border="0" width="978px" 
            style="margin:0 auto; height: 123px;">
            <tr >
                <td colspan="2" style=" height:40%; margin-bottom:20px; " class="style2">
                    <asp:Label ID="lblUsername" runat="server" CssClass="lbl" 
                        Text="User Preference" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>

            <tr >
                <td colspan="2" style=" height:40%; margin-bottom:20px; " class="style1">
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        ForeColor="Black" GridLines="Vertical" Height="174px" Width="251px">
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
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            width: 20%;
            height: 204px;
        }
        .style2
        {
            height: 204px;
        }
    </style>
</asp:Content>
