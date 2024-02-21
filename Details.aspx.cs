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
            if (!IsPostBack)
            {
                int productId = Convert.ToInt32(Request.QueryString["productId"]);

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

                string category = GetProductCategory(productId);

                List<Product> relatedProducts = GetRandomProductsByCategory(category, 4);

                RelatedRepeater.DataSource = relatedProducts;
                RelatedRepeater.DataBind();
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            int productId = Convert.ToInt32(Request.QueryString["productId"]);

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

                        Response.Redirect("/Cart.aspx");
                    }
                    reader.Close();
                }
            }
        }

        private string GetProductCategory(int productId)
        {
            string category = "";
            string connectionString = ConfigurationManager.ConnectionStrings["Products"].ConnectionString;
            string query = "SELECT category FROM Products WHERE id = @id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@id", productId);
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        category = result.ToString();
                    }
                }
            }

            return category;
        }

        private List<Product> GetRandomProductsByCategory(string category, int count)
        {
            List<Product> products = new List<Product>();
            string connectionString = ConfigurationManager.ConnectionStrings["Products"].ConnectionString;
            string query = "SELECT TOP (@count) id, brand, category, title, price, description, images FROM Products WHERE category = @category ORDER BY NEWID()";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@count", count);
                    command.Parameters.AddWithValue("@category", category);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Product product = new Product
                        {
                            Id = Convert.ToInt32(reader["id"]),
                            Brand = reader["brand"].ToString(),
                            Category = reader["category"].ToString(),
                            Title = reader["title"].ToString(),
                            Price = Convert.ToDecimal(reader["price"]),
                            Description = reader["description"].ToString(),
                            ImageUrl = reader["images"].ToString()
                        };
                        products.Add(product);
                    }
                    reader.Close();
                }
            }

            return products;
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
