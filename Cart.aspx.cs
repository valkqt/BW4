using System;
using System.Collections.Generic;
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
                // Simula il recupero dei dati
                List<Prodotto> prodotti = GetProdotti();
                rptCarrello.DataSource = prodotti;
                rptCarrello.DataBind();
            }
        }

        protected List<Prodotto> GetProdotti()
        {
            // Implementa la logica per recuperare i dati 
            List<Prodotto> prodotti = new List<Prodotto>
            {
                new Prodotto { NomeProdotto = "Occhiali", Immagine = "immagine1.jpg", Prezzo = 20, Quantita = 1 },
                new Prodotto { NomeProdotto = "Banana", Immagine = "immagine2.jpg", Prezzo = 50, Quantita = 7 }
            };

            return prodotti;
        }

        public class Prodotto
        {
            public string NomeProdotto { get; set; }
            public string Immagine { get; set; }
            public double Prezzo { get; set; }
            public int Quantita { get; set; }
            public double Subtotale => Prezzo * Quantita;
        }

        protected void CalcolaTotale()
        {
            double totale = 0;

            foreach (RepeaterItem item in rptCarrello.Items)
            {              
                    Label lblSubtotale = (Label)item.FindControl("lblSubtotale");

                    if (lblSubtotale != null)
                    {
                        totale += Convert.ToDouble(lblSubtotale.Text);
                    }
            }
            lblTotale.Text = totale.ToString("F2");
        }
    }
}
