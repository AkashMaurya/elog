using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace elog.Staff
{
    public partial class View_Data : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con.Close();
                GridView1.Visible = true;
                if (TextBox2.Text != "")
                {

                    this.text_Search();

                }
                else
                {
                    this.ShowData();
                }

            }
        }

        private void text_Search()
        {
            if (TextBox2.Text == "")
            {
                ShowData();
            }
            else
            {
                //  string query = "SELECT [EYear],[Log_Year],[Department] ,[EGroup],[ELogGroupStudent],[Doctor_Name] ,[Training_Site],[PatientID],[Participation_Type] ,[Activity_Type],[Core_Diag_Sess],[Type_Desc],[EDate] ,[Current_Status] ,[Remarks] FROM [ELogBook].[dbo].[Final_Record] where freetext ([EYear],'%" + TextBox2.Text + "%') OR freetext ([Log_Year],'%" + TextBox2.Text + "%') OR freetext ([Department],'%" + TextBox2.Text + "%') OR freetext ([EGroup],'%" + TextBox2.Text + "%') OR freetext ([ELogGroupStudent],'%" + TextBox2.Text + "%') OR freetext ([Doctor_Name],'%" + TextBox2.Text + "%') OR freetext ([Training_Site],'%" + TextBox2.Text + "%') OR freetext ([Participation_Type],'%" + TextBox2.Text + "%') OR freetext ([Activity_Type],'%" + TextBox2.Text + "%') OR freetext ([Core_Diag_Sess],'%" + TextBox2.Text + "%') OR freetext ([Type_Desc],'%" + TextBox2.Text + "%') OR freetext ([EDate],'%" + TextBox2.Text + "%') OR freetext ([Current_Status],'%" + TextBox2.Text + "%') OR freetext ([Remarks],'%" + TextBox2.Text + "%') ";
                string query = "SELECT Distinct [Id], [EYear], [Log_Year], [Department], [EGroup], [ELogGroupStudent], [Doctor_Name], [Training_Site] , [PatientID] ,[Activity_Type], [Core_Diag_Sess], [Type_Desc] , [Participation_Type], [EDate] , [Current_Status], [Remarks] FROM [ELogBook].[dbo].[Final_Record] where freetext ([EYear],'%" + TextBox2.Text + "%') OR freetext ([Log_Year],'%" + TextBox2.Text + "%') OR freetext ([Department],'%" + TextBox2.Text + "%') OR freetext ([EGroup],'%" + TextBox2.Text + "%') OR freetext ([ELogGroupStudent],'%" + TextBox2.Text + "%') OR freetext ([Doctor_Name],'%" + TextBox2.Text + "%') OR freetext ([Training_Site],'%" + TextBox2.Text + "%') OR freetext ([Participation_Type],'%" + TextBox2.Text + "%') OR freetext ([Activity_Type],'%" + TextBox2.Text + "%') OR freetext ([Core_Diag_Sess],'%" + TextBox2.Text + "%') OR freetext ([Type_Desc],'%" + TextBox2.Text + "%') OR freetext ([EDate],'%" + TextBox2.Text + "%') OR freetext ([Current_Status],'%" + TextBox2.Text + "%') OR freetext ([Remarks],'%" + TextBox2.Text + "%')";
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
        }



        private void ShowData()
        {
            string connection = (ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);
            using (SqlConnection con = new SqlConnection(connection))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT [EYear],[Log_Year],[Department],[EGroup],[ELogGroupStudent],[Doctor_Name],[Training_Site],[PatientID],[Participation_Type],[Activity_Type],[Core_Diag_Sess],[Type_Desc],[EDate],[Current_Status],[Remarks] FROM [ELogBook].[dbo].[Final_Record]"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                        }
                    }
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //search
            this.text_Search();
        }



        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (TextBox2.Text != "")
            {
                GridView1.PageIndex = e.NewPageIndex;
                this.text_Search();

            }
            else
            {
                GridView1.PageIndex = e.NewPageIndex;
                this.ShowData();
            }
        }



        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            this.text_Search();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {/*
            //update
            int columnsCount = GridView1.HeaderRow.Cells.Count;

            // Create the PDF Table specifying the number of columns

            iTextSharp.text.pdf.PdfPTable pdfTable = new PdfPTable(columnsCount);


            GridView1.AllowPaging = false;
            this.text_Search();
            // Loop thru each cell in GrdiView header row

            foreach (TableCell gridViewHeaderCell in GridView1.HeaderRow.Cells)

            {

                // Create the Font Object for PDF document

                Font font = new Font();

                // Set the font color to GridView header row font color

                font.Color = new BaseColor(GridView1.HeaderStyle.ForeColor);



                // Create the PDF cell, specifying the text and font

                PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewHeaderCell.Text, font));



                // Set the PDF cell backgroundcolor to GridView header row BackgroundColor color

                pdfCell.BackgroundColor = new BaseColor(GridView1.HeaderStyle.BackColor);



                // Add the cell to PDF table

                pdfTable.AddCell(pdfCell);

            }



            // Loop thru each datarow in GrdiView

            foreach (GridViewRow gridViewRow in GridView1.Rows)

            {

                if (gridViewRow.RowType == DataControlRowType.DataRow)

                {

                    // Loop thru each cell in GrdiView data row

                    foreach (TableCell gridViewCell in gridViewRow.Cells)

                    {

                        Font font = new Font();

                        font.Size = 9;

                        font.Color = new BaseColor(GridView1.RowStyle.ForeColor);
                        PdfPCell pdfCell = new PdfPCell(new Phrase(gridViewCell.Text, font));
                        pdfCell.BackgroundColor = new BaseColor(GridView1.RowStyle.BackColor);
                        pdfTable.AddCell(pdfCell);

                    }

                }

            }



            // Create the PDF document specifying page size and margins

            Document pdfDocument = new Document(PageSize.A4.Rotate(), 8f, 8f, 8f, 8f);
            PdfWriter.GetInstance(pdfDocument, Response.OutputStream);
            pdfDocument.Open();
            pdfDocument.Add(pdfTable);
            pdfDocument.Close();
            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition", "attachment;filename=logbookreport.pdf");
            Response.Write(pdfDocument);
            Response.Flush();
            Response.End();
            */

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    //To Export all pages
                    GridView1.AllowPaging = false;
                    this.text_Search();

                    GridView1.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    //Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
                    Document pdfDoc = new Document(PageSize.A4.Rotate(), 8f, 8f, 8f, 8f);

                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();

                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void exportexcel(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=logbookreport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView1.AllowPaging = false;
                this.text_Search();

                GridView1.HeaderRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = System.Drawing.Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
    }
}

