<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="BW4.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">

        <div class="row">
            <div class="col">
                <asp:Image ID="imgProduct" runat="server" cssClass="img-fluid"/>
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
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" />
                </div>
            </div>
        </div>

        <div class="d-flex justify-content-center mt-4">
            <h3 class="SectionTitle">Related Products</h3>
        </div>

        <div class="row mt-5">
            <asp:Repeater ID="RelatedRepeater" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonDetail" CssClass="col" runat="server" OnClick="LinkButtonDetail_Click" CommandArgument='<%# Eval("id") %>'>
                        <div class="col text-center">
                            <img src='<%# Eval("ImageUrl") %>' class="HomeImage" />
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
