<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BW4.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>PAGAH - Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <% if (Session["username"] != null && Session["username"].ToString() == "admin" && Session["password"] != null && Session["password"].ToString() == "admin")
        { %>
    <div class="AdminContainer">
        <h1>Welcome Admin</h1>
        <asp:Button ID="AdminButton" runat="server" Text="Go to Back Office" CssClass="btn btn-warning fw-bold" OnClick="Admin_Btn" />
    </div>
    <% } %>

    <div id="hero" class="text-center position-relative">
        <iframe src="https://www.youtube.com/embed/l8zwZZEpe0w?autoplay=1&mute=1&controls=0&fullscreen=1&start=15" id="youtube" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        <h1 class="text-white" id="heroText">Your personal shopping website where "Paghi e basta, non compri niente"</h1>
    </div>



    <div class="container-fluid">
        <div class="d-flex justify-content-center">
            <h3 class="SectionTitle">New Arrivals</h3>
        </div>
        <div class="d-flex justify-content-center">
            <div class="SectionBorder">
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-4">
            <asp:Repeater ID="NewArrivalsRepeater" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkToDetailNewArrivals" runat="server" OnClick="LinkToDetailClick" CommandArgument='<%# Eval("id")%>' CssClass="LinkButton">
                    <div class="col text-center">
                        <img src='<%# Eval("images") %>' alt='<%# Eval("title") %>' class="HomeImage" />
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
        <div class="d-flex justify-content-center">
            <div class="SectionBorder">
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xxl-6">
            <asp:Repeater ID="CategoriesRepeater" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkToDetailCategories" runat="server" OnClick="LinkToDetailClick" CommandArgument='<%# Eval("id")%>' CssClass="LinkButton">
                    <div class="col text-center mb-3">
                        <img src='<%# Eval("images") %>' alt='<%# Eval("title") %>' class="HomeImage" />
                        <h6 class="CategoryCaption mb-2" style="text-transform: uppercase; color: #413E65; opacity: 0.9;"><%# Eval ("category") %></h6>
                        <div class="d-flex justify-content-center">
                            <div class="CategoryBorder"></div>
                        </div>
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
        <div class="d-flex justify-content-center">
            <div class="SectionBorder">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row row-cols-1 row-cols-lg-2">
            <asp:Repeater ID="SpecialDealsRepeater" runat="server">
                <ItemTemplate>
                    <div class="col mb-4">
                        <div class="d-flex justify-content-center SpecialDeal align-items-center">
                            <div>
                                <div class="ArticleContainer">
                                    <h4 class="SpecialDealTitle"><%# Eval ("title") %></h4>
                                    <p class="OldPrice">$<%# Eval ("price") %></p>
                                    <p class="NewPrice">$<%# Eval ("discountedPrice") %></p>
                                </div>
                                <asp:Button ID="BtnShopNow" runat="server" Text="SHOP NOW" CssClass="btn btn-primary" OnClick="BtnToDetailClick" CommandArgument='<%# Eval("id")%>' Style="border-radius: 0px; border: none; font-weight: 700; font-size: 0.8rem; padding: 15px 20px; background-color: #484385" onmouseover="this.style.backgroundColor='#F25C54'"
                                    onmouseout="this.style.backgroundColor='#484385'" />
                            </div>
                            <div>
                                <img src='<%# Eval("images") %>' alt='<%# Eval("title") %>' class="SpecialDealImage" />
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
                <div class="d-flex justify-content-center">
                    <h3 class="SectionTitle">Testimonials</h3>
                </div>
                <div class="d-flex justify-content-center">
                    <div class="SectionBorder mb-3">
                    </div>
                </div>
                <div class="mb-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="72" height="72" fill="#413E65" class="bi bi-quote" viewBox="0 0 16 16" CssClass="QuoteMarks">
                        <path d="M12 12a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1h-1.388q0-.527.062-1.054.093-.558.31-.992t.559-.683q.34-.279.868-.279V3q-.868 0-1.52.372a3.3 3.3 0 0 0-1.085.992 4.9 4.9 0 0 0-.62 1.458A7.7 7.7 0 0 0 9 7.558V11a1 1 0 0 0 1 1zm-6 0a1 1 0 0 0 1-1V8.558a1 1 0 0 0-1-1H4.612q0-.527.062-1.054.094-.558.31-.992.217-.434.559-.683.34-.279.868-.279V3q-.868 0-1.52.372a3.3 3.3 0 0 0-1.085.992 4.9 4.9 0 0 0-.62 1.458A7.7 7.7 0 0 0 3 7.558V11a1 1 0 0 0 1 1z" />
                    </svg>
                </div>
                <p class="Comment">Thrilled with my purchase! Top-notch quality, prompt delivery, and excellent service. Highly recommended!</p>
                <div class="Stars mb-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#F25C54" class="bi bi-star-fill" viewBox="0 0 16 16" CssClass="StarFill">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#F25C54" class="bi bi-star-fill" viewBox="0 0 16 16" CssClass="StarFill">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#F25C54" class="bi bi-star-fill" viewBox="0 0 16 16" CssClass="StarFill">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#F25C54" class="bi bi-star-fill" viewBox="0 0 16 16" CssClass="StarFill">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#F25C54" class="bi bi-star-fill" viewBox="0 0 16 16" CssClass="StarFill">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                    </svg>
                </div>
                <p class="CommentAuthor">Lily McArtur</p>
            </div>
        </div>
    </div>
</asp:Content>
