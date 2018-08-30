using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DB_Project.DAL;

namespace DB_Project
{
    public partial class confirmedbookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("login.aspx");
            myDAL obj = new myDAL();

            string username = Convert.ToString(Session["username"]);

            Bookinggrid.DataSource = obj.showbookings(username);
            Bookinggrid.DataBind();

        }
    }
}