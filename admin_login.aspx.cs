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
    public partial class admin_login : System.Web.UI.Page
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

            }
        }

        private void AdminLogin()
        {
            //login

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
                string str = " select * from login_user ";
                con.Open();
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (TextBox1.Text == dr["username"].ToString() && TextBox2.Text == dr["epassword"].ToString())
                    {
                        Session["Username"] = TextBox1.Text;
                        Response.Redirect("~/Admin/AddUser.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Something Wrong in Username or Password try Again')</script>");

                    }

                }

                dr.Close();

                con.Close();
                TextBox1.Text = "";
                TextBox2.Text = "";



            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AdminLogin();
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            AdminLogin();
        }
    }
}