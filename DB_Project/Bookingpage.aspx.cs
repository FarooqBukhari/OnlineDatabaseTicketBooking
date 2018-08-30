using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB_Project.DAL;

namespace DB_Project
{
    public partial class Bookingpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("login.aspx");
            QString();

        }
        public void QString()
        {
            string FID = Request.QueryString["FID"];
            string AID = Request.QueryString["AID"];
            string departure = Request.QueryString["departure"];
            string arrival = Request.QueryString["arrival"];
            string totalseats = Request.QueryString["totalseats"];
            string leftseats = Request.QueryString["leftseats"];
            string price = Request.QueryString["price"];
            string date = Request.QueryString["date"];


            myDAL obj = new myDAL();
            string username = Session["username"].ToString();
            obj.Bookflight(FID, AID, departure, arrival, totalseats, leftseats, price, username,date);



        }
    }
}