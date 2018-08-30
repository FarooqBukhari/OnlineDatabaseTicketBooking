using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB_Project.DAL;
namespace DB_Project
{
    public partial class Trains : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("login.aspx");
        }
        protected void go(object sender, EventArgs e)
        {

            myDAL obj = new myDAL();
            string a = arrivalmenu.SelectedValue;
            string d = departuremenu.SelectedValue;



            TrainGridd.DataSource = obj.showtrains(a, d);
            TrainGridd.DataBind();




        }
    }
}