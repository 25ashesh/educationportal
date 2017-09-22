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

namespace TestingEucationPortal
{
    public partial class Schoolqb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("File", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("Type", typeof(string));
            //dt.Columns.Add("Description", typeof(string));
            //dt.Columns.Add("Date Added",typeof(DateTime));
            //dt.Columns.Add("Uploaded By",typeof(string));

            foreach (string strFile in Directory.GetFiles(Server.MapPath("~/Data")))
            {
                FileInfo fi = new FileInfo(strFile);

                dt.Rows.Add(fi.Name, ConvertToKb(fi.Length), GetFileTypeByExtension(fi.Extension));
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        static double ConvertToKb(long bytes)
        {
            return (Math.Round(bytes / 1024f));
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Data/") + FileUpload1.FileName);

                string conString = @"Data Source=localhost;Initial Catalog=userinfo;Integrated Security=True;Pooling=False";
                SqlConnection con = new SqlConnection();
                con.ConnectionString = conString;
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                string query = "insert into Files (FileName) values(@Filename)";

                cmd.Parameters.Add(new SqlParameter("@Filename", FileUpload1.FileName));

                cmd.CommandText = query;

                cmd.ExecuteNonQuery();

                con.Close();

            }

            DataTable dt = new DataTable();
            dt.Columns.Add("File", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("Type", typeof(string));
            //dt.Columns.Add("Description", typeof(string));
            //dt.Columns.Add("Date Added",typeof(DateTime));
            //dt.Columns.Add("Uploaded By",typeof(string));

            foreach (string strFile in Directory.GetFiles(Server.MapPath("~/Data")))
            {
                FileInfo fi = new FileInfo(strFile);

                dt.Rows.Add(fi.Name, (fi.Length), GetFileTypeByExtension(fi.Extension));
            }


            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        private string GetFileTypeByExtension(string extension)
        {
            switch (extension.ToLower())
            {

                case ".pdf":
                    return "Portable Document File";


                case ".ppt":
                case ".pptx":
                    return "Microsoft Powerpoint Document";

                case ".doc":
                case ".docx":
                    return "Microsoft Word Document";

                case ".zip":
                    return "Zipped Folder";

                case ".jpeg":
                case ".jpg":
                    return "Image";

                case ".txt":
                    return "Text File";

                default:
                    return "Unknown";
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.Clear();

                Response.ContentType = "application/octet-stream";

                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);

                Response.TransmitFile(Server.MapPath("~/Data/") + e.CommandArgument);

                Response.End();
            }
        }

    }
}