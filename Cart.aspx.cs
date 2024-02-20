using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BW4
{
    public partial class Cart : System.Web.UI.Page
    {
        public class Prodotto
        {
            public string NomeProdotto { get; set; }
            public string Immagine { get; set; }
            public double Prezzo { get; set; }
            public int Quantita { get; set; }
            public double Subtotale => Prezzo * Quantita;
        }

        //simula il recupero dei dati
        protected List<Prodotto> GetProdotti()
        {
            List<Prodotto> prodotti = Session["Prodotti"] as List<Prodotto>;

            if (prodotti == null)
            {
                prodotti = new List<Prodotto>
                {
                    new Prodotto { NomeProdotto = "Occhiali", Immagine = "https://media.istockphoto.com/id/1417602445/it/foto/occhiali-da-sole-in-colore-dorato-brillante-in-plastica-trasparente-occhiali-vista-dallalto.jpg?s=2048x2048&w=is&k=20&c=xxJ_LjC7ivYgJ3HIkoVmmG5yTpQ3Id4O4GwjwTiiHq0=", Prezzo = 20, Quantita = 1 },
                    new Prodotto { NomeProdotto = "Giornale", Immagine = "https://media.istockphoto.com/id/1417602445/it/foto/occhiali-da-sole-in-colore-dorato-brillante-in-plastica-trasparente-occhiali-vista-dallalto.jpg?s=2048x2048&w=is&k=20&c=xxJ_LjC7ivYgJ3HIkoVmmG5yTpQ3Id4O4GwjwTiiHq0=", Prezzo = 1, Quantita = 1 },
                    new Prodotto { NomeProdotto = "Banana", Immagine = "https://media.istockphoto.com/id/1417602445/it/foto/occhiali-da-sole-in-colore-dorato-brillante-in-plastica-trasparente-occhiali-vista-dallalto.jpg?s=2048x2048&w=is&k=20&c=xxJ_LjC7ivYgJ3HIkoVmmG5yTpQ3Id4O4GwjwTiiHq0=", Prezzo = 50, Quantita = 1 }
                };

                Session["Prodotti"] = prodotti;
            }

            return prodotti;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptCarrello.DataSource = GetProdotti();
                rptCarrello.DataBind();
                CalcolaTotale();
            }
        }

        private void AggiornaQuantita(int index, int nuovaQuantita)
        {
            List<Prodotto> prodotti = GetProdotti();
            prodotti[index].Quantita = nuovaQuantita;

            Session["Prodotti"] = prodotti;

            rptCarrello.DataSource = prodotti;
            rptCarrello.DataBind();

            CalcolaTotale();
        }

        protected void IncrementaQuantita(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int index = Convert.ToInt32(btn.CommandArgument);

            AggiornaQuantita(index, GetProdotti()[index].Quantita + 1);
        }

        protected void DecrementaQuantita(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int index = Convert.ToInt32(btn.CommandArgument);

            AggiornaQuantita(index, Math.Max(0, GetProdotti()[index].Quantita - 1));
        }

        protected void EliminaProdotto(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int index = Convert.ToInt32(btn.CommandArgument);

            List<Prodotto> prodotti = GetProdotti();
            prodotti.RemoveAt(index);

            Session["Prodotti"] = prodotti;

            rptCarrello.DataSource = prodotti;
            rptCarrello.DataBind();

            CalcolaTotale();
        }

        protected void CalcolaTotale()
        {
            double totale = 0;

            List<Prodotto> prodotti = GetProdotti();

            foreach (Prodotto prodotto in prodotti)
            {
                totale += prodotto.Subtotale;
            }

            lblTotale.Text = totale.ToString("F2");
        }
    }
}

