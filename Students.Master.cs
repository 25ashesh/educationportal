using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestingEucationPortal.Education
{
    public partial class Students : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if a user is logged in

            if (Session["Login"] != null)
            {
                lblLoginStatus.Text = "Welcome" + Session["Login"].ToString();
                lblLoginStatus.Visible = true;

                LinkButton1.Text = "logout";
            }
            else 
            {
                lblLoginStatus.Visible = false;
                LinkButton1.Text = "login";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (LinkButton1.Text == "login")
            {
                Response.Redirect("Login.aspx");
            }
            else 
            {
                //user logs out
                Session.Clear();
                Response.Redirect("Default.aspx");
            }
        }



    }
}