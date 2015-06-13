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
    protected void btnDeleteGrant_Click(object sender, EventArgs e)
    {
        StudentFinancialServicesDataClassesDataContext db = new StudentFinancialServicesDataClassesDataContext();

        //convert Ref_No to int
        int theRef = Convert.ToInt32(Request.QueryString["Ref_No"]);

        var query = from m in db.StudentVouchers
                    where m.Ref_No == theRef
                    select m;

        foreach (var q in query)
        {
            db.StudentVouchers.DeleteOnSubmit(q);
        }

        Response.Write("<script>alert('Grant has been deleted.')</script>");
        db.SubmitChanges();
        Response.Redirect("ViewStudents.aspx");
    }
    protected void btnCancelDeleteGrant_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewStudents.aspx");
    }
}