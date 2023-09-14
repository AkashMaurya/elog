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

namespace elog.Student
{
    public partial class Form : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {

                Calendar1.Visible = true;
                //string Eyear = "2021-22";

                DateTime today = DateTime.Today;
                DateTime minDate = today.AddDays(-10);

                Calendar1.TodaysDate = today;
                Calendar1.SelectedDate = today;
                Calendar1.VisibleDate = today;
                


                Label4.Text = Session["username"].ToString();
                Label1.Text = Session["year"].ToString();
                //ShowDetail();
                con.Open();
                string str = "SELECT * FROM ELogGroupStudent where Username = '" + Session["username"].ToString() + "' and EYear='" + Session["year"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                // Label1.Text = sdr["EYear"].ToString();
                Label1.Text = sdr["EYear"].ToString();
                Label2.Text = sdr["Log_Year"].ToString();
                Label3.Text = sdr["EGroup"].ToString();
                Label4.Text = sdr["ELogGroupStudent"].ToString();

                sdr.Close();
                con.Close();



            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //submit form

            SaveData();
        }

        private void SaveData()
        {
            if (TextBox3.Text == "")
            {
                Response.Write("<script>alert('Please Select the date');</script>");
            }

            else
            {
                //Save Record
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);
                DateTime date = DateTime.Now.Date;
                String query = "insert into Final_Record values ('" + Label1.Text + "', '" + Label2.Text + "', '" + DropDownList2.Text + "', '" + Label3.Text + "', '" + Label4.Text + "','" + DropDownList5.Text + "', '" + DropDownList6.Text + "' , '" + TextBox1.Text + "' , '" + DropDownList7.Text + "' , '" + DropDownList8.Text + "' , '" + TextBox2.Text + "' , '" + DropDownList9.Text + "' , '" + TextBox3.Text + "' , 'Approval Required' , 'No Remarks' )";
                con.Open();
                SqlCommand cmd = new SqlCommand(query,con);
           
                cmd.ExecuteNonQuery();               
                con.Close();
                Response.Write("<script> alert('Thank You For Using ElogBook , Your Data is Saved Successfully')</script>");
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                con.Close();
                //  Label2.Text = "Your LookBook Has Been Saved Successfully"; 
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox3.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.Visible = false;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime minDate = DateTime.Today.AddDays(-10);
            
            if(e.Day.Date <minDate || e.Day.Date>DateTime.Today)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Gray;
            }
          
        }

        private void DisplaySelectedData()
        {
            
        }
    }
}