using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.IO;

namespace elog.Tutor
{
    public partial class Tutor_profile : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

               
                //ShowDetail();
                con.Open();
                string str = "SELECT * FROM Doctor where Username = '" + Session["username"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                lblID.Text = sdr["Id"].ToString();
                Label1.Text = sdr["EYear"].ToString();
                Label2.Text = sdr["Log_Year"].ToString();
                Label3.Text = sdr["Department"].ToString();
                Label4.Text = sdr["Doctor_Name"].ToString();
                Label5.Text = sdr["Username"].ToString();
                TextBox1.Text = sdr["Password"].ToString();



                sdr.Close();
                con.Close();
              


            }
        }

      
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            //update data

            con.Open();
            SqlCommand cmd = new SqlCommand("Update Doctor set Password = '" + TextBox1.Text + "' where id= '" + lblID.Text + "' ", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Label6.Text = "Record updated successfully";
        }
    }
}