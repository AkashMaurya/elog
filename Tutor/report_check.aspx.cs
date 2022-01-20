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

namespace elog.Tutor
{
    public partial class report_check : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Label4.Text = Session["username"].ToString();

                //ShowDetail();

                con.Open();
                string str = "SELECT * FROM Doctor where Username = '" + Session["username"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                Label4.Text = sdr["Username"].ToString();
                Label2.Text = sdr["Doctor_Name"].ToString();
                Label3.Text = sdr["Department"].ToString();

                sdr.Close();
                con.Close();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //for show data
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //submit Data
        }
    }
}