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

namespace elog.Student
{
    public partial class student_profile : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null && Session["year"] != null)
                {
                    try
                    {
                        string username = Session["username"].ToString();
                        string year = Session["year"].ToString();

                        con.Open();
                        string query = "SELECT * FROM ELogGroupStudent WHERE Username = @Username AND EYear = @EYear";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@EYear", year);

                        SqlDataReader sdr = cmd.ExecuteReader();

                        if (sdr.Read())
                        {
                            lblID.Text = sdr["Id"].ToString();
                            TextBox2.Text = sdr["EYear"].ToString();
                            TextBox3.Text = sdr["Log_Year"].ToString();
                            TextBox4.Text = sdr["EGroup"].ToString();
                            TextBox5.Text = sdr["ELogGroupStudent"].ToString();
                            TextBox6.Text = sdr["Username"].ToString();
                            TextBox7.Text = sdr["Password"].ToString();

                            showGrid();
                            GridView1.Visible = true;
                        }
                        else
                        {
                            // Handle the case where the data was not found
                            // You can display an error message or take other appropriate action.
                            // For example:
                            // lblMessage.Text = "Data not found.";
                        }

                        sdr.Close();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                        // Handle any exceptions that may occur (e.g., database connection error)
                        // For example:
                        // lblMessage.Text = "An error occurred: " + ex.Message;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    // Handle the case where Session variables are not set
                    // You can redirect to a login page or take other appropriate action.
                    // For example:
                    // Response.Redirect("Login.aspx");
                }
            
            }
 
        }



            private void showGrid()
            {
            string query = "Select [Id],[EYear] ,[Log_Year] ,[EGroup],[ELogGroupStudent] ,[Username],[Password] from ELogGroupStudent where EYear = '" + Label1.Text + "' AND Log_Year ='" + Label2.Text + "' AND EGroup = '" + Label3.Text + "' AND ELogGroupStudent = '" + Label4.Text + "'  ";


            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.Visible = true;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {


        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            updateData();
        }

        private void updateData()
        {
            /*
            string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);


            SqlCommand cmd = new SqlCommand("ChangePassword", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = Label1.Text.Trim();
            cmd.Parameters.Add("@pass", SqlDbType.VarChar).Value = TextBox7.Text.Trim();

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();
            Label18.Text = "Record updated successfully";
            */

            con.Open();
            SqlCommand cmd = new SqlCommand("Update ELogGroupStudent set Password = '" + TextBox7.Text + "' where id= '" + lblID.Text + "' ", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Label18.Text = "Record updated successfully";
        }




        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //cancel
            GridView1.EditIndex = -1;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            Label18.Text = "";
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Edit
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            Label18.Text = "";
            GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            TextBox Password = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;

            string query = "update ELogGroupStudent set Password = '" + Password + "' Where Id = '" + Id + "'";

            con.Open();

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.ExecuteNonQuery();

            int t = cmd.ExecuteNonQuery();

            if (t > 0)
            {
                Label18.Text = "Row Data Has Been Updated Successfully";
                GridView1.EditIndex = -1;
                GridView1.DataBind();
            }

            //Label18.Text = "Row Data Has Been Updated Successfully";

            GridView1.EditIndex = -1;
            GridView1.DataBind();
            SqlDataSource1.DataBind();
            GridView1.DataSource = SqlDataSource1;

        }



        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.SelectedIndex = -1;
            this.showGrid();
        }


    }
}
