﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace BW4
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopolaCarrello();
            }
        }

        private void PopolaCarrello()
        {
            List<Global.Product> carrello = Session["Cart"] as List<Global.Product>;

            if (carrello == null || carrello.Count == 0)
            {
                rptCarrello.Visible = false;
                lblTotale.Text = "Cart is Empty";
            }
            else
            {
                rptCarrello.DataSource = carrello;
                rptCarrello.DataBind();

                decimal totale = carrello.Sum(p => (decimal)p.price * p.quantity - ((decimal)p.price * p.quantity * (decimal)p.discountPercentage / 100));
                lblTotale.Text = "$ " + totale.ToString("0.00");
            }
        }

        protected void DecrementaQuantita(object sender, EventArgs e)
        {
            LinkButton btnDecrementa = (LinkButton)sender;
            int indice = int.Parse(btnDecrementa.CommandArgument);

            List<Global.Product> carrello = Session["Cart"] as List<Global.Product>;

            if (carrello[indice].quantity > 1)
            {
                carrello[indice].quantity--;
            }

            PopolaCarrello();
        }

        protected void IncrementaQuantita(object sender, EventArgs e)
        {
            LinkButton btnIncrementa = (LinkButton)sender;
            int indice = int.Parse(btnIncrementa.CommandArgument);

            List<Global.Product> carrello = Session["Cart"] as List<Global.Product>;

            carrello[indice].quantity++;

            PopolaCarrello();
        }

        protected void EliminaProdotto(object sender, EventArgs e)
        {
            LinkButton btnElimina = (LinkButton)sender;
            int indice = int.Parse(btnElimina.CommandArgument);

            List<Global.Product> carrello = Session["Cart"] as List<Global.Product>;

            carrello.RemoveAt(indice);

            PopolaCarrello();
            Response.Redirect("/Cart.aspx");
        }

        protected void ProceedToCheckout(object sender, EventArgs e)
        {

            List<Global.Product> carrello = Session["Cart"] as List<Global.Product>;

            if (Session["Cart"] != null && carrello.Count != 0)
            {
                Response.Redirect("~/Checkout.aspx");

            } else
            {
                lbl_error.Text = "Cannot proceed with checkout, cart is empty.";
                ErrorBox.Visible = true;
            }
        }

        public void CloseAlert(object sender, EventArgs e)
        {
            ErrorBox.Visible = false;

        }

    }
}
