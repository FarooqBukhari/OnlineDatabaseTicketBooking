using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB_Project.DAL;
namespace DB_Project
{
    public partial class Trainbooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string TID = Request.QueryString["TID"];
            string RID = Request.QueryString["RID"];
            string departure = Request.QueryString["departure"];
            string arrival = Request.QueryString["arrival"];
            string totalseats = Request.QueryString["totalseats"];
            string leftseats = Request.QueryString["leftseats"];
            string price = Request.QueryString["price"];
            string date = Request.QueryString["traindate"];

            myDAL obj = new myDAL();
            string username = Session["username"].ToString();

            obj.Booktrains(TID, RID, username);


        }
    }
}