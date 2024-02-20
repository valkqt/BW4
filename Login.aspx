﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BW4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="text-center py-5 mt-5 mx-auto">
            <% if (Session["username"] == null)
                { %>
            <h1>LOGIN:</h1>
            <div class="mb-3">
                <asp:Label ID="LblUser" runat="server" Text="Label">Username:</asp:Label>
                <asp:TextBox ID="TxtUsername" runat="server"></asp:TextBox>
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
                <asp:Label ID="LblPassword" runat="server" Text="Label">Password:</asp:Label>
                <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="mb-3 form-check">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember me" />
            </div>
            <asp:Button ID="ButtonLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="Btn_Login" />
            <asp:Button ID="ButtonBack" CssClass="btn btn-danger" runat="server" Text="Back" OnClick="Btn_Back" />
            <% } %>
            <% if (Session["username"] != null)
                { %>
            <h1>LOGOUT:</h1>
            <asp:Button ID="ButtonLogout" runat="server" CssClass="btn btn-danger" Text="Logout" OnClick="Btn_Logout" />
            <% } %>
        </div>
    </form>
</body>
</html>