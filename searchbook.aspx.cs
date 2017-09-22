using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace educationportal.com
{
    public partial class searchbook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowSearch_Click(object sender, EventArgs e)
        {
            GridView2.DataBind();
        }
    }
}