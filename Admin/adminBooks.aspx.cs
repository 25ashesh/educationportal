using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace educationportal.com.Admin
{
    public partial class adminBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        protected void ButtonExcel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();

            Response.AppendHeader("content-disposition", "attachment;filename=FileName.xls");
            Response.ContentType = "application/excel";

            StringWriter stringWriter = new StringWriter();

            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);


            GridView1.HeaderRow.Style.Add("background-color", "#996699");
            foreach (TableCell tableCell in GridView1.HeaderRow.Cells)
            {
                tableCell.Style["background-color"] = "#ccffcc";
            }

            foreach (GridViewRow gridViewRow in GridView1.Rows)
            {
                gridViewRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                {
                    gridViewRowTableCell.Style["background-color"] = "#ffff2f";
                }

            }

            GridView1.RenderControl(htmlTextWriter);
            Response.Write(stringWriter.ToString());
            Response.End();

        }

        public override void VerifyRenderingInServerForm(Control control)
        {


        }
    }
}