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

namespace TestingEucationPortal
{
    public partial class Joinin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CheckAvailability_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;

            string conString = @"Data Source=localhost;Initial Catalog=educationportal;Integrated Security=True;Pooling=False";

            SqlConnection con = new SqlConnection();
            con.ConnectionString = conString;

            con.Open();

            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cmd.Connection = con;

            cmd = new SqlCommand("select * from userinfo where userName = '" + txtName.Text + "'", con);

            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblAvailability.Text = "Username already taken.. please try another!!";

                this.lblAvailability.ForeColor = Color.Red;

            }
            else
            {
                lblAvailability.Text = "Username is available!";
                this.lblAvailability.ForeColor = Color.BlueViolet;
            }
            con.Close();
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;

            string password = txtPassword.Text;

            string email = txtEmail.Text;

            string datejoined = DateTime.UtcNow.ToString();

            string conString = @"Data Source=localhost;Initial Catalog=educationportal;Integrated Security=True;Pooling=False";

            SqlConnection con = new SqlConnection();
            con.ConnectionString = conString;

            con.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblPasswordMatchingReport.Text = "Passwords don't match!";
                this.lblPasswordMatchingReport.ForeColor = Color.Red;
            }
            else
            {
                string query = "insert into userinfo (userName,password,joinedDate,emailAddress) values(@userName,@password,@joinedDate,@emailAddress)";

                cmd.Parameters.Add(new SqlParameter("@userName", name));
                cmd.Parameters.Add(new SqlParameter("@password", password));
                cmd.Parameters.Add(new SqlParameter("@joinedDate", datejoined));
                cmd.Parameters.Add(new SqlParameter("@emailAddress", email));

                cmd.CommandText = query;

                cmd.ExecuteNonQuery();

                Response.Redirect("Student.aspx");


                con.Close();
 
            }

        }
    }
}

//Data Source=localhost;Initial Catalog=educationportal;Integrated Security=True;Pooling=False