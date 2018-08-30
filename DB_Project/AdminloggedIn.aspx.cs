using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DB_Project
{
    public partial class AdminloggedIn : System.Web.UI.Page
    {
        public string Uemail;
        private static readonly string connStringd =
            System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
                Response.Redirect("host-login.aspx");
            SqlConnection con = new SqlConnection(connStringd);
            con.Open();
            SqlDataReader myReader = null;
            SqlCommand myCommand = new SqlCommand("select * from [ADMIN] where admin_id='" + Session["adminname"].ToString() + "'", con);

            myReader = myCommand.ExecuteReader();

            while (myReader.Read())
            {
                inputEmaildh.Text = (myReader["email"].ToString());
                inputUserTypedh.Text = "Admin Account";
                inputNamedh.Text = (myReader["admin_id"].ToString());
                Uemail = (myReader["email"].ToString());
            }
            con.Close();

        }
        protected void hostlogout(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(connStringd);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("[Adminlogout]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 320);

                cmd.Parameters["@email"].Value = Uemail;

                cmd.ExecuteNonQuery();
                showErrorsdh.Text = "<div style=\"color:green\">Logged out successfully!</div>";
                Session["adminname"] = null;
                Session["type"] = null;
                Response.Redirect("host-login.aspx");
            }
            catch (Exception ex)
            {
                showErrorsdh.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void hostsignup(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(connStringd);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("[Adminlogout]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 320);

                cmd.Parameters["@email"].Value = Uemail;

                cmd.ExecuteNonQuery();
                showErrorsdh.Text = "<div style=\"color:green\">Logged out successfully!</div>";
                Session["username"] = null;
                Session["type"] = null;
                Response.Redirect("add-admin.aspx");
            }
            catch (Exception ex)
            {
                showErrorsdh.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
        protected void bookingdetails(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(connStringd);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("[Adminlogout]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 320);

                cmd.Parameters["@email"].Value = Uemail;

                cmd.ExecuteNonQuery();
                showErrorsdh.Text = "<div style=\"color:green\">Logged out successfully!</div>";
                Session["username"] = null;
                Session["type"] = null;
                Response.Redirect("add-admin.aspx");
            }
            catch (Exception ex)
            {
                showErrorsdh.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void add_details(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(connStringd);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("[Adminlogout]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 320);

                cmd.Parameters["@email"].Value = Uemail;

                cmd.ExecuteNonQuery();
                showErrorsdh.Text = "<div style=\"color:green\">Logged out successfully!</div>";
                Session["username"] = null;
                Session["type"] = null;
                Response.Redirect("add-admin.aspx");
            }
            catch (Exception ex)
            {
                showErrorsdh.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void onlineUsers(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(connStringd);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("[Adminlogout]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 320);

                cmd.Parameters["@email"].Value = Uemail;

                cmd.ExecuteNonQuery();
                showErrorsdh.Text = "<div style=\"color:green\">Logged out successfully!</div>";
                Session["username"] = null;
                Session["type"] = null;
                Response.Redirect("add-admin.aspx");
            }
            catch (Exception ex)
            {
                showErrorsdh.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
}