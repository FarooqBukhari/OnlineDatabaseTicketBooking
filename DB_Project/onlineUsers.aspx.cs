using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DB_Project.DAL;
namespace DB_Project
{
    public partial class onlineUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
                Response.Redirect("host-login.aspx");
            LoadGrid();
        }

        public void LoadGrid()
        {
            myDAL obj = new myDAL();
            UserGrid.DataSource = obj.getOnlineUsers();
            UserGrid.DataBind();
        } 
    }
}