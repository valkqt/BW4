<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BW4.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="d-flex justify-content-center">
            <h3 class="SectionTitle">New Arrivals</h3>
        </div>
    </div>
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4">
            <asp:Repeater ID="NewArrivalsRepeater" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkToDetailNewArrivals" runat="server" OnClick="LinkToDetailClick" CommandArgument='<%# Eval("id")%>'>
                    <div class="col text-center">
                        <img src='<%# Eval("thumbnail") %>' alt='<%# Eval("title") %>' class="HomeImage" />
                        <p class="CategorySub"><%# Eval ("category") %></p>
                        <h6 class="TitleCaption"><%# Eval ("title") %></h6>
                        <p class="PriceCaption">$ <%# Eval ("price") %></p>
                    </div>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="container">
        <div class="d-flex justify-content-center">
            <h3 class="SectionTitle">Shop by Categories</h3>
        </div>
    </div>
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3">
            <asp:Repeater ID="CategoriesRepeater" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkToDetailCategories" runat="server" OnClick="LinkToDetailClick" CommandArgument='<%# Eval("id")%>'>
                    <div class="col text-center">
                        <img src='<%# Eval("thumbnail") %>' alt='<%# Eval("title") %>' class="HomeImage" />
                        <h6 class="CategoryCaption"><%# Eval ("category") %></h6>
                    </div>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="container">
        <div class="d-flex justify-content-center">
            <h3 class="SectionTitle">Special Offers &amp; Deals</h3>
        </div>
    </div>
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2">
            <asp:Repeater ID="SpecialDealsRepeater" runat="server">
                <ItemTemplate>
                    <div class="col text-center">
                        <div class="d-flex justify-content-center SpecialDeal">
                            <div>
                                <h4 class="TitleCaption"><%# Eval ("title") %></h4>
                                <p class="OldPrice">$ <%# Eval ("price") %></p>
                                <p class="NewPrice">$ <%# Eval ("price") %></p>
                                <asp:Button ID="BtnShopNow" runat="server" Text="SHOP NOW" CssClass="btn btn-primary" OnClick="BtnToDetailClick" CommandArgument='<%# Eval("id")%>' />
                            </div>
                            <div>
                                <img src='<%# Eval("thumbnail") %>' alt='<%# Eval("title") %>' class="SpecialDealImage" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="container">
        <div class="row row-cols-1">
            <div class="col text-center">
                <h3 class="SectionTitle">Testimonials</h3>
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-quote" viewBox="0 0 16 16">
                        <path d="M12 12a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1h-1.388q0-.527.062-1.054.093-.558.31-.992t.559-.683q.34-.279.868-.279V3q-.868 0-1.52.372a3.3 3.3 0 0 0-1.085.992 4.9 4.9 0 0 0-.62 1.458A7.7 7.7 0 0 0 9 7.558V11a1 1 0 0 0 1 1zm-6 0a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1H4.612q0-.527.062-1.054.094-.558.31-.992.217-.434.559-.683.34-.279.868-.279V3q-.868 0-1.52.372a3.3 3.3 0 0 0-1.085.992 4.9 4.9 0 0 0-.62 1.458A7.7 7.7 0 0 0 3 7.558V11a1 1 0 0 0 1 1z" />
                    </svg>
                </div>
                <p>Thrilled with my purchase! Top-notch quality, prompt delivery, and excellent service. Highly recommended!</p>
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                    </svg>
                </div>
                <p>Lily McArtur</p>
            </div>
        </div>
    </div>
    <% if (Session["username"] != null && Session["username"].ToString() == "admin" && Session["password"] != null && Session["password"].ToString() == "admin")
        { %>
    <h1>Welcome Admin</h1>
    <asp:Button ID="AdminButton" runat="server" Text="Admin Settings" CssClass="btn btn-warning" OnClick="Admin_Btn" />
    <% } %>
</asp:Content>


