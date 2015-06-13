using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminSession"] != null)
        {
            //say hello to the admin through label control :)
            sessionLabel.Text = "Hi " + Session["AdminSession"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    //clear the session on logout
    protected void logoutBtn_Click(object sender, EventArgs e)
    {
        //on logout the session will be set to null and redirected back to login page
        Session["AdminSession"] = null;
        Response.Redirect("Login.aspx");
    }
}
