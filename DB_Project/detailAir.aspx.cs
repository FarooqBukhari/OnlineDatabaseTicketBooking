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
    public partial class detailAir : System.Web.UI.Page
    {
        private static readonly string connStringd =
            System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
                Response.Redirect("host-login.aspx");
            if (Session["newlyCreated"] != null)
                showErrors.Text = "<div style=\"color:green\">Login to continue!</div>";
        }

        protected void addAirline(object sender, EventArgs e)
        {
            try
            {
                if (airName.Text == "")
                {
                    throw new System.ArgumentException("Airline Name cannot be empty", "");
                }

                myDAL obj = new myDAL();
                int res = 0;
                res = obj.addAirline_DAL(airName.Text);
                if (res == 0)
                {
                    throw new System.ArgumentException("Something went wrong.", "");
                }
                Response.Redirect("detailAir.aspx");
                showErrors.Text = "<div style=\"color:green\">Airline added successfully!</div>";
            }
            catch (Exception ex)
            {
                showErrors.Text = ex.Message;
            }

        }

        protected void add_Flight(object sender, EventArgs e)
        {
            try
            {
                if (airIDf.Text == "")
                {
                    throw new System.ArgumentException("Airline ID cannot be empty", "");
                }
                if (flightID.Text == "")
                {
                    throw new System.ArgumentException("Flight ID cannot be empty", "");
                }
                if (price.Text == "" || totalSeats.Text == "")
                {
                    throw new System.ArgumentException("Price or Total Seats cannot be empty", "");
                }
                if (flightDate.SelectedValue == "0" || flightMonth.SelectedValue == "0")
                {
                    throw new System.ArgumentException("Flight Date or Month not Selected", "");
                }
                if (arrival.SelectedValue == "0" || departure.SelectedValue == "0" || departure.SelectedValue == arrival.SelectedValue)
                {
                    throw new System.ArgumentException("Flight arrival or departure not Selected Or they are same", "");
                }

                myDAL obj = new myDAL();
                int res = 0;
                string date = "2018-" + flightMonth.Text + "-" + flightDate.Text;
                res = obj.addFlight_DAL(Convert.ToInt32(airIDf.Text), Convert.ToInt32(flightID.Text), Convert.ToInt32(price.Text), Convert.ToInt32(totalSeats.Text), arrival.SelectedValue, departure.SelectedValue, date);
                if (res == 0)
                {
                    throw new System.ArgumentException("Something went wrong", "");
                }
                Response.Redirect("detailAir.aspx");
                showErrors.Text = "<div style=\"color:green\">Flight added successfully!</div>";
            }
            catch (Exception ex)
            {
                showErrors.Text = ex.Message;
            }
        }
    }
}