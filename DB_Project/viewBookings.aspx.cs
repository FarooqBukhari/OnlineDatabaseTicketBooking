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
    public partial class viewBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
                Response.Redirect("host-login.aspx");
        }
        protected void view_airline(object sender, EventArgs e)
        {
            Session["sender"] = "Airline";
            Response.Redirect("bookingDisplay.aspx");
        }
        protected void view_train(object sender, EventArgs e)
        {
            Session["sender"] = "Train";
            Response.Redirect("bookingDisplay.aspx");
        }
        protected void view_movies(object sender, EventArgs e)
        {
            Session["sender"] = "Cinema";
            Response.Redirect("bookingDisplay.aspx");
        }
    }
}