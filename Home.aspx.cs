using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;

namespace BW4
{
    public partial class Home : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // Avvio.Start();
            if (!IsPostBack)
            {
                BindDataNewArrivals(Queries.NewArrivals);
                BindDataCategories(Queries.Categories);
                BindDataSpecialDeals(Queries.SpecialDeals);
            }
        }

        protected void LinkToDetailClick(object sender, EventArgs e)
        {
            LinkButton linkBtn = (LinkButton)sender;
            string argument = linkBtn.CommandArgument;
            Response.Redirect($"Details.aspx?productId={argument}");
        }

        protected void BtnToDetailClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string argument = btn.CommandArgument;
            Response.Redirect($"Details.aspx?productId={argument}");
        }

        private void BindDataCategories(string query)
        {
            // Connect to database
            string connectionString = ConfigurationManager.ConnectionStrings["Products"].ToString();
            // Get connection
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);
                RoundMoney(dataTable, "price");



                CategoriesRepeater.DataSource = dataTable;
                CategoriesRepeater.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                conn.Close();
                Response.Write("Connection closed");
            }
        }
        private void BindDataNewArrivals(string query)
        {
            // Connect to database
            string connectionString = ConfigurationManager.ConnectionStrings["Products"].ToString();
            // Get connection
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);
                RoundMoney(dataTable, "price");
                NewArrivalsRepeater.DataSource = dataTable;
                NewArrivalsRepeater.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                conn.Close();
                Response.Write("Connection closed");
            }
        }
        private void BindDataSpecialDeals(string query)
        {
            // Connect to database
            string connectionString = ConfigurationManager.ConnectionStrings["Products"].ToString();
            // Get connection
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);
                RoundMoney(dataTable, "price");
                AddDiscountedPrice(dataTable);

                SpecialDealsRepeater.DataSource = dataTable;
                SpecialDealsRepeater.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                conn.Close();
                Response.Write("Connection closed");
            }
        }

        protected void Admin_Btn(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }

        private void RoundMoney(DataTable dataTable, string toRound)
        {
            foreach (DataRow row in dataTable.Rows)
            {
                if (row[toRound] != DBNull.Value)
                {
                    decimal moneyValue = Convert.ToDecimal(row[toRound]);
                    row[toRound] = Math.Round(moneyValue, 2);
                    Response.Write(moneyValue);
                }
                else
                {
                    Response.Write("Not working");
                }
            }
        }
        private void AddDiscountedPrice(DataTable dataTable)
        {
            dataTable.Columns.Add("discountedPrice", typeof(decimal));
            foreach(DataRow row in dataTable.Rows)
            {
                decimal fullPrice = Convert.ToDecimal(row["price"]);
                decimal discount = Convert.ToDecimal(row["discountPercentage"]);
                decimal discountedPrice = fullPrice - Math.Round((fullPrice * discount) / 100, 2);
                row["discountedPrice"] = discountedPrice.ToString();
            }
        }
    }
}


