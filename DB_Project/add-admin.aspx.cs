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
    public partial class add_admin : System.Web.UI.Page
    {
        public string Uemail = "farouq.bukhari@gmail.com";
        private static readonly string connStringd =
            System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
                Response.Redirect("host-login.aspx");
        }

        protected void signup_Host(object sender, EventArgs e)
        {
            try
            {
                if (inputMail.Text == "")
                {
                    throw new System.ArgumentException("Email cannot be empty", "");
                }
                else if ((!inputMail.Text.Contains("@")) || (!inputMail.Text.Contains(".")) || (inputMail.Text.Contains(" ")))
                {
                    throw new System.ArgumentException("Email is not correct!", "");
                }
                if (inputPass.Text.Length < 5)
                {
                    throw new System.ArgumentException("Password must be at least 5 characters long", "");
                }

                myDAL obj = new myDAL();
                int res = 0;
                res = obj.create_signup_DAL("N", firstName.Text, lastName.Text, inputMail.Text.ToLower(), inputPass.Text, 1, Convert.ToInt32(Age.Text), Convert.ToInt64(phone.Text), Convert.ToChar(Gender.Text), 'N', 'N', 0, 0, 0);
                if (res == 0)
                {
                    throw new System.ArgumentException("Email or username already exists", "");
                }
                showErrors.Text = "<div style=\"color:green\">Signed up successfully! Your Admin ID is: " + res + "</ div >";
                
                Session["newlyCreated"] = "1";
                Response.Redirect("host-login.aspx");
            }
            catch (Exception ex)
            {
                showErrors.Text = ex.Message;
            }
        }
    }
}