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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["Products"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();

                SqlCommand create = new SqlCommand("create table Products" +
                    "(" +
                    "id int NOT NULL IDENTITY," +
                    "title varchar(100) NOT NULL UNIQUE," +
                    "description varchar(max) DEFAULT 'No description for this product yet'," +
                    "brand varchar(32)," +
                    "category varchar(32) NOT NULL," +
                    "rating decimal(3,1) DEFAULT 0," +
                    "discountPercentage int DEFAULT 0," +
                    "stock int DEFAULT 0," +
                    "thumbnail varchar(max)," +
                    "images varchar(max)," +
                    "price money NOT NULL," +
                    "CONSTRAINT CK_Discount CHECK (discountPercentage between 0 and 99), " +
                    "CONSTRAINT CK_Price CHECK (price>0), " +
                    "CONSTRAINT CK_Stock CHECK (stock>0)," +
                "PRIMARY KEY (id)); ", conn);
                create.ExecuteNonQuery();

            }

            catch
            {
                Response.Write("Pepe :(");

            }
            finally
            {
                conn.Close();
            }

            try
            {
                conn.Open();


                foreach (Global.Product product in Global.Storage.storage)
                {
                    SqlCommand insert = new SqlCommand("INSERT INTO Products (title, description, brand, category, rating, discountPercentage, stock, thumbnail, images, price) " +
                        "VALUES (@title, @description, @brand, @category, @rating, @discountPercentage, @stock, @thumbnail, @images, @price)", conn);

                    insert.Parameters.AddWithValue("@title", product.title);
                    insert.Parameters.AddWithValue("@description", product.description);
                    insert.Parameters.AddWithValue("@brand", product.brand);
                    insert.Parameters.AddWithValue("@category", product.category);
                    insert.Parameters.AddWithValue("@rating", product.rating);
                    insert.Parameters.AddWithValue("@discountPercentage", Math.Truncate(product.discountPercentage));
                    insert.Parameters.AddWithValue("@stock", product.stock);
                    insert.Parameters.AddWithValue("@thumbnail", product.thumbnail);
                    insert.Parameters.AddWithValue("@images", product.images[0]);
                    insert.Parameters.AddWithValue("@price", product.price);

                    insert.ExecuteNonQuery();
                }

            }
            catch (Exception ex)
            {
                Response.Write($"Si è verificato un errore di tipo {ex.GetType().Name}: {ex.Message}");
            }
            finally
            {
                conn.Close();
            }
        }

        protected void Admin_Btn(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
    }
}