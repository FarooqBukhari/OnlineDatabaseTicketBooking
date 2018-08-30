using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB_Project.DAL;

namespace DB_Project
{
    public partial class detailMovies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
                Response.Redirect("host-login.aspx");
            if (Session["newlyCreated"] != null)
                showErrors.Text = "<div style=\"color:green\">Login to continue!</div>";
        }
        protected void addCinema(object sender, EventArgs e)
        {
            try
            { 
                if (cinemaName.Text =="")
                {
                    throw new System.ArgumentException("Cinema Name cannot be empty", "");
                }
                if (Location.Text == "")
                {
                    throw new System.ArgumentException("Cinema Location cannot be empty", "");
                }

                myDAL obj = new myDAL();
                int res = 0;
                res = obj.addCinema_DAL(cinemaName.Text,Location.Text);
                if (res == 0)
                {
                    throw new System.ArgumentException("Cinema Id already exists", "");
                }
                Response.Redirect("detailMovies.aspx");
                showErrors.Text = "<div style=\"color:green\">Cinema added successfully!</div>";
            }
            catch (Exception ex)
            {
                showErrors.Text = ex.Message;
            }
            
        }

        protected void add_Movie(object sender, EventArgs e)
        {
            try
            {
                if (cinemaIDf.Text == "")
                {
                    throw new System.ArgumentException("Cinema ID cannot be empty", "");
                }
                if (theatreID.Text == "")
                {
                    throw new System.ArgumentException("Theatre ID cannot be empty", "");
                }
                if (MovieName.Text == "")
                {
                    throw new System.ArgumentException("Movie Name cannot be empty", "");
                }
                if(price.Text == "" || totalSeats.Text == "")
                {
                    throw new System.ArgumentException("Movie Price or Total Seats cannot be empty", "");
                }
                if(movieDate.SelectedValue == "0" || movieMonth.SelectedValue == "0")
                {
                    throw new System.ArgumentException("Movie Date or Month not Selected", "");
                }

                myDAL obj = new myDAL();
                int res = 0;
                string date = "2018-" + movieMonth.Text + "-" + movieDate.Text ;
                res = obj.addMovie_DAL(Convert.ToInt32(cinemaIDf.Text),Convert.ToInt32(theatreID.Text),Convert.ToInt32(price.Text),Convert.ToInt32(totalSeats.Text),MovieName.Text,date);
                if (res == 0)
                {
                    throw new System.ArgumentException("Something went wrong", "");
                }
                Response.Redirect("detailMovies.aspx");
                showErrors.Text = "<div style=\"color:green\">Movie added successfully!</div>";
            }
            catch (Exception ex)
            {
                showErrors.Text = ex.Message;
            }
        }
    }
}