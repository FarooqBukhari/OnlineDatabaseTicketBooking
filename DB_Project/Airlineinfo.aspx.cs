using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB_Project.DAL;


namespace DB_Project
{
    public partial class Airlineinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("login.aspx");
        }
        protected void go(object sender, EventArgs e)
        {

            myDAL obj = new myDAL();
          

          
            string d = departuremenu.SelectedValue;
            string a = arrivalmenu.SelectedValue;


            AirlineGrid.DataSource = obj.Showflight(a,d);
            AirlineGrid.DataBind();

        }
    }
}