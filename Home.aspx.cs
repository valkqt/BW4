using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                DataSet dataSet = new DataSet();

                dataAdapter.Fill(dataSet);
                CategoriesRepeater.DataSource = dataSet;
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
                DataSet dataSet = new DataSet();

                dataAdapter.Fill(dataSet);
                NewArrivalsRepeater.DataSource = dataSet;
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
                DataSet dataSet = new DataSet();

                dataAdapter.Fill(dataSet);
                SpecialDealsRepeater.DataSource = dataSet;
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
    }
}


