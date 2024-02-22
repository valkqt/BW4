using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BW4
{
    public partial class Template : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cart"] != null)
            {
                int itemCount = ((List<Product>)Session["cart"]).Count;
                cartCounter.InnerText = itemCount.ToString();
                if(cartCounter.InnerText == "0")
                {
                    cartCounter.Visible = false;
                }
            }
        }
    }
}