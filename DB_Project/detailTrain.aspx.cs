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
    public partial class detailTrain : System.Web.UI.Page
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

        protected void addRailway(object sender, EventArgs e)
        {
            try
            {
                if (railName.Text == "")
                {
                    throw new System.ArgumentException("Railway Name cannot be empty", "");
                }

                myDAL obj = new myDAL();
                int res = 0;
                res = obj.addRailway_DAL(railName.Text);
                if (res == 0)
                {
                    throw new System.ArgumentException("Something went wrong.", "");
                }
                Response.Redirect("detailTrain.aspx");
                showErrors.Text = "<div style=\"color:green\">Railway added successfully!</div>";
            }
            catch (Exception ex)
            {
                showErrors.Text = ex.Message;
            }

        }

        protected void add_Train(object sender, EventArgs e)
        {
            try
            {
                if (railIDf.Text == "")
                {
                    throw new System.ArgumentException("Railway ID cannot be empty", "");
                }
                if (TrainID.Text == "")
                {
                    throw new System.ArgumentException("Train ID cannot be empty", "");
                }
                if (price.Text == "" || totalSeats.Text == "")
                {
                    throw new System.ArgumentException("Price or Total Seats cannot be empty", "");
                }
                if (tripDate.SelectedValue == "0" || tripMonth.SelectedValue == "0")
                {
                    throw new System.ArgumentException("Trip Date or Month not Selected", "");
                }
                if (arrival.SelectedValue == "0" || departure.SelectedValue == "0" || departure.SelectedValue == arrival.SelectedValue)
                {
                    throw new System.ArgumentException("Trip arrival or departure not Selected Or they are same", "");
                }

                myDAL obj = new myDAL();
                int res = 0;
                string date = "2018-" + tripMonth.Text + "-" + tripDate.Text;
                res = obj.addTrain_DAL(Convert.ToInt32(railIDf.Text), Convert.ToInt32(TrainID.Text), Convert.ToInt32(price.Text), Convert.ToInt32(totalSeats.Text), arrival.SelectedValue , departure.SelectedValue, date);
                if (res == 0)
                {
                    throw new System.ArgumentException("Something went wrong", "");
                }
                Response.Redirect("detailTrain.aspx");
                showErrors.Text = "<div style=\"color:green\">Train Trip added successfully!</div>";
            }
            catch (Exception ex)
            {
                showErrors.Text = ex.Message;
            }
        }
    }
}