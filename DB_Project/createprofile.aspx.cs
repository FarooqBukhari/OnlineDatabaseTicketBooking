using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB_Project.DAL;
namespace DB_Project
{
    public partial class createprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signup_Guest(object sender, EventArgs e)
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
                if (inputName.Text.Length < 5)
                {
                    throw new System.ArgumentException("Username must be at least 5 characters long", "");
                }
                if (inputName.Text.Contains(" "))
                {
                    throw new System.ArgumentException("Username cannot contain spaces", "");
                }
                if (CardInfo.SelectedValue == "Y")
                {
                    if((CardNum.Text=="") || (Convert.ToInt64(CardNum.Text) < 1000000000000000) || (Convert.ToInt64(CardNum.Text) > 9999999999999999))
                    {
                        throw new System.ArgumentException("Card Number is incorrect", "");
                    }
                    else if (expirationMonth.SelectedValue == "0" || expirationDate.SelectedValue == "0")
                    {
                        throw new System.ArgumentException("Expiration Month or Date not Selected", "");
                    }
                }
                
                myDAL obj = new myDAL();
                int res = 0;
                if(CardInfo.SelectedValue == "N")
                { 
                res = obj.create_signup_DAL(inputName.Text.ToLower(), firstName.Text,lastName.Text,inputMail.Text.ToLower(),inputPass.Text, 0,Convert.ToInt32(Age.Text), Convert.ToInt64(phone.Text), Convert.ToChar(Gender.Text), 'N' ,'N',0,0,0);
                }
                else
                {
                    res = obj.create_signup_DAL(inputName.Text.ToLower(), firstName.Text, lastName.Text, inputMail.Text.ToLower(), inputPass.Text, 0, Convert.ToInt32(Age.Text), Convert.ToInt64(phone.Text), Convert.ToChar(Gender.Text), 'Y',Convert.ToChar(CardType.SelectedValue) , Convert.ToInt64(CardNum.Text), Convert.ToInt32(expirationMonth.SelectedValue), Convert.ToInt32(expirationDate.SelectedValue));
                }
                if (res == 0)
                {
                    throw new System.ArgumentException("Email or username already exists", "");
                }
                showErrors.Text = "<div style=\"color:green\">Signed up successfully!</div>";
                Session["newlyCreated"] = "1";
                Response.Redirect("login.aspx");
            }
            catch (Exception ex)
            {
                showErrors.Text = ex.Message;
            }
        }
    }
}