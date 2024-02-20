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
                BindData();
            }
        }
        protected void BindData()
        {
            // Connect to database
            string connectionString = ConfigurationManager.ConnectionStrings["Products"].ToString();
            // Query for data
            string query = @"WITH RankedProducts AS (
                                SELECT 
                                    title, 
                                    category,
                                    thumbnail,
                                    ROW_NUMBER() OVER (PARTITION BY p.category ORDER BY p.title) AS RowNum
                                FROM 
                                    Products p
                                )
                            SELECT TOP 6 category, title, thumbnail 
                            FROM 
                                RankedProducts
                            WHERE 
                                RowNum = 1;";

            // Get connection
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();
                SqlCommand cmdSelectCategories = new SqlCommand(query, conn);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmdSelectCategories);
                DataTable dataTable = new DataTable();

                dataAdapter.Fill(dataTable);
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
    }
}

