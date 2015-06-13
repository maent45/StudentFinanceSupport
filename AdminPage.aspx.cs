using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    StudentFinancialServicesDataClassesDataContext dbAdmin = new StudentFinancialServicesDataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnAddNewAdmin_Click(object sender, EventArgs e)
    {
        LoginDetail LoginDetailTable = new LoginDetail();
            
            //check if username already exists in db
            var checkUsername = (from t in dbAdmin.LoginDetails
                 where t.Login_Id == txtBoxNewAdminUsername.Text
                 select t).SingleOrDefault();

            if (checkUsername != null)
            {
                Response.Write("<script>alert('Username already exists. Choose another one.')</script>");
                txtBoxNewAdminUsername.Focus();
            }
            else
            {

                //hash password
                //string hashPass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtBoxNewAdminPassword.Text, "SHA1");

                //insert new data into LoginDetail
                LoginDetailTable.Login_Id = txtBoxNewAdminUsername.Text;
                LoginDetailTable.Login_Password = txtBoxNewAdminPassword.Text;

                dbAdmin.LoginDetails.InsertOnSubmit(LoginDetailTable);
                dbAdmin.SubmitChanges();

                Response.Write("<script>alert('User has been added successfully.')</script>");
            }
    }
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        LoginDetail theAccount = new LoginDetail();
        String adminLoginID = Session["AdminSession"].ToString();

        var result = (from t in dbAdmin.LoginDetails
                 where t.Login_Password == txtBoxCurrentPassword.Text && t.Login_Id == adminLoginID
                 select t).SingleOrDefault();

        if(result != null)
        {
            //cast LoginDetail to result
            theAccount = (LoginDetail)result;
            theAccount.Login_Password = txtBoxNewPassword.Text;

            foreach(LoginDetail acccount in dbAdmin.LoginDetails)
            {
                if (acccount.Login_Id == theAccount.Login_Id)
                    acccount.Login_Password = theAccount.Login_Password;
            }
            //check to see if both passwords match with the entered password in first textbox
            //LoginDetailTable.Login_Password = txtBoxNewPassword.Text;
            //dbAdmin.LoginDetails.(LoginDetailTable);

            dbAdmin.SubmitChanges();
            Response.Write("<script>alert('Password updated successfully.')</script>");
            lblChangePasswordError.Text = "";
        }
        else
        {
            lblChangePasswordError.Text = "That password does not exist. Ensure your password is correct before changing.";
            txtBoxCurrentPassword.Focus();
        }
    }
    protected void btnAddNewFacultyName_Click(object sender, EventArgs e)
    {
        FacultyType FacultyTypeTable = new FacultyType();

        if (txtBoxNewFacultyName.Text != "")
        {
            //add new values into faculty types table in db
            FacultyTypeTable.Faculty_Name = txtBoxNewFacultyName.Text;
            dbAdmin.FacultyTypes.InsertOnSubmit(FacultyTypeTable);
            dbAdmin.SubmitChanges();

            //Response.Redirect("AdminPage.aspx");
            Response.Write("<script>alert('Faculty Name has been added successfully.')</script>");
            txtBoxNewFacultyName.Text = String.Empty;
            gridViewFaculties.DataBind();
        }
        else
        {

        }
        
    }
    protected void btnAddNewGrantType_Click(object sender, EventArgs e)
    {
        GrantType GrantTypeTable = new GrantType();

        if (txtBoxAddNewGrantType.Text != "")
        {
            //add new values to grant types table in db
            GrantTypeTable.Grant_Name = txtBoxAddNewGrantType.Text;
            dbAdmin.GrantTypes.InsertOnSubmit(GrantTypeTable);
            dbAdmin.SubmitChanges();

            Response.Write("<script>alert('Grant Type has been added successfully.')</script>");
            txtBoxAddNewGrantType.Text = String.Empty;
            gridViewGrantTypes.DataBind();
        }
        else
        {

        }
    }
    protected void btnAddNewCourse_Click(object sender, EventArgs e)
    {
        CourseType CourseTypeTable = new CourseType();

        if (txtBoxAddNewCourse.Text != "")
        {
            CourseTypeTable.Course_Name = txtBoxAddNewCourse.Text;
            dbAdmin.CourseTypes.InsertOnSubmit(CourseTypeTable);
            dbAdmin.SubmitChanges();

            Response.Write("<script>alert('Course Name has been added successfully.')</script>");
            txtBoxAddNewCourse.Text = String.Empty;
            gridViewCourses.DataBind();
        }
    }
}