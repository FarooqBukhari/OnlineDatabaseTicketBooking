using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB_Project.DAL;

namespace DB_Project
{
    public partial class cancelconfirmedaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("login.aspx");
            cancelnow(sender, e);

        }
        protected void cancelnow(object sender, EventArgs e)
        {
            myDAL obj = new myDAL();

            string BID = Request.QueryString["BID"];

            string userid = Request.QueryString["username"];
            string bookingtype = Request.QueryString["bookingtype"];
            string paymentmethod = Request.QueryString["payment_method"];

            obj.cancelbooking(BID, userid, bookingtype);
        }
    }
}