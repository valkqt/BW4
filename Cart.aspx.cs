using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
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
            List<Product> carrello = Session["Cart"] as List<Product>;

            if (carrello == null || carrello.Count == 0)
            {
                rptCarrello.Visible = false;
                lblTotale.Text = "Il tuo carrello è vuoto!";
            }
            else
            {
                rptCarrello.DataSource = carrello;
                rptCarrello.DataBind();

                decimal totale = carrello.Sum(p => p.Price * p.Quantity);
                lblTotale.Text = totale.ToString("0.00");
            }
        }
        protected void DecrementaQuantita(object sender, EventArgs e)
        {
            Button btnDecrementa = (Button)sender;
            int indice = int.Parse(btnDecrementa.CommandArgument);

            List<Product> carrello = Session["Cart"] as List<Product>;

            carrello[indice].Quantity--;

            PopolaCarrello();
        }

        protected void IncrementaQuantita(object sender, EventArgs e)
        {
            Button btnIncrementa = (Button)sender;
            int indice = int.Parse(btnIncrementa.CommandArgument);

            List<Product> carrello = Session["Cart"] as List<Product>;

            carrello[indice].Quantity++;

            PopolaCarrello();
        }

        protected void EliminaProdotto(object sender, EventArgs e)
        {
            Button btnElimina = (Button)sender;
            int indice = int.Parse(btnElimina.CommandArgument);

            List<Product> carrello = Session["Cart"] as List<Product>;

            carrello.RemoveAt(indice);

            PopolaCarrello();
        }

        protected void btnProcediAcquisto_Click(object sender, EventArgs e)
        {
            // c'è da creare la apgina checkout ancora
            // Response.Redirect("Checkout.aspx");
        }
    }
}

