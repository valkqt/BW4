<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="BW4.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-3">

        <div class="row">
            <div class="col">
                <asp:Image ID="imgProduct" runat="server" />
            </div>
            <div class="col d-flex flex-column justify-content-center">
                <asp:Label ID="lblCategory" runat="server" />
               

                <div>
                    <asp:Label ID="lblBrand" runat="server" class="fs-3 fw-bold"/>
                    <asp:Label ID="lblTitle" runat="server" class="fs-3 fw-bold"/>
                </div>

                <asp:Label ID="lblPrice" runat="server" CssClass="fs-5 fw-bold" />
                <asp:Label ID="lblDescription" runat="server" />

                <div class="d-flex mt-2">
                    <input type="number" id="txtQuantity" runat="server" value="1" size="5" class="me-3"/>
                    <button type="button" id="btnAddToCart" runat="server" class="btn btn-primary" onclick="btnAddToCart_Click">Add to Cart</button>
                </div>

            </div>
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
