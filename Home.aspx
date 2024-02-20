<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BW4.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% if (Session["username"] != null && Session["username"].ToString() == "admin")
        { %>
    <h1>Welcome Admin</h1>
    <asp:Button ID="AdminButton" runat="server" Text="Admin Settings" CssClass="btn btn-warning" OnClick="Admin_Btn" />
    <% } %>
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


</asp:Content>


