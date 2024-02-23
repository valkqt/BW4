<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BW4.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>PAGAH - Cart</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div runat="server" id="ErrorBox" visible="false" class="AlertMsg">
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <svg xmlns="http://www.w3.org/2000/svg" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" width="16" height="16" role="img" aria-label="Warning:">
                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                </svg>
                <div class="GenericAlert">
                    <asp:Label ID="lbl_error" runat="server" Text="Error: "></asp:Label>
                    <asp:LinkButton ID="AlertClose" runat="server" OnClick="CloseAlert" CssClass="btn btn-danger">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                         <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                        </svg>
                    </asp:LinkButton>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-8">
                <asp:Repeater ID="rptCarrello" runat="server">
                    <ItemTemplate>
                        <div class="card me-2 mb-2">
                            <div class="card-body d-flex align-items-center flex-row justify-content-between">
                                <a href='<%# "/Details.aspx/?productId=" + Eval("id") %>' style="text-decoration: none;">
                                    <img src='<%# Eval("thumbnail") %>' alt='<%# Eval("title") %>' class="img-fluid" style="max-width: 100px; max-height: 100px" />
                                </a>
                                <a href='<%# "/Details.aspx/?productId=" + Eval("id") %>' class="fw-bold fs-5 text-danger" style="text-decoration: none;"><%# Eval("title") %></a>
                                <span class=""><%# "$" + (Convert.ToDecimal(Eval("price")) - (Convert.ToDecimal(Eval("price")) * (Convert.ToDecimal(Eval("discountPercentage")) / 100))).ToString("0.00") %></span>
                                <span class="">
                                    <asp:LinkButton runat="server" OnClick="DecrementaQuantita" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-outline-secondary btn-sm">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash" viewBox="0 0 16 16">
  <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8"/>
</svg>
                                    </asp:LinkButton>
                                    <asp:Label runat="server" ID="lblQuantita" Text='<%# Eval("quantity") %>' CssClass="mx-2"></asp:Label>
                                    <asp:LinkButton runat="server" OnClick="IncrementaQuantita" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-outline-secondary btn-sm">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
</svg>
                                    </asp:LinkButton>
                                </span>
                                <span>Tot: $<%# ((Convert.ToDecimal(Eval("price")) - (Convert.ToDecimal(Eval("price")) * (Convert.ToDecimal(Eval("discountPercentage")) / 100))) * Convert.ToInt32(Eval("quantity"))).ToString("0.00") %></span>
                                <asp:LinkButton CssClass="btn btn-outline-secondary btn-sm rounded-circle small p-1 d-flex justify-content-center align-content-center" runat="server" OnClick="EliminaProdotto" CommandArgument='<%# Container.ItemIndex %>'>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
</svg>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="list-group list-group-flush">
                        <ul class="p-0 mb-0">
                            <li class="fs-5 fw-bold list-group-item">Cart total:</li>
                            <li class="fs-5 list-group-item">
                                <asp:Label ID="lblTotale" runat="server"></asp:Label></li>
                            <li class="list-group-item">Do you have a coupon?</li>
                        </ul>
                    </div>
                </div>
                <asp:LinkButton runat="server" ID="checkoutBtn" class="mt-2 w-100 btn btn-danger p-3 fs-4" OnClick="ProceedToCheckout">PROCEED TO CHECKOUT</asp:LinkButton>

            </div>
        </div>
    </div>
</asp:Content>
