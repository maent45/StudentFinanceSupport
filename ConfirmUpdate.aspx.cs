using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    StudentFinancialServicesDataClassesDataContext db = new StudentFinancialServicesDataClassesDataContext();
    protected void btnYesUpdate_Click(object sender, EventArgs e)
    {
        var query = from m in db.StudentRegistrations
                    where m.Student_Id == Request.QueryString["Student_Id"]
                    select m;

        foreach(var q in query)
        {
            q.Student_Id = Session["id"].ToString();
            q.Student_FirstName = Session["fname"].ToString();
            q.Student_LastName = Session["lname"].ToString();
            q.Student_Gender = Session["gender"].ToString();
            //convert the session "dob" to datetime format before submitting changes to db 
            q.Student_DateOfBirth = Convert.ToDateTime(Session["dob"]);

            q.Student_Address1 = Session["address"].ToString();
            q.Student_Phone = Session["phone"].ToString();
            q.Student_Mobile = Session["mobile"].ToString(); ;
            q.Student_Email = Session["email"].ToString();
            q.Student_Marital_Status = Session["maritalStat"].ToString();
            q.Student_Contact = Session["contact"].ToString();
            q.Student_Main_Ethnicity = Session["mainEthnicity"].ToString();
            q.Student_Faculty = Session["faculty"].ToString();
            q.Student_Courses = Session["courses"].ToString();
            q.Student_Detailed_Ethnicity = Session["detailedEthnicity"].ToString();
            q.Student_Campus = Session["campus"].ToString();
        }
        db.SubmitChanges();
        Response.Redirect("ViewStudents.aspx");
    }
    protected void btnNoUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewStudents.aspx");
    }
}