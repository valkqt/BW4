using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace BW4
{
    public partial class BackOffice : System.Web.UI.Page
    {

        string connectionString = ConfigurationManager.ConnectionStrings["Products"].ToString();
        SqlConnection con;
        SqlDataAdapter adapt;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/Home.aspx");
            }
            if (Session["username"].ToString() != "admin")
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                ShowData();
            }
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
            return;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                con = new SqlConnection(connectionString);
                con.Open();
                Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_id") as Label;

                SqlCommand cmd = new SqlCommand($"delete from Products where id={id.Text}", con);
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                con.Close();
                GridView1.EditIndex = -1;

                ShowData();
            }
            catch (Exception ex)
            {
                ErrorBox.Visible = true;
                lbl_error.Text = "Error: " + ex.Message;

            }
            finally
            {
                con.Close();
            }
        }

        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_id") as Label;
            TextBox title = GridView1.Rows[e.RowIndex].FindControl("lbl_title") as TextBox;
            TextBox price = GridView1.Rows[e.RowIndex].FindControl("lbl_price") as TextBox;
            TextBox category = GridView1.Rows[e.RowIndex].FindControl("lbl_category") as TextBox;
            TextBox brand = GridView1.Rows[e.RowIndex].FindControl("lbl_brand") as TextBox;
            TextBox discount = GridView1.Rows[e.RowIndex].FindControl("lbl_discount") as TextBox;
            TextBox description = GridView1.Rows[e.RowIndex].FindControl("lbl_description") as TextBox;
            TextBox stock = GridView1.Rows[e.RowIndex].FindControl("lbl_stock") as TextBox;

            try
            {
                con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Products set title='" + title.Text +
                    "',price='" + price.Text.Replace(',', '.') +
                    "',description='" + description.Text +
                    "',stock='" + stock.Text +
                    "',discountPercentage='" + discount.Text +
                    "',brand='" + brand.Text +
                    "',category='" + category.Text +
                    "' where id=" + Convert.ToInt32(id.Text), con);
                cmd.ExecuteNonQuery();
                GridView1.EditIndex = -1;
                ShowData();
            }
            catch (Exception ex)
            {
                ErrorBox.Visible = true;
                lbl_error.Text = "Error: " + ex.Message;

            }
            finally
            {
                con.Close();

            }
        }
        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ShowData();
        }

        protected void ShowData()
        {
            dt = new DataTable();
            con = new SqlConnection(connectionString);
            try
            {
                con.Open();
                adapt = new SqlDataAdapter("" +

                    "Select id, title, price,description,  category, brand, discountPercentage, images, stock from Products", con);
                adapt.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                ErrorBox.Visible = true;
                lbl_error.Text = "Error: " + ex.Message;
            }
            finally
            {
                con.Close();

            }
        }

        public int ValidateDiscount(string discount)
        {
            int discint;
            if (int.TryParse(discount, out discint))
            {
                return discint;
            }
            else
            {
                return 0;
            }

        }

        public bool ValidateInputs()
        {
            if (String.IsNullOrEmpty(add_title.Text))
            {
                return false;
            }
            if (String.IsNullOrEmpty(add_category.Text))
            {
                return false;
            }
            if (String.IsNullOrEmpty(add_price.Text))
            {
                return false;
            }
            if (String.IsNullOrEmpty(add_stock.Text))
            {
                return false;
            }
            return true;

        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(connectionString);

                con.Open();
                string title = add_title.Text;
                string category = add_category.Text;
                string brand = add_brand.Text;
                string discount = add_discount.Text;
                string images = add_images.Text;
                string description = add_description.Text;
                string price = add_price.Text.Replace(',', '.');
                string stock = add_stock.Text;

                bool valid = ValidateInputs();
                if (!valid)
                {
                    throw new Exception("Risultano uno o più campi richiesti non inseriti. Campi Richiesti: Title, Price, Stock, Category");
                }

                SqlCommand insert = new SqlCommand("INSERT INTO Products (title, description, brand, category, stock, discountPercentage, thumbnail, images, price) " +
                    "VALUES (@title, @description, @brand, @category, @stock, @discountPercentage, @thumbnail, @images, @price)", con);

                insert.Parameters.AddWithValue("@title", title);
                insert.Parameters.AddWithValue("@description", description);
                insert.Parameters.AddWithValue("@brand", brand);
                insert.Parameters.AddWithValue("@category", category);
                insert.Parameters.AddWithValue("@discountPercentage", discount);
                insert.Parameters.AddWithValue("@stock", int.Parse(stock));
                insert.Parameters.AddWithValue("@images", images);
                insert.Parameters.AddWithValue("@thumbnail", "");
                insert.Parameters.AddWithValue("@price", price);

                insert.ExecuteNonQuery();
                SuccessBox.Visible = true;
                ShowData();



            }
            catch (Exception ex)
            {
                ErrorBox.Visible = true;
                lbl_error.Text = "Error: " + ex.Message;


            }
            finally
            {
                con.Close();
            }

        }

        public void CloseAlert(object sender, EventArgs e)
        {
            ErrorBox.Visible = false;
            SuccessBox.Visible = false;

        }
    }
}