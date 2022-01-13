using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace elog
{
    public partial class student_login : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                con.Close();
                Label1.Text = "";

            }

        }
        
        private void stu_login()
        { 
            if (TextBox1.Text == "")
            {
                Response.Write("<script>alert('please type the Username')</script>");
            }

            else if (TextBox2.Text == "")
            {
                Response.Write("<script>alert('please type the password')</script>");
            }

            else
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);
                string str = " select * from ELogGroupStudent ";
                con.Open();
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (TextBox1.Text == dr["Username"].ToString() && TextBox2.Text == dr["Password"].ToString())
                    {
                        Session["username"] = TextBox1.Text;
                        Response.Redirect("~/Student/student_front_page.aspx");

                    }
                    else
                    {
                        Label1.Text = "Something Wrong in Username or Password try Again";

                    }

                }

                dr.Close();

                con.Close();
                TextBox1.Text = "";
                TextBox2.Text = "";

            }
            
           // stu_login();

        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {

            stu_login();

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            stu_login();
        }
    }
}