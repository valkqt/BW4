using System;
using System.Collections.Generic;
namespace BW4
{
    public partial class Template : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cart"] != null)
            {
                int itemCount = ((List<Global.Product>)Session["cart"]).Count;
                cartCounter.InnerText = itemCount.ToString();
                if(cartCounter.InnerText == "0")
                {
                    cartCounter.Visible = false;
                }
            }
        }
    }
}