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
    public partial class loggedIn : System.Web.UI.Page
    {
        public string Uemail;
        private static readonly string connStringd =
            System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("login.aspx");
            SqlConnection con = new SqlConnection(connStringd);
            con.Open();
            SqlDataReader myReader = null;
            SqlCommand myCommand = new SqlCommand("select * from [USER] where user_id='" + Session["username"].ToString() + "'", con);

            myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                inputEmaild.Text = (myReader["email"].ToString());
                    inputUserTyped.Text = "Guest Account";
                inputNamed.Text = (myReader["user_id"].ToString());
                Uemail = (myReader["email"].ToString());
            }
            con.Close();

         }
        protected void logout(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(connStringd);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("[Userlogout]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 320);

                cmd.Parameters["@email"].Value = Uemail;

                cmd.ExecuteNonQuery();
                showErrorsd.Text = "<div style=\"color:green\">Logged out successfully!</div>";
                Session["username"] = null;
                Session["type"] = null;
                Response.Redirect("login.aspx");
            }
            catch (Exception ex)
            {
                showErrorsd.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
}