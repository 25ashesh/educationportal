using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace educationportal.com.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLogin"] != null)
            {
                lblLoginStatus.Text = "Welcome!" + Session["Login"].ToString();
                lblLoginStatus.Visible = true;

                LinkButton1.Text = " logout";
            }

        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/Default.aspx");
        //}

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

                //admin logs out
                Session.Clear();
                Response.Redirect("../Default.aspx");

        }
    }
}