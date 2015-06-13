using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    StudentFinancialServicesDataClassesDataContext db = new StudentFinancialServicesDataClassesDataContext();
    public string studentID;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (IsPostBack)
        //{
            //GridView1.DataSource = ViewGrantSqlDataSource1;
            //GridView1.DataBind();
        //}
    }
    
    protected void btnAddStudentGrant_Click1(object sender, EventArgs e)
    {
        //Response.Redirect("AddGrant.aspx/?Student_Id={0}");
        Response.Redirect("~/AddGrant.aspx?Student_Id={0}");

        //Response.Redirect("~/MAP/routeToHospital.aspx?RunNumber=" + HttpUtility.UrlEncode(TextBox1.text));
        //TextBox textBox = (TextBox)Page.PreviousPage.FindControl("txtBoxGrantStudentID");
    }
}