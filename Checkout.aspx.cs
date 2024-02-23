using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace BW4
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowProductsInSummary();
            }
        }
        private void ShowProductsInSummary()
        {
            List<Global.Product> cart = Session["Cart"] as List<Global.Product>;

            if (cart == null || cart.Count == 0)
            {
                rptProdottiRiepilogo.Visible = false;
                lblTotaleRiepilogo.Text = "Your cart is empty!";
            }
            else
            {
                rptProdottiRiepilogo.DataSource = cart;
                rptProdottiRiepilogo.DataBind();

                double total = cart.Sum(p => p.price * p.quantity);
                double shoppingFee = new Random().Next(0, 6);

                lblTotaleRiepilogo.Text = total.ToString("0.00");
                lblShippingFee.Text = shoppingFee.ToString("0.00");

                double grandTotal = total + shoppingFee;
                lblGrandTotal.Text = grandTotal.ToString("0.00");
            }
        }
        public string TruncateTitle(string title, int maxLength)
        {
            if (title.Length > maxLength)
            {
                return title.Substring(0, maxLength) + "...";
            }
            else
            {
                return title;
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {

            if (!IsValidEmail(txtUsernameEmail.Text.Trim()))
            {
                ShowErrorMessage("Invalid email.");
                return;
            }

            if (!IsValidName(txtFirstName.Text) || !IsValidName(txtLastName.Text) || !IsValidName(txtCity.Text))
            {
                ShowErrorMessage("First name, last name or city are invalid.");
                return;
            }

            int cap;
            if (!int.TryParse(txtZipCode.Text, out cap))
            {
                ShowErrorMessage("Invalid Zip code.");
                return;
            }

            string telefono = txtPhone.Text.Trim();
            if (!IsValidPhoneNumber(telefono))
            {
                ShowErrorMessage("Invalid Phone number.");
                return;
            }

            Response.Redirect("/Home.aspx");
        }

        private void ShowErrorMessage(string message)
        {
            lblMessaggioErrore.Text = message;
            lblMessaggioErrore.Visible = true;
        }

        private bool IsValidEmail(string email)
        {
            return Regex.IsMatch(email, @"\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b", RegexOptions.IgnoreCase);
        }

        private bool IsValidName(string name)
        {
            return !string.IsNullOrWhiteSpace(name);
        }

        private bool IsValidPhoneNumber(string phoneNumber)
        {
            return Regex.IsMatch(phoneNumber, @"^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$");
        }
    }
}



