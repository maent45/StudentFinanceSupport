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
    protected void btnDeleteStudent_Click(object sender, EventArgs e)
    {
        StudentFinancialServicesDataClassesDataContext db = new StudentFinancialServicesDataClassesDataContext();

        var query = from m in db.StudentRegistrations
                    where m.Student_Id == Request.QueryString["Student_Id"]
                    select m;

        foreach(var q in query)
        {
            db.StudentRegistrations.DeleteOnSubmit(q);
        }
        //db.StudentVouchers.FirstOrDefault(m => m.Ref_No).a

        db.SubmitChanges();
        Response.Redirect("ViewStudents.aspx");
    }
    protected void btnCancelDeleteStudent_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewStudents.aspx");
    }
}