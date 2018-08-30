using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB_Project.DAL;

namespace DB_Project
{
    public partial class BookCinema : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("login.aspx");
            QString();
        }
        public void QString()
        {
            string CID = Request.QueryString["CID"];
            string Cname = Request.QueryString["cname"];
            string movie_name = Request.QueryString["moviename"];
            string moviedate = Request.QueryString["moviedate"];
            string totalseats = Request.QueryString["totalseats"];
            string leftseats = Request.QueryString["leftseats"];
            string price = Request.QueryString["price"];



            string TID = Request.QueryString["TID"];
            string location = Request.QueryString["location"];


            myDAL obj = new myDAL();
            string username = Session["username"].ToString();
            obj.Bookcinemas(CID, Cname, movie_name, moviedate, totalseats, leftseats, price, username,TID,location );



        }
    }
}