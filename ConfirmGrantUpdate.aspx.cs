using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    StudentFinancialServicesDataClassesDataContext db = new StudentFinancialServicesDataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnYesUpdate_Click(object sender, EventArgs e)
    {
        int convRef_No = Convert.ToInt32(Request.QueryString["Ref_No"]);

        var query = from m in db.StudentVouchers
                    where m.Ref_No == convRef_No
                    select m;
        foreach (var q in query)
        {
            int convertedRefNo = Convert.ToInt32(Session["ref_no"]);
            decimal converetedGrantValue = Convert.ToDecimal(Session["grant_value"]);
            decimal convertedKohaFunds = Convert.ToDecimal(Session["koha_funds"]);
            DateTime convertedDateOfIssue = Convert.ToDateTime(Session["grant_doi"]);

            q.Ref_No = convertedRefNo;
            q.Grant_Value = converetedGrantValue;
            q.Grant_Type = Session["grant_type"].ToString();
            q.Grant_Description = Session["grant_desc"].ToString();
            q.Date_Of_Issue = convertedDateOfIssue;
            q.KohaFunds = convertedKohaFunds;
        }
        db.SubmitChanges();
        Response.Redirect("ViewStudents.aspx");
    }
    protected void btnNoUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("UpdateGrant.aspx");
    }
}