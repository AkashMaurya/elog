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

namespace elog.Admin
{
    public partial class AddUser : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // Session["username"].ToString();
                con.Close();
                GridView1.Visible = true;
                showGrid();

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveData();
            showGrid();
        }

        private void SaveData()
        {
            if (TextBox1.Text == "")
            {
                Label1.Text = "Plese type UserName";
            }
            else if (TextBox2.Text == "")
            {
                Label1.Text = "Please type the User Password";
            }
            else
            {
                /*
                //creating  SqlCommand  object  
                com.CommandType = CommandType.StoredProcedure;  //here we declaring command type as stored Procedure  

                /* adding paramerters to  SqlCommand below 
                com.Parameters.AddWithValue("@username", TextBox1.Text);        //user Name  
                com.Parameters.AddWithValue("@epassword ", TextBox2.Text);     //Password  
                com.Parameters.AddWithValue("@userType ", DropDownList1.Text.ToString());       //User Type 

                */

                con.Open();
                String query = "insert into login_user values ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + DropDownList1.Text + "')";         //query name   
                SqlCommand com = new SqlCommand(query, con);
                com.ExecuteNonQuery();                     //executing the sqlcommand  
                Label1.Visible = true;
                Label1.Text = "Records are Submitted Successfully";
                con.Close();
            }

        }

        private void showGrid()
        {
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("Select * From login_user", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            object DataSource1 = null;
            GridView1.DataSource = DataSource1;
            GridView1.DataBind();
            con.Close();
        }
    }

}
