<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BW4.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Carrello</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <asp:Repeater ID="rptCarrello" runat="server">
            <ItemTemplate>
                <div style="border: 1px solid #000; padding: 10px; margin-bottom: 2rem;">
                    <img src='<%# Eval("Immagine") %>' alt='<%# Eval("NomeProdotto") %>' width="50" height="50" />
                    <span><%# Eval("NomeProdotto") %></span>
                    <span>Prezzo: $<%# Eval("Prezzo", "{0:F2}") %></span>
                    <span>Quantità:
                            <asp:Button runat="server" Text="-" />
                        <asp:Label runat="server" ID="lblQuantita" Text='<%# Eval("Quantita") %>'></asp:Label>
                        <asp:Button runat="server" Text="+" />
                    </span>
                    <span>Subtotale: $<%# Eval("Subtotale", "{0:F2}") %></span>
                    <asp:Button runat="server" Text="Elimina" />
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div>
            <h3>Totale: $<asp:Label ID="lblTotale" runat="server"></asp:Label></h3>
            <div>
                <label>Hai un coupon?</label>
            </div>
            <asp:Button ID="btnProcediAcquisto" Text="Procedi all'acquisto" OnClick="btnProcediAcquisto_Click" />
        </div>

    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
