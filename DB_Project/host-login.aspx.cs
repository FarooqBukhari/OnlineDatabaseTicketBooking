using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using DB_Project.DAL;

namespace DB_Project
{
    public partial class host_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] != null)
                Response.Redirect("adminloggedIn.aspx");
            if (Session["newlyCreated"] != null)
                showErrorsh.Text = "<div style=\"color:green\">Your account has been successfully created. Login to continue!</div>";
        }
        protected void hostlogin(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(inputNameh.Text) > 10)
                {
                    throw new System.ArgumentException("Your Admin Number is incorrect. We have a limit of 10 Admins only.", "");
                }
                if (inputPassh.Text.Length < 5)
                {
                    throw new System.ArgumentException("Password must be at least 5 characters long.", "");
                }


                myDAL obj = new myDAL();
                int res = 0;
                string email = "";
                int usertype = 1;

                res = obj.admin_login_DAL(Convert.ToInt32(inputNameh.Text), inputPassh.Text, ref email);

                if (res == 0)
                {
                    throw new System.ArgumentException("Login Failed! Your username or password is incorrect.", "");
                }
                showErrorsh.Text = "<div style=\"color:green\">Logged in successfully!</div>";
                Session["adminname"] = inputNameh.Text;
                Session["type"] = usertype;
                Session["newlyCreated"] = null;
                Response.Redirect("AdminloggedIn.aspx");
            }
            catch (Exception ex)
            {
                showErrorsh.Text = ex.Message;
            }
        }
    }
}