using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
namespace TestingEucationPortal
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSubmit_Click1(object sender, EventArgs e)
        {
            string email = txtEmail.Text;

            string message = CommentTextBox.Text;

            string datesent = DateTime.UtcNow.ToString();


            string conString = @"Data Source=localhost;Initial Catalog=educationportal;Integrated Security=True;Pooling=False";

            SqlConnection con = new SqlConnection();
            con.ConnectionString = conString;

            con.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

                string query = "insert into Message(Email,Message,Date) values(@Email,@Message,@Date)";

                cmd.Parameters.Add(new SqlParameter("@Email", email));
                cmd.Parameters.Add(new SqlParameter("@Message", message));
                cmd.Parameters.Add(new SqlParameter("@Date", datesent));

                cmd.CommandText = query;

                cmd.ExecuteNonQuery();

                lblMessageSend.Text = "Thank you! your message has been sent!";
                this.lblMessageSend.ForeColor = Color.BlueViolet;

                con.Close();

            }
        }
}


//Data Source=localhost;Initial Catalog=educationportal;Integrated Security=True;Pooling=False