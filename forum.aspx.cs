using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace TestingEucationPortal
{
    public partial class forum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Post_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/forum.aspx");
            LabelReportPostAdded.Text = "Thank you! Your post has been added!";
            this.LabelReportPostAdded.ForeColor = System.Drawing.Color.BlueViolet;

        }

        protected void ButtonComment_Click(object sender, EventArgs e)
        {
            if (txtComment.Text != null)
            {
                string conString = @"Data Source=localhost;Initial Catalog=educationportal;Integrated Security=True;Pooling=False";

                SqlConnection con = new SqlConnection();
                con.ConnectionString = conString;

                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                string feedback = txtComment.Text;
                string commenter = txtCommenter.Text;
                string datecommented = DateTime.UtcNow.ToString();


                string query = "INSERT Feedback(Feedback,Commenter,CommentedDate) Values(@Feedback,@Commenter,@CommentedDate)";
                cmd.Parameters.AddWithValue("@Feedback", feedback);
                cmd.Parameters.AddWithValue("@Commenter", commenter);
                cmd.Parameters.AddWithValue("@CommentedDate", datecommented);
                cmd.CommandText = query;


                cmd.ExecuteNonQuery();

                con.Close();
                lblCommentAdded.Text = "Thanks your comment has been added!";
                Response.Redirect("forum.aspx");
            }
            else
            {
                lblCommentAdded.Text = "You cannot comment with empty fields";
                this.lblCommentAdded.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}