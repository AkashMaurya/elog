using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Linq;

namespace elog.Tutor
{
    public partial class DocterPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SelectAllData"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                connectionString = ConfigurationManager.ConnectionStrings["SelectAllData"].ConnectionString;
                if (Session["Username"] != null && Session["EYear"] != null)
                {
                    Label4.Text = Session["Username"].ToString();
                    EYear.Text = Session["EYear"].ToString();

                    LoadDoctorDetails();
                    BindGrid();
                }
                else
                {
                    Label1.Text = "Session has expired or is not set properly.";
                }
            }
        }

        private void LoadDoctorDetails()
        {
            try
            {
                using (con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT * FROM Doctor WHERE Username = @Username AND EYear = @EYear";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());
                        cmd.Parameters.AddWithValue("@EYear", Session["EYear"].ToString());

                        SqlDataReader sdr = cmd.ExecuteReader();
                        if (sdr.Read())
                        {
                            Label2.Text = sdr["Doctor_Name"].ToString();
                            Label3.Text = sdr["Department"].ToString();
                            EYear.Text = sdr["EYear"].ToString();
                        }
                        sdr.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "Error loading doctor details: " + ex.Message;
            }
        }

        // Button1_Click method (Add this)
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Call the function you want when the button is clicked
            BindGrid();
        }

        private void BindGrid()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SelectAllData"].ConnectionString))
                {
                    con.Open();
                    string query = "SELECT * FROM Final_Record WHERE Department = @Department AND Doctor_Name = @DoctorName AND EYear = @EYear AND Current_Status = 'Approval Required'";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Department", Label3.Text);
                        cmd.Parameters.AddWithValue("@DoctorName", Label2.Text);
                        cmd.Parameters.AddWithValue("@EYear", EYear.Text);
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                GridView1.DataSource = dt;
                                GridView1.DataBind();
                            }
                            else
                            {
                                Label1.Text = "No records found.";
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                Label1.Text = "Error loading grid data: " + ex.Message;
                System.Diagnostics.Debug.WriteLine("Exception details: " + ex.ToString());
            }
            catch (Exception ex)
            {
                Label1.Text = "An error occurred: " + ex.Message;
                System.Diagnostics.Debug.WriteLine("Exception details: " + ex.ToString());
            }
        }




        protected void Button2_Click(object sender, EventArgs e)
        {
            bool isSelectAll = ((CheckBox)GridView1.HeaderRow.FindControl("chkSelectAll")).Checked;

            foreach (GridViewRow row in GridView1.Rows)
            {
                RadioButton approveRadio = (RadioButton)row.FindControl("RadioButton1");
                RadioButton rejectRadio = (RadioButton)row.FindControl("RadioButton2");
                TextBox remarks = (TextBox)row.FindControl("TextBox1");

                string status = "Approval Required";
                if (isSelectAll || approveRadio.Checked)
                {
                    status = "Approved";
                }
                else if (rejectRadio.Checked)
                {
                    status = "Rejected";
                }

                int id = Convert.ToInt32(row.Cells[0].Text); // Assuming ID is in the first cell
                updaterow(id, status, remarks.Text);
            }

            BindGrid(); // Refresh the GridView
            Label1.Text = "Data updated successfully.";
        }

        private void updaterow(int Id, string Current_Status, string Remarks)
        {
            try
            {
                using (con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "UPDATE Final_Record SET Current_Status = @CurrentStatus, Remarks = @Remarks WHERE Id = @Id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@CurrentStatus", Current_Status);
                        cmd.Parameters.AddWithValue("@Remarks", Remarks ?? string.Empty);
                        cmd.Parameters.AddWithValue("@Id", Id);

                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Label1.Text = "Error updating record: " + ex.Message;
            }
        }

       
    }
}
