using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_Project
{
    public partial class add_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
                Response.Redirect("host-login.aspx");
            if (Session["newlyCreated"] != null)
                showErrorsh.Text = "<div style=\"color:green\">Login to continue!</div>";

        }
    }
}