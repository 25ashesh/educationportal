using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;

namespace TestingEucationPortal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string conString = @"Data Source=localhost;Initial Catalog=educationportal;Integrated Security=True;Pooling=False";

            SqlConnection con = new SqlConnection();
            con.ConnectionString = conString;

            con.Open();

            SqlCommand cmd = new SqlCommand("select * from userinfo where emailAddress =@emailAddress and password=@password", con);
            cmd.Parameters.AddWithValue("@emailAddress", txtEmail.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                Session["Login"] = txtEmail.Text;
                Response.Redirect("Student.aspx");

            }
            else
            {
                lblErrorMessage.Text = "Invalid Username and Password";
                this.lblErrorMessage.ForeColor = Color.Red;
            }
        }
    }
}