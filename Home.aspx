<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BW4.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Sono la content page!</p>
    <div class="container-fluid">
        <div class="card" style="width: 18rem;">
            <img src="..." class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><a href="#" class="text-black text-decoration-none">Prodotto bello</a></h5>
                <p class="card-text"><span class='badge bg-success'>100$</span></p>
            </div>
        </div>
    </div>

    <div>New Arrivals</div>
    <div>
        <div class="container">
            <div class="d-flex justify-content-center">
                    <h3 class="SectionTitle">Shop by Categories</h3>

            </div>
        </div>
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3">
                <asp:Repeater ID="CategoriesRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col text-center">
                            <img src='<%# Eval("thumbnail") %>' alt='<%# Eval("title") %>' class="HomeImage" />
                            <h6 class="CategoryCaption"><%# Eval ("category") %></h6>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        Shop by categories

    </div>
    <div>Shop by brand</div>
    <div>Special offers and deals</div>

</asp:Content>


