using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

        protected void Btn_Logout(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["password"] = null;
            Response.Redirect("Home.aspx");
        }
    }
}