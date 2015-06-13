using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration; 


public partial class _Default : System.Web.UI.Page
{
    StudentFinancialServicesDataClassesDataContext db = new StudentFinancialServicesDataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    //ajax autocomplete extender
    //code from http://www.aspsnippets.com/Articles/AJAX-AutoCompleteExtender-Example-in-ASPNet.aspx
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]

    public static List<string> SearchStudentsAutoComplete(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                .ConnectionStrings["StudentFinancialServicesConnectionString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "SELECT Student_FirstName, Student_Id FROM StudentRegistration WHERE " + "Student_FirstName LIKE @SearchText + '%' OR Student_Id LIKE @SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> students = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        students.Add(sdr["Student_FirstName"].ToString());
                        students.Add(sdr["Student_Id"].ToString());
                    }
                }
                conn.Close();
                return students;
            }
        }
    }

    protected void btnRedirectAddStudent_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddStudent.aspx");
    }
    protected void btnSearchStudent_Click(object sender, EventArgs e)
    {
        //if no id or name is specified then use this datasource which selects all students
        if (txtBoxSearchID.Text == "")
        {
            gridViewSearchResults.DataSourceID = "SearchStudentAllSqlDataSource1";
            gridViewSearchResults.DataBind();
        }
        //otherwise if name or id is provided then use this datasource which seletects results based on the entered name or id
        else
        {
            gridViewSearchResults.DataSourceID = "SearchStudentSqlDataSource1";
            gridViewSearchResults.DataBind();
        }
    }
}