<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="usListBeverages.ascx.cs" Inherits="de1.UserControl.usListBeverages" %>
<asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="EntityDataSource1">
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
<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=QLDoUongEntities" DefaultContainerName="QLDoUongEntities" EnableFlattening="False" EntitySetName="Beverages" Where="it.Category.CatID=@CategoryID">
    <WhereParameters>
        <asp:QueryStringParameter Name="CategoryID" QueryStringField="CatID" Type="Int32" />
    </WhereParameters>
</asp:EntityDataSource>


