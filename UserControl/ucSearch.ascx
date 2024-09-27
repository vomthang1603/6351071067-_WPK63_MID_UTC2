<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSearch.ascx.cs" Inherits="de1.UserControl.ucSearch" %>

<table style="width: 100%;">
    <tr>
        <td>Name:
            <asp:TextBox ID="txtBeve" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Price:
            <asp:TextBox ID="txtMin" runat="server"></asp:TextBox>
            -<asp:TextBox ID="txtMax" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Search" />
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Search Result:</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

<asp:ListView ID="ListView1" runat="server" DataSourceID="EntityDataSource1">
    <ItemTemplate>
        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' CssClass="product_name"></asp:Label><br />
        <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl='<%# "~/images/Beverages/" + Eval("ImageFilePath")%>' /><br />
        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>' CssClass="product_price"></asp:Label><br />
        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%#"~/Detail.aspx?ID="+Eval("ID") %>' runat="server" CssClass="product_view">View Details</asp:HyperLink><br />
    </ItemTemplate>
    <LayoutTemplate>
        <table runat="server" border="0" style="">
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </table>
        <div style="">
            <asp:DataPager ID="DataPager1" runat="server">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>
</asp:ListView>

<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=QLDoUongEntities" DefaultContainerName="QLDoUongEntities" EnableFlattening="False" EntitySetName="Beverages" Where="it.Name like '%' + @NameBeve + '%' and it.Price &gt;= @PriceMin and it.Price &lt;=@PriceMax">
    <WhereParameters>
        <asp:ControlParameter ControlID="txtBeve" Name="NameBeve" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txtMin" Name="PriceMin" PropertyName="Text" Type="Decimal" />
        <asp:ControlParameter ControlID="txtMax" Name="PriceMax" PropertyName="Text" Type="Decimal" />
    </WhereParameters>
</asp:EntityDataSource>

