using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static BW4.Global;

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
                                lblPrice.Text = "$" + Convert.ToDecimal(reader["price"]).ToString("0.00");
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
            //id di test
            int productId = 1;

            //id dinamico
            // int productId = Convert.ToInt32(Request.QueryString["productId"]);

            int quantity = int.Parse(txtQuantity.Value);

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
                        Product product = new Product
                        {
                            Id = productId,
                            Brand = reader["brand"].ToString(),
                            Category = reader["category"].ToString(),
                            Title = reader["title"].ToString(),
                            Price = Convert.ToDecimal(reader["price"]),
                            Description = reader["description"].ToString(),
                            ImageUrl = reader["images"].ToString(),
                            Quantity = quantity
                        };

                        AddProductToCart(product);

                        Response.Redirect("Cart.aspx");
                    }
                    reader.Close();
                }
            }
        }
        private void AddProductToCart(Product product)
        {
            if (Session["Cart"] == null)
            {
                Session["Cart"] = new List<Product>();
            }

            List<Product> cart = (List<Product>)Session["Cart"];

            cart.Add(product);

            Session["Cart"] = cart;
        }
    }
}