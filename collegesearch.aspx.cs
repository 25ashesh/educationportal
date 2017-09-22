using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace educationportal.com
{
    public partial class collegesearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Refresh_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("collegesearch.aspx");
        }
    }
}