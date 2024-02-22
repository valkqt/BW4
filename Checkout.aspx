<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="BW4.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Checkout</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="row d-flex justify-content-around">
            <div class="col-md-6">
                <div class="d-flex flex-column">
                    <h2>Customer informations</h2>
                    <asp:Label ID="lblMessaggioErrore" runat="server" ForeColor="Red" Visible="false"></asp:Label>

                    <asp:TextBox ID="txtUsernameEmail" runat="server" CssClass="form-control mb-2" placeholder="Email Address" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsernameEmail" runat="server" ControlToValidate="txtUsernameEmail" Display="Dynamic" ErrorMessage="You have to provide an email." ForeColor="Red" />

                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control mb-2" placeholder=" First name" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="You have to provide a first name." ForeColor="Red" />

                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control mb-2" placeholder="Last name" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="You have to provide a last name." ForeColor="Red" />

                    <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control mb-2" placeholder="Company"></asp:TextBox>

                    <asp:TextBox ID="txtStreet" runat="server" CssClass="form-control mb-2" placeholder="House Number and Street Name" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStreet" runat="server" ControlToValidate="txtStreet" Display="Dynamic" ErrorMessage="You have to provide an House Number and a Street Name " ForeColor="Red" />

                    <asp:TextBox ID="txtApartment" runat="server" CssClass="form-control mb-2" placeholder="Apartment, Suite, Unity, ecc."></asp:TextBox>

                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control mb-2" placeholder="City" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="You have to provide a city." ForeColor="Red" />

                    <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control mb-2" placeholder="Zip Code" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="txtZipCode" Display="Dynamic" ErrorMessage="You have to provide a zip code." ForeColor="Red" />

                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control mb-2" placeholder="Phone" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="You have to provide a phone number." ForeColor="Red" />

                    <h2>Additional informations</h2>
                    <asp:TextBox ID="txtOrderNotes" runat="server" CssClass="form-control mb-2" TextMode="MultiLine" placeholder="Additional notes:"></asp:TextBox>
                </div>
            </div>

            <div class="col-md-6">
                <asp:Repeater ID="rptProdottiRiepilogo" runat="server">
                    <ItemTemplate>
                        <div class="card me-2 mb-2">
                            <div class="card-body d-flex align-items-center flex-row justify-content-between">
                                <img src='<%# Eval("thumbnail") %>' alt='<%# Eval("title") %>' class="img-fluid" width="100" height="100" />
                                <span class="fw-bold fs-6 text-danger"><%# Eval("title") %></span>
                                <span class="">$<%# Eval("price", "{0:F2}") %></span>
                                <span class="">Quantity: <%# Eval("quantity") %></span>
                                <span>Tot: $<%# (Convert.ToDecimal(Eval("price")) * Convert.ToInt32(Eval("quantity"))).ToString("0.00") %></span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="card">
    <div class="card-body">
        <h3 class="card-title">Total</h3>
        <p class="card-text text-end">
            <span class="fs-5">Subtotal: $<asp:Label ID="lblTotaleRiepilogo" runat="server"></asp:Label></span>
            <br />
            <span class="fs-5">Shipping Fee: $<asp:Label ID="lblShippingFee" runat="server"></asp:Label></span>
            <br />
            <span class="fw-bold fs-3">Total: $<asp:Label ID="lblGrandTotal" runat="server"></asp:Label></span> 
        </p>
    </div>
</div>
            </div>
        </div>

        <div class="row mt-4 justify-content-center">
            <div class="col-md-10">
                <div class="d-flex flex-column">
                    <h2>Payment</h2>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="paymentMethod">Payment</label>
                        <select class="form-select" id="paymentMethod" required>
                            <option value="" selected disabled>Selact a payment method</option>
                            <option value="creditCard">Credit card</option>
                            <option value="paypal">PayPal</option>
                            <option value="cashOnDelivery">Pay with cash upon delivery.</option>
                        </select>
                    </div>
                    <asp:Button ID="btnPlaceOrder" runat="server" Text="Place your order" CssClass="btn btn-danger btn-lg" OnClick="btnPlaceOrder_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
