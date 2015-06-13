using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    StudentFinancialServicesDataClassesDataContext db = new StudentFinancialServicesDataClassesDataContext();

    //declare variables for text field values
    string grantType, grantValue, grantDesc, kohaFunds, dateOfIssue;
    int ref_No;
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrantTypes();


        //int convRef_No;
        int convRef_No = Convert.ToInt32(Request.QueryString["Ref_No"]);
        //grantValue = Convert.ToInt32(txtBoxGrantValue.Text);
        ref_No = convRef_No;
        grantValue = txtBoxGrantValue.Text;
        kohaFunds = txtKohaFunds.Text;
        grantType = dropDownListGrantType.SelectedValue;
        grantDesc = txtBoxGrantDesc.Text;
        dateOfIssue = txtBoxGrantDOI.Text;

        if (Request.QueryString["Ref_No"] != null)
        {
            var editGrant = from t in db.StudentVouchers
                            where t.Ref_No == convRef_No
                            select t;

            foreach (var q in editGrant)
            {
                txtBoxGrantRefNo.Text = q.Ref_No.ToString();
                txtBoxGrantValue.Text = q.Grant_Value.ToString();
                txtKohaFunds.Text = q.KohaFunds.ToString();
                dropDownListGrantType.SelectedValue = q.Grant_Type;
                txtBoxGrantDesc.Text = q.Grant_Description;
                txtBoxGrantDOI.Text = q.Date_Of_Issue.ToString();
            }
        }
    }
    protected void BindGrantTypes()
    {
        using (var dc = new StudentFinancialServicesDataClassesDataContext())
        {
            dropDownListGrantType.DataSource = from p in db.GrantTypes
                                               orderby 0
                                               select new { p.Grant_Name, p.Grant_Id };
            dropDownListGrantType.DataTextField = "Grant_Name";
            dropDownListGrantType.DataValueField = "Grant_Name";
            dropDownListGrantType.DataBind();
        }
    }
    protected void btnEditGrant_Click(object sender, EventArgs e)
    {
        //create sessions to store and transfer data to next page
        //Session["ref_no"] = ref_No;
        //Session["grant_value"] = grantValue;
        //Session["koha_funds"] = kohaFunds;
        //Session["grant_type"] = grantType;
        //Session["grant_desc"] = grantDesc;
        //Session["grant_doi"] = dateOfIssue;

        //Response.Redirect("ConfirmUpdate.aspx?Student_Id=" + Request.QueryString["Student_Id"]);
        //Response.Redirect("ConfirmGrantUpdate.aspx?Ref_No=" + Request.QueryString["Ref_No"]);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //create sessions to store and transfer data to next page
        Session["ref_no"] = ref_No;
        Session["grant_value"] = grantValue;
        Session["koha_funds"] = kohaFunds;
        Session["grant_type"] = grantType;
        Session["grant_desc"] = grantDesc;
        Session["grant_doi"] = dateOfIssue;

        //Response.Redirect("ConfirmUpdate.aspx?Student_Id=" + Request.QueryString["Student_Id"]);
        Response.Redirect("ConfirmGrantUpdate.aspx?Ref_No=" + Request.QueryString["Ref_No"]);
    }
}