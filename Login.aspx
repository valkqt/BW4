<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BW4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <link href="Styles/Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="form-container" class="text-center py-5 mt-5 mx-auto">
            <% if (Session["username"] == null)
                { %>
            <h1>LOGIN:</h1>
            <div class="mb-3">
                <asp:Label ID="LblUser" runat="server" Text="Label">Username:</asp:Label>
                <asp:TextBox ID="TxtUsername" CssClass="textbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="error-message" runat="server" ErrorMessage="Username Required" ControlToValidate="TxtUsername" Display="Dynamic"></asp:RequiredFieldValidator>
                <div class="form-text">We'll never share your information with anyone else.</div>
            </div>
            
            <div class="mb-3">
                <asp:Label ID="LblPassword" runat="server" Text="Label">Password:</asp:Label>
                <asp:TextBox ID="TxtPassword" CssClass="textbox" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="error-message" runat="server" ErrorMessage="Password Required" ControlToValidate="TxtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="mb-3 form-check">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember me" />
            </div>
            <asp:Button ID="ButtonLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="Btn_Login" />
            <a href="Home.aspx" class="btn btn-danger">Back</a>
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
