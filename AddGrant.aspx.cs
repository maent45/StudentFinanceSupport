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
        //populate studentID txtbox captured from previous page based on URL parameter
        studentID = txtBoxGrantStudentID.Text;

        if (Request.QueryString["Student_Id"] != null)
        {
            var grantQuery = from studentGrant in db.StudentRegistrations
                             where studentGrant.Student_Id == Request.QueryString["Student_Id"]
                             select studentGrant;

            foreach (var q in grantQuery)
            {
                txtBoxGrantStudentID.Text = q.Student_Id;
            }
        }

        //bind grant values from db to grant type dropdown list
        BindGrantTypes();
    }

    //bind GrantTypes table values to grant types dropdown list
    //code from http://stackoverflow.com/questions/554649/how-to-bind-linq-data-to-dropdownlist
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

    protected void btnAddGrant_Click(object sender, EventArgs e)
    {
        decimal grantValue;
        decimal kohaFunds;

        DateTime grantDateOfIssue;

        StudentVoucher StudentVoucherTable = new StudentVoucher();

        grantDateOfIssue = Convert.ToDateTime(txtBoxGrantDOI.Text);

        StudentVoucherTable.Student_Id = txtBoxGrantStudentID.Text;
        StudentVoucherTable.Grant_Type = dropDownListGrantType.SelectedValue;
        StudentVoucherTable.Grant_Description = txtBoxGrantDesc.Text;
        StudentVoucherTable.Date_Of_Issue = grantDateOfIssue;

        if (txtBoxGrantValue.Text != "" || txtKohaFunds.Text != "")
        {
            //inialize the variables before converting to different data types
            grantValue = Convert.ToDecimal(txtBoxGrantValue.Text);
            StudentVoucherTable.Grant_Value = grantValue;
            kohaFunds = Convert.ToDecimal(txtKohaFunds.Text);
            StudentVoucherTable.KohaFunds = kohaFunds;
        }

        db.StudentVouchers.InsertOnSubmit(StudentVoucherTable);
        db.SubmitChanges();
        
        Response.Redirect("ViewStudents.aspx");
    }
    protected void dropDownListGrantType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dropDownListGrantType.SelectedValue == "Advice")
        {
            labelGrantValue.Visible = false;
            labelKohaFunds.Visible = false;
            txtBoxGrantValue.Visible = false;
            txtKohaFunds.Visible = false;
        }
        else
        {
            labelGrantValue.Visible = true;
            labelKohaFunds.Visible = true;
            txtBoxGrantValue.Visible = true;
            txtKohaFunds.Visible = true;
        }
    }
}