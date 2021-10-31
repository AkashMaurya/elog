using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;
using System.Data;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace elog.Admin
{
    public partial class View_Data : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con.Close();
                GridView1.Visible = true;
                showGrid();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Submit
            BindGrid();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Export In PDF
            ExportPDf();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //Export in Excel
            ExportExcel();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
            return;
        }




        private void BindGrid()
        {
            string query = " select * from Final_Record where freetext (*,'%" + TextBox1.Text + "%')";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.Visible = true;
                        GridView1.DataBind();
                    }
                }
            }
        }

        private void showGrid()
        {
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("Select * From Final_Record", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            object DataSource2 = null;
            GridView1.DataSource = DataSource2;
            GridView1.DataBind();
            con.Close();
        }





        private void ExportPDf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=print.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            //panelPDF.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
            HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();
            htmlParser.Parse(sr);
            pdfDoc.Close();

            Response.Write(pdfDoc);
            Response.End();
        }


        private void ExportExcel()
        {/*
            // Clear all content output from the buffer stream
            Response.ClearContent();




            // Specify the default file name using "content-disposition" RESPONSE header
            Response.AppendHeader("content-disposition", "attachment; filename=AguELogReport.xls");
            // Set excel as the HTTP MIME type
            Response.ContentType = "application/excel";

            // Create an instance of stringWriter for writing information to a string
            StringWriter stringWriter = new StringWriter();
            // Create an instance of HtmlTextWriter class for writing markup 
            // characters and text to an ASP.NET server control output stream
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

            // Set white color as the background color for gridview header row
            GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");

            // Set background color of each cell of GridView1 header row
            foreach (TableCell tableCell in GridView1.HeaderRow.Cells)
            {
                tableCell.Style["background-color"] = "#A55129";
            }

            // Set background color of each cell of each data row of GridView1
            foreach (GridViewRow gridViewRow in GridView1.Rows)
            {
                gridViewRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                {
                    gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
                }
            }

            GridView1.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.End(); */
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            BindGrid();
        }
    }
}