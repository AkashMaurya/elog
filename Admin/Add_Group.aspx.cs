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
    public partial class Add_Group : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                con.Close();
                GridView1.Visible = true;
                showGrid();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Label1.Text = "Please type the Department ";
            }
            else
            {
                SaveData();
                showGrid();
                TextBox1.Text = "";
            }

        }

        private void SaveData()
        {
            con.Open();
            String query = "insert into ELogGroup values ('" + DropDownList1.Text + "','" + DropDownList2.Text + "','" + TextBox1.Text + "')";         //Qyery name   
            SqlCommand com = new SqlCommand(query, con);  //creating  SqlCommand  object            
            com.ExecuteNonQuery();                     //executing the sqlcommand  
            con.Close();
            Label1.Visible = true;
            Label1.Text = "Records are Submitted Successfully";

        }

        private void showGrid()
        {
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("Select * From ELogGroup", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            object DataSource3 = null;
            GridView1.DataSource = DataSource3;
            GridView1.DataBind();
            con.Close();
        }
    }
}