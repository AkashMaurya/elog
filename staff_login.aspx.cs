﻿using System;
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
    public partial class staff_login : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
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
                string str = " select * from login_user ";
                con.Open();
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (TextBox1.Text == dr["username"].ToString() && TextBox2.Text == dr["epassword"].ToString())
                    {
                        Session["Username"] = TextBox1.Text;
                        Response.Redirect("~/Staff/Staff_ViewData.aspx");
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
        }
    }
}