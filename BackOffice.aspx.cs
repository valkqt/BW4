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
    public partial class BackOffice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            foreach (Global.Product product in Global.Storage.storage)
            {
                ListItem option = new ListItem();
                option.Value = product.id.ToString();
                option.Text = product.title;
                BackDropdown.Items.Add(option);
            }

            string connectionString = ConfigurationManager.ConnectionStrings["Products"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();

                SqlCommand select = new SqlCommand("select * from [dbo].[Products] where id=1", conn);
                SqlDataReader reader = select.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        ProductId.Text = reader["id"].ToString();
                        ProductTitle.Text = reader["title"].ToString();
                        ProductPrice.Text = reader["price"].ToString();
                        ProductBrand.Text = reader["brand"].ToString();
                        ProductCategory.Text = reader["category"].ToString();
                        ProductRating.Text = reader["rating"].ToString();
                        ProductDescription.Text = reader["description"].ToString();
                        ProductDiscount.Text = reader["discountPercentage"].ToString();
                        ProductImage.Text = reader["images"].ToString();
                        ProductThumbnail.Text = reader["thumbnail"].ToString();
                    }

                }

            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

            finally
            {
                conn.Close();
            }



        }
    }
}