using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;

namespace elog.Tutor
{
    public partial class tutor : System.Web.UI.MasterPage
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Elogconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            HttpContext.Current.Response.Cache.SetValidUntilExpires(false);
            HttpContext.Current.Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoStore();
            if (!Page.IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Session.Abandon();
                    Session.Clear();
                    Session.RemoveAll();
                    Response.Redirect("~/Login.aspx");

                }
                else
                {
                    Session["username"].ToString();
                    con.Open();
                    string str = "SELECT * FROM Doctor where Username = '" + Session["username"].ToString() + "'";
                    SqlCommand cmd = new SqlCommand(str, con);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    sdr.Read();
                    Label1.Text = sdr["Username"].ToString();
                    Label3.Text = sdr["Doctor_Name"].ToString();
                    Label2.Text = sdr["Department"].ToString(); 
                    
                    sdr.Close();
                    con.Close();
                }
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //logout 
            Session.Abandon();
            FormsAuthentication.SignOut();
            Session["username"] = null;
            Response.Redirect("~/Login.aspx");

        }
    }
}