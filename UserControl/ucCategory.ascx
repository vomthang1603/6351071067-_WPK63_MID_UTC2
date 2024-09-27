<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCategory.ascx.cs" Inherits="de1.UserControl.ucCategory" %>
<h2>Beverage Category Available</h2>
<asp:DataList ID="DataList1" runat="server" DataKeyField="CatID" DataSourceID="EntityDataSource1">
    <ItemTemplate>
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("CatName") + "(" + Eval("Beverages.count") + ")" %>' NavigateUrl='<%# "~/Category.aspx?CatID=" + Eval("CatID") %>'></asp:HyperLink>
        </div>

    </ItemTemplate>
</asp:DataList>
<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=QLDoUongEntities" DefaultContainerName="QLDoUongEntities" EnableFlattening="False" EntitySetName="Categories" Include="Beverages">
</asp:EntityDataSource>



