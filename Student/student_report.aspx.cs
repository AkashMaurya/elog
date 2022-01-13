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
using System.Text;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace elog.Student
{
    public partial class student_report : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                BindGrid();
                Label4.Text = Session["username"].ToString();               
                con.Open();
                string str = "SELECT * FROM ELogGroupStudent where Username = '" + Session["username"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                Label1.Text = sdr["EYear"].ToString();
                Label2.Text = sdr["Log_Year"].ToString();
                Label3.Text = sdr["EGroup"].ToString();
                Label4.Text = sdr["ELogGroupStudent"].ToString();
                sdr.Close();
                con.Close();
                
            }
        }

        //[Obsolete]
        protected void Button1_Click(object sender, EventArgs e)
        {        
            Savepdf();
        }

        private void Savepdf()
        {
            int columnsCount = GridView1.HeaderRow.Cells.Count;

            // Create the PDF Table specifying the number of columns

            PdfPTable pdfTable = new PdfPTable(columnsCount);



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

        }


        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Show Detail
            BindGrid();
        }



        private void BindGrid()
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Final_Record where EYear = '" + Label1.Text + "'  And  Log_Year ='" + Label2.Text + "'  And  EGroup ='" + Label3.Text + "' And  ELogGroupStudent ='" + Label4.Text + "' And  Activity_Type ='" + DropDownList1.Text.ToString() + "' And Current_Status = 'Approval Required '"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {

                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                     
                        GridView2.DataSource = dt;
                        GridView2.DataBind();
                        GridView2.Visible = true;
                    }
                }
            }

            con.Close();
        }

       

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label Id = GridView2.Rows[e.RowIndex].FindControl("Label1") as Label;
            String updatedata = "delete from Final_Record where Id ='" + Id.Text + "'";

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Label1.Text = "Row Data Has Been Deleted Successfully";
            GridView2.EditIndex = -1;
            SqlDataSource4.DataBind();
            GridView2.DataSource = SqlDataSource4;
            GridView2.DataBind();
        }
    }
    
}
