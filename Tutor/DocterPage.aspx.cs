﻿using System;
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
    public partial class DocterPage : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);



        // correction of code
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                Label4.Text = Session["Username"].ToString();
                EYear.Text = Session["EYear"].ToString();
                //ShowDetail();

                con.Open();
                string str = "SELECT * FROM Doctor where Username = '" + Session["Username"].ToString() + "' And  EYear ='" + Session["EYear"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                Label4.Text = sdr["Username"].ToString();
                Label2.Text = sdr["Doctor_Name"].ToString();
                Label3.Text = sdr["Department"].ToString();
                EYear.Text = sdr["EYear"].ToString();

                sdr.Close();
                con.Close();

            }
        


        }

        //ShowDetail();
        /*
        con.Open();
        string str = "SELECT * FROM Doctor WHERE Username = '" + Session["Username"].ToString() + "' AND EYear = " + Session["EYear"].ToString();

        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        sdr.Read();
        Label4.Text = sdr["Username"].ToString();
        Label2.Text = sdr["Doctor_Name"].ToString();
        Label3.Text = sdr["Department"].ToString();
        EYear.Text = sdr["EYear"].ToString();

        sdr.Close();
        con.Close(); */









        //! Correct only above code

        /*----------------------------------------*/

        protected void Button1_Click(object sender, EventArgs e)
        {
            //click here //search
            BindGrid();
        }


        // a function for show not approved data in gridview
        private void BindGrid()
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Final_Record where Department = '" + Label3.Text + "'  And  Doctor_Name = '" + Label2.Text + "' And  EYear ='"+EYear.Text.ToString()+"' And Current_Status = 'Approval Required '"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {

                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
            con.Close();
        }


        //A function for Save Records from gridview 
        protected void Button2_Click(object sender, EventArgs e)
        {

            // Approve

            if (GridView1.Visible == true)
            {
                // Save Records
                foreach (GridViewRow row in GridView1.Rows)
                {
                    //fetching 
                    int Id = Convert.ToInt32(row.Cells[0].Text);
                    RadioButton status = row.Cells[13].FindControl("RadioButton1") as RadioButton;
                    RadioButton status1 = row.Cells[13].FindControl("RadioButton2") as RadioButton;
                    TextBox textBox1 = row.Cells[14].FindControl("TextBox1") as TextBox;

                    if (status.Checked)
                    {
                        updaterow(Id, "Approved", textBox1.Text);
                    }

                    else if (status1.Checked)
                    {
                        updaterow(Id, "Rejected", textBox1.Text);
                    }
                    /*
                    else if (textBox1.Text != "")
                    {
                        updateRemarks(Id, textBox1.Text);
                    } */
                    else
                    {
                        updaterow(Id, "Approval Required", textBox1.Text);

                    }

                }
            }
            else
            {
                //viewEnd1();
                Label1.Text = "Applications Has Been Approved Successfully";
                SqlDataSource3.DataBind();
                GridView1.DataSource = SqlDataSource3;
                GridView1.DataBind();
            }

            BindGrid();
            Label1.Text = "Data is Updated ";

        }

        private void updaterow(int Id, String Current_Status, String Remarks)
        {

            con.Open();
            String updatedata = "Update Final_Record set Current_Status ='" + Current_Status + "' , Remarks = '" + Remarks + "' where Id=" + Id;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }



        private void updateRemarks(int Id1, String Remarks)
        {
            con.Open();
            String updatedata = "Update Final_Record set Remarks = '" + Remarks + "' where Id=" + Id1;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = updatedata;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }



        private void viewEnd1()
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                int Id = Convert.ToInt32(row.Cells[0].Text);
                TextBox textBox = (row.Cells[14].FindControl("TextBox1") as TextBox);

                if (textBox.Text != "")
                {
                    updateRemarks(Id, textBox.Text);
                }
                else
                {
                    updateRemarks(Id, textBox.Text);
                }
            }
        }



    }
}