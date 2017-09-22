using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace TestingEucationPortal.Admin
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdminLogin_Click(object sender, EventArgs e)
        {
            string conString = @"Data Source=(local);Initial Catalog=educationportal;Integrated Security=True";

            SqlConnection con = new SqlConnection();
            con.ConnectionString = conString;

            con.Open();

            SqlCommand cmd = new SqlCommand("select * from admininfo where adminName =@username and adminPassword=@password", con);
            cmd.Parameters.AddWithValue("@username", txtAdmin.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                lblReport.Text = "Welcome";
                Session["Login"] = txtAdmin.Text;
                Session["AdminLogin"] = txtAdmin.Text;
                Response.Redirect("files.aspx"); //AdminPage.aspx


            }
            else
            {
                lblReport.Text = "Invalid Admin Credentials";
                Response.Redirect("../Default.aspx");
            }
        }
    }
}