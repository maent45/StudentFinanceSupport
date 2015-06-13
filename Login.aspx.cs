using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StudentFinancialServicesConnectionString"].ConnectionString);

        //open connection to db
        conn.Open();
        //SQL query to check if username exists in db
        string checkUser = "SELECT COUNT(*) FROM LoginDetails WHERE Login_Id='" + usernameTxtBox.Text + "'";

        SqlCommand com = new SqlCommand(checkUser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

        //close db connection
        conn.Close();

        if (temp == 1)
        {
            //open db connection
            conn.Open();
            //write query to db to select the password and see if it matches the username
            string checkPassword = "SELECT Login_Password FROM LoginDetails WHERE Login_Id='" + usernameTxtBox.Text + "'";
            SqlCommand passComm = new SqlCommand(checkPassword, conn);

            string password = passComm.ExecuteScalar().ToString();

            //re-hash password to match the hashed password in the db.
            //string hashPass = FormsAuthentication.HashPasswordForStoringInConfigFile(passwordTxtBox.Text, "SHA1");

            //verify password input
            if (password == passwordTxtBox.Text)
            {
                Session["AdminSession"] = usernameTxtBox.Text;
                Response.Write("Cool, looks like your password is valid!");
                Response.Redirect("MainMenu.aspx");
            }
            else
            {
                Response.Write("<script>alert('Password is incorrect. Please try again.')</script>");
                passwordTxtBox.Focus();
            }
            //close db connection
            conn.Close();
        }
        else
        {
            Response.Write("<script>alert('Username is incorrect. Please try again.')</script>");
            usernameTxtBox.Focus();
        }
    }
}