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
    public partial class Add_ActivityType_and_Description : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Text = "";
                con.Close();
                GridView2.Visible = true;
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
            string data = TextBox1.Text;
            try
            {
                con.Open();
                String query = "insert into Department_Activity values ('" + DropDownList1.Text + "','" + DropDownList2.Text + "','" + DropDownList3.Text + "','" + DropDownList4.Text + "','" + data + "')";         //Qyery name   
                SqlCommand com = new SqlCommand(query, con);  //creating  SqlCommand  object            
                com.ExecuteNonQuery();                     //executing the sqlcommand  
                con.Close();
                Label1.Visible = true;
                Label1.Text = "Records are Submitted Successfully";
            }
            catch (Exception ex)
            {
                ex.ToString();
            }

        }

        private void showGrid()
        {
            try
            {
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter("Select * From Department_Activity", con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                object DataSource1 = null;
                GridView2.DataSource = DataSource1;
                GridView2.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }
    }
}