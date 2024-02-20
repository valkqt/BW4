<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="BackOffice.aspx.cs" Inherits="BW4.BackOffice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="BackOffice" ContentPlaceHolderID="BackOffice" runat="server">

    <main class="BackOfficeWrapper">
        <div class="BackFlexContainer">
            <div>
                <asp:DropDownList ID="BackDropdown" runat="server">
                </asp:DropDownList>
            </div>
            <div class="BackInputContainer">
                <asp:TextBox ID="ProductId" runat="server" Enabled="false"></asp:TextBox>
                <asp:TextBox ID="ProductTitle" runat="server"></asp:TextBox>
                <asp:TextBox ID="ProductDescription" runat="server"></asp:TextBox>
                <asp:TextBox ID="ProductBrand" runat="server"></asp:TextBox>
                <asp:TextBox ID="ProductCategory" runat="server"></asp:TextBox>
                <asp:TextBox ID="ProductRating" runat="server"></asp:TextBox>
                <asp:TextBox ID="ProductDiscount" runat="server"></asp:TextBox>
                <asp:TextBox ID="ProductStock" runat="server"></asp:TextBox>
                <asp:TextBox ID="ProductThumbnail" runat="server"></asp:TextBox>
                <asp:TextBox ID="ProductImage" runat="server"></asp:TextBox>
                <asp:TextBox ID="ProductPrice" runat="server"></asp:TextBox>
            </div>

        </div>
    </main>
</asp:Content>
