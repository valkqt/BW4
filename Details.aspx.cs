using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BW4
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                if (!IsPostBack)
                {
                    // id di test 
                    int productId = 1;
                    // id dinamico
                    // int productId = Convert.ToInt32(Request.QueryString["productId"]);

                    string connectionString = ConfigurationManager.ConnectionStrings["Products"].ConnectionString;

                    string query = "SELECT brand, category, title, price, description, images FROM Products WHERE id = @id";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@id", productId);
                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.Read())
                            {
                                string upperCategory = reader["category"].ToString();

                                lblCategory.Text = char.ToUpper(upperCategory[0]) + upperCategory.Substring(1);
                                lblBrand.Text = reader["brand"].ToString();
                                lblTitle.Text = reader["title"].ToString();
                                lblPrice.Text = "Price: $" + reader["price"].ToString();
                                lblDescription.Text = reader["description"].ToString();
                                imgProduct.ImageUrl = reader["images"].ToString();
                            }
                            reader.Close();
                        }
                    }
                }
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
           //funzione click sul bottone add to card
        }
    }
}