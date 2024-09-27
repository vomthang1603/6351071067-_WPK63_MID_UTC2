<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultPageMaster.Master" AutoEventWireup="true" CodeBehind="CategoryDetails.aspx.cs" Inherits="de1.CategoryDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<body>
    <form id="form1" >
        <div>
            <asp:ListView ID="ListViewBeverages" runat="server" OnPagePropertiesChanging="ListViewBeverages_PagePropertiesChanging">
                <LayoutTemplate>
                    <div class="beverage-list">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    </div>
                    <asp:DataPager ID="DataPagerBeverages" runat="server" PageSize="5">
                        <Fields>
                            <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true" />
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="beverage-item">
                       <img src='<%# ResolveUrl("~/images/Beverages/" + Eval("ImageFilePath")) %>' alt='<%# Eval("Name") %>' width="100" height="100" />
                        
                        <h4><%# Eval("Name") %></h4>
                        <p><%# Eval("Description") %></p>
                        <p>Price: <%# Eval("Price", "{0:C}") %></p>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </form>


</asp:Content>