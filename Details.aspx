<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="BW4.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class="row">
            <div class="col">
                <asp:Image ID="imgProduct" runat="server" />
            </div>
            <div class="col">
                <asp:Label ID="lblCategory" runat="server" />
                <br />
                <asp:Label ID="lblBrand" runat="server" />
                <asp:Label ID="lblTitle" runat="server" />
                <br />
                <asp:Label ID="lblPrice" runat="server" />
                <br />
                <asp:Label ID="lblDescription" runat="server" />
                <br />
                <asp:TextBox ID="txtQuantity" runat="server" Text="1" />
                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click" />
            </div>
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
