using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
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

                string query = "SELECT brand, category, title, price, description, images, discountPercentage FROM Products WHERE id = @id";

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
                            double price = Convert.ToDouble(reader["price"]);
                            lblPrice.Text = "$" + price.ToString("0.00");
                            lblDescription.Text = reader["description"].ToString();
                            imgProduct.ImageUrl = reader["images"].ToString();
                            double discountPercentage = Convert.ToDouble(reader["discountPercentage"]);
                            lblDiscounted.Text = "$" + (price - (price * (discountPercentage / 100))).ToString("0.00");
                        }
                        reader.Close();
                    }
                }

                string category = GetProductCategory(productId);

                List<Global.Product> relatedProducts = GetRandomProductsByCategory(category, 4);

                RelatedRepeater.DataSource = relatedProducts;
                RelatedRepeater.DataBind();
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            int productId = Convert.ToInt32(Request.QueryString["productId"]);

            int quantity = int.Parse(txtQuantity.Value);

            string connectionString = ConfigurationManager.ConnectionStrings["Products"].ConnectionString;
            string query = "SELECT brand, category, title, price, description, images, discountPercentage FROM Products WHERE id = @id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@id", productId);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        Global.Product product = new Global.Product
                        {
                            id = productId,
                            brand = reader["brand"].ToString(),
                            category = reader["category"].ToString(),
                            title = reader["title"].ToString(),
                            price = Convert.ToDouble(reader["price"]),
                            description = reader["description"].ToString(),
                            thumbnail = reader["images"].ToString(),
                            quantity = quantity,
                            discountPercentage = Convert.ToDouble(reader["discountPercentage"])
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


        private List<Global.Product> GetRandomProductsByCategory(string category, int count)
        {
            List<Global.Product> products = new List<Global.Product>();
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
                        Global.Product product = new Global.Product
                        {
                            id = Convert.ToInt32(reader["id"]),
                            brand = reader["brand"].ToString(),
                            category = reader["category"].ToString(),
                            title = reader["title"].ToString(),
                            price = Convert.ToDouble(reader["price"]),
                            description = reader["description"].ToString(),
                            thumbnail = reader["images"].ToString()
                        };
                        Console.WriteLine(product.price);
                        products.Add(product);
                    }
                    reader.Close();
                }
            }

            return products;
        }

        protected void LinkButtonDetail_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string productId = btn.CommandArgument;
            Response.Redirect($"~/Details.aspx/?productId={productId}");
        }


        private void AddProductToCart(Global.Product product)
        {
            if (Session["Cart"] == null)
            {
                Session["Cart"] = new List<Global.Product>();
            }

            List<Global.Product> cart = (List<Global.Product>)Session["Cart"];

            Global.Product existingProduct = cart.FirstOrDefault(p => p.id == product.id);

            if (existingProduct != null)
            {
                existingProduct.quantity += product.quantity;
            }
            else
            {
                cart.Add(product);
            }

            Session["Cart"] = cart;
        }
    }
}
