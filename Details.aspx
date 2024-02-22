<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="BW4.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">

        <div class="row">
            <div class="col-md-6 d-flex justify-content-center">
                <asp:Image ID="imgProduct" runat="server" CssClass="imgDetails" />
            </div>
            <div class="col-md-6 d-flex flex-column justify-content-center">
                <asp:Label ID="lblCategory" runat="server" />
                <div class="mt-2">
                    <asp:Label ID="lblBrand" runat="server" class="fs-3 fw-bold" />
                    <asp:Label ID="lblTitle" runat="server" class="fs-3 fw-bold" />
                </div>
                <div class="d-flex align-items-center mt-1">
                    <asp:Label ID="lblPrice" runat="server" CssClass="me-2 fs-6 text-decoration-line-through" />
                    <asp:Label ID="lblDiscounted" runat="server" CssClass="fs-4 fw-bold" />
                </div>
                <asp:Label ID="lblDescription" runat="server" CssClass="mt-2" />
                <div class="d-flex mt-3">
                    <input type="number" id="txtQuantity" runat="server" value="1" class="me-2 text-center rounded-1 fs-6" style="width: 4em !important;" min="1" />
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-primary me-2" OnClick="btnAddToCart_Click" />
                    <a href="/Home.aspx" class="btn btn-danger">Back to Home</a>
                </div>
            </div>

        </div>

        <div class="container mt-3">
            <div class="d-flex justify-content-center">
                <h3 class="SectionTitle">Related Products</h3>
            </div>
            <div class="d-flex justify-content-center">
                <div class="SectionBorder">
                </div>
            </div>
        </div>

        <div class="row">
            <asp:Repeater ID="RelatedRepeater" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonDetail" CssClass="col" runat="server" OnClick="LinkButtonDetail_Click" CommandArgument='<%# Eval("id") %>'>
                        <div class="col text-center">
                            <img src='<%# Eval("thumbnail") %>' class="HomeImage" />
                            <p class="CategorySub"><%# Eval("Category") %></p>
                            <h6 class="TitleCaption"><%# Eval("Title") %></h6>
                            <p class="PriceCaption">$<%# Eval("Price") %></p>
                        </div>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
