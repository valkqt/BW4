using System;


namespace BW4
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Login(object sender, EventArgs e)
        {
            string username = TxtUsername.Text;
            string password = TxtPassword.Text;
            Session["username"] = username;
            Session["password"] = password;
            Response.Redirect("Home.aspx");
        }
    }
}