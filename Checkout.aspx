<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="BW4.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Checkout</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="row d-flex justify-content-around">
            <div class="col-md-6">
                <div class="d-flex flex-column">
                    <h2>Customer Information</h2>

                    <asp:TextBox ID="txtUsernameEmail" runat="server" CssClass="form-control mb-2" placeholder="Username or Email Address" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsernameEmail" runat="server" ControlToValidate="txtUsernameEmail" Display="Dynamic" ErrorMessage="Username or Email Address is required." ForeColor="Red" />

                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control mb-2" placeholder="First Name" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="First Name is required." ForeColor="Red" />

                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control mb-2" placeholder="Last Name" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Last Name is required." ForeColor="Red" />

                    <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control mb-2" placeholder="Company Name"></asp:TextBox>

                    <asp:TextBox ID="txtStreet" runat="server" CssClass="form-control mb-2" placeholder="House Number and Street Name" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStreet" runat="server" ControlToValidate="txtStreet" Display="Dynamic" ErrorMessage="House Number and Street Name is required." ForeColor="Red" />

                    <asp:TextBox ID="txtApartment" runat="server" CssClass="form-control mb-2" placeholder="Apartment, Suite, Unit, etc"></asp:TextBox>

                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control mb-2" placeholder="Town / City" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Town / City is required." ForeColor="Red" />

                    <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control mb-2" placeholder="Zip Code" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="txtZipCode" Display="Dynamic" ErrorMessage="Zip Code is required." ForeColor="Red" />

                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control mb-2" placeholder="Phone" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Phone is required." ForeColor="Red" />

                    <h2>Additional Information</h2>
                    <asp:TextBox ID="txtOrderNotes" runat="server" CssClass="form-control mb-2" TextMode="MultiLine" placeholder="Notes about your order"></asp:TextBox>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title">Product</h3>
                        <img src="placeholder-image.jpg" class="card-img-top" alt="Product Image">
                        <p class="card-text"><span class="fw-bold">Product Name</span> x2</p>
                        <p class="card-text text-end">Price: $20.00</p>
                        <hr />
                        <h4 class="card-title">Total</h4>
                        <p class="card-text text-end">Total: $40.00</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-10">
                <div class="d-flex flex-column">
                    <h2>Payment</h2>

                    <div class="input-group mb-3">
                        <label class="input-group-text" for="paymentMethod">Payment Method</label>
                        <select class="form-select" id="paymentMethod" required>
                            <option value="" selected disabled>Select Payment Method</option>
                            <option value="creditCard">Credit Card</option>
                            <option value="paypal">PayPal</option>
                            <option value="cashOnDelivery">Pay with Cash upon Delivery</option>
                        </select>
                    </div>

                    <asp:Button ID="btnPlaceOrder" Text="Place Order" CssClass="btn btn-primary" OnClick="btnPlaceOrder_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
