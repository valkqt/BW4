<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BW4.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Carrello</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8">
                <asp:Repeater ID="rptCarrello" runat="server">
                    <ItemTemplate>
                        <div class="card me-2">
                            <div class="card-body d-flex align-items-center flex-row justify-content-between">
                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="img-fluid" width="100" height="100" />
                                <span class="fw-bold fs-5 text-danger"><%# Eval("Title") %></span>
                                <span class="">$<%# Eval("Price", "{0:F2}") %></span>
                                <span class="">
                                    <asp:LinkButton runat="server" OnClick="DecrementaQuantita" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-outline-secondary btn-sm">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash" viewBox="0 0 16 16">
  <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8"/>
</svg>
                                    </asp:LinkButton>
                                    <asp:Label runat="server" ID="lblQuantita" Text='<%# Eval("Quantity") %>' CssClass="mx-2"></asp:Label>
                                    <asp:LinkButton runat="server" OnClick="IncrementaQuantita" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-outline-secondary btn-sm">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
</svg>
                                    </asp:LinkButton>
                                </span>
                                <span>Tot: $<%# (Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity"))).ToString("0.00") %></span>
                                <asp:LinkButton CssClass="btn btn-outline-secondary btn-sm rounded-circle small p-1 d-flex justify-content-center align-content-center" runat="server" Text="X" OnClick="EliminaProdotto" CommandArgument='<%# Container.ItemIndex %>'>
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
                            <li class="fs-5 fw-bold list-group-item">Totale Carrello:</li>
                            <li class="fs-5 list-group-item"><span class="me-2">$</span><asp:Label ID="lblTotale" runat="server"></asp:Label></li>
                            <li class="list-group-item">Hai un coupon?</li>
                        </ul>
                    </div>
                </div>
                <asp:Button ID="btnProcediAcquisto" runat="server" Text="PROCEDI ALL'ACQUISTO" CssClass="mt-2 w-100 btn btn-danger p-3 fs-4" />
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>


