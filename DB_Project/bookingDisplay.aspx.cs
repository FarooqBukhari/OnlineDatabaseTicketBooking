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
    public partial class bookingDisplay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
                Response.Redirect("host-login.aspx");
            LoadBooking();
        }

        protected void LoadBooking()
        {
            myDAL obj = new myDAL();
            if ((string)Session["sender"] == "Airline")
            {
                BookingGrid.DataSource = obj.getBookingsAir();
                Session["sender"] = "null";
            }
            if ((string)Session["sender"] == "Train")
            {
                BookingGrid.DataSource = obj.getBookingsTrain();
                Session["sender"] = "null";
            }
            if ((string)Session["sender"] == "Cinema")
            {
                BookingGrid.DataSource = obj.getBookingsCinema();
                Session["sender"] = "null";
            }

            BookingGrid.DataBind();
        }
    }
}