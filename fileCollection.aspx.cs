using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace educationportal.com
{
    public partial class fileCollection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if a user is logged in
            if (Session["Login"] == null)
            {
                lblLoginCheck.Text = "You must login to download!!";
                this.lblLoginCheck.ForeColor = Color.Red;
                
                //Response.Redirect("Login.aspx");

                System.Threading.Thread.Sleep(5000);
                Response.Redirect("Login.aspx");

            }
            else
            {
                lblLoginCheck.Visible = false;
                
            }
        }

        string conString = @"Data Source=(local);Initial Catalog=educationportal;Integrated Security=True";


        protected void btnAdd_Click(object sender, EventArgs e)
        {


            if (upFile.HasFile)
            {
                AddFile(upFile.FileName, upFile.FileContent);
                GridView1.DataBind();
            }

        }

        void AddFile(string fileName, Stream upload)
        {
            string info = txtFileInfo.Text;
            string dateAdded = DateTime.UtcNow.ToString();
            string uploader = txtFileUploader.Text;

            string fileCategory = DropDownListCategory.SelectedValue.ToString();
            string fileSection = DropDownListSection.SelectedValue.ToString();
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("INSERT Fileo (FileName,fileCategory,fileSection,fileAdded,fileDescription,Uploader) Values (@FileName,@fileCategory,@fileSection,@fileAdded,@fileDescription,@Uploader);" + "SELECT @Identity = SCOPE_IDENTITY()", con);
            cmd.Parameters.AddWithValue("@FileName", fileName);
            cmd.Parameters.AddWithValue("@fileCategory", fileCategory);
            cmd.Parameters.AddWithValue("@fileSection", fileSection);
            cmd.Parameters.AddWithValue("@fileAdded", dateAdded);
            cmd.Parameters.AddWithValue("@fileDescription", info);
            cmd.Parameters.AddWithValue("@Uploader", uploader);
            SqlParameter idParm = cmd.Parameters.Add("@Identity", SqlDbType.Int);
            idParm.Direction = ParameterDirection.Output;
            using (con)
            {
                con.Open();
                cmd.ExecuteNonQuery();
                int newFileId = (int)idParm.Value;
                StoreFile(newFileId, upload, con);
            }
        }
        void StoreFile(int fileId, Stream upload, SqlConnection connection)
        {
            int bufferLen = 8040;
            BinaryReader br = new BinaryReader(upload);
            byte[] chunk = br.ReadBytes(bufferLen);
            SqlCommand cmd = new SqlCommand("UPDATE Fileo SET FileBytes=@Buffer WHERE Id=@FileId", connection);
            cmd.Parameters.AddWithValue("@FileId", fileId);
            cmd.Parameters.Add("@Buffer", SqlDbType.VarBinary, bufferLen).Value = chunk;
            cmd.ExecuteNonQuery();
            SqlCommand cmdAppend = new SqlCommand("UPDATE Fileo SET FileBytes.WRITE(@Buffer,NULL, 0) WHERE Id=@FileId", connection);
            cmdAppend.Parameters.AddWithValue("@FileId", fileId);
            cmdAppend.Parameters.Add("@Buffer", SqlDbType.VarBinary, bufferLen);
            chunk = br.ReadBytes(bufferLen);
            while (chunk.Length > 0)
            {
                cmdAppend.Parameters["@Buffer"].Value = chunk;
                cmdAppend.ExecuteNonQuery();
                chunk = br.ReadBytes(bufferLen);
            }
            br.Close();

            lblFileAcknowledge.Text = "Thanks! Your file has been added!";
            this.lblFileAcknowledge.ForeColor = Color.YellowGreen;
        }

        protected void ShowButton_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string book = TextBox1.Text;
            SqlConnection con = new SqlConnection(conString);

            if (book != null)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT SuggestedBooks(BookName) Values(@BookName)", con);
                cmd.Parameters.AddWithValue("@BookName", book);
                cmd.ExecuteNonQuery();
                con.Close();

                lblFileAcknowledge.Text = "Thanks! Your suggestion has been added!";
                this.lblFileAcknowledge.ForeColor = Color.YellowGreen;

            }
            else
            {
                lblFileAcknowledge.Text = "Oops! Your suggestion wasn't sent please specify a book name!";
                this.lblFileAcknowledge.ForeColor = Color.Red;
            }


        }


    }
}