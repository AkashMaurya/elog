using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace elog
{
    public partial class submit_form : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                Calendar1.Visible = false;
                string Eyear = "2021-22";
                Label1.Text = Eyear;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")

            {
                Response.Write("<script>alert('Please Type Patient ID');</script>");
            }
            else if (TextBox3.Text == "")
            {
                Response.Write("<script>alert('Please Select the date');</script>");
            }

            else
            {
                //Save Record
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);
                DateTime date = DateTime.Now.Date;
                String query = "insert into Final_Record values ('" + Label1.Text + "','" + DropDownList1.Text + "','" + DropDownList2.Text + "','" + DropDownList3.Text + "','" + DropDownList4.Text + "', '" + DropDownList5.Text + "', '" + DropDownList6.Text + "','" + TextBox1.Text + "','" + DropDownList9.Text + "','" + DropDownList7.Text + "','" + DropDownList8.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "', 'Approval Required','No Remarks')";
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                //Response.Redirect("ActivateEmail.aspx?emailadd=" + TextBox3.Text);
                con.Close();
                Response.Write("<script>alert('Thank You For Using ElogBook , Your Data is Saved Successfully')</script>");
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
            if (e.Day.Date > DateTime.Today)
            {
                e.Day.IsSelectable = false;
            }
        }

    }
}