using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    StudentFinancialServicesDataClassesDataContext db = new StudentFinancialServicesDataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        //populate faculty dropdown list with linq query
        BindFacultyTypes();
        //populate courses dropdown list with linq query
        BindCourseTypes();
    }

    //bind FacultyTypes table values to grant types dropdown list
    //code from http://stackoverflow.com/questions/554649/how-to-bind-linq-data-to-dropdownlist
    protected void BindFacultyTypes()
    {
        using (var dc = new StudentFinancialServicesDataClassesDataContext())
        {
            facultyDropDownList.DataSource = from p in db.FacultyTypes
                                             orderby 0
                                             select new { p.Faculty_Name, p.Faculty_Id };
            facultyDropDownList.DataTextField = "Faculty_Name";
            facultyDropDownList.DataValueField = "Faculty_Name";
            facultyDropDownList.DataBind();
        }
    }
    //bind CourseTypes table values to courses dropdown list
    //code from http://stackoverflow.com/questions/554649/how-to-bind-linq-data-to-dropdownlist
    protected void BindCourseTypes()
    {
        using (var ct = new StudentFinancialServicesDataClassesDataContext())
        {
            dropDownListCourses.DataSource = from m in db.CourseTypes
                                             orderby 0
                                             select new { m.Course_Name, m.Course_Id };
            dropDownListCourses.DataTextField = "Course_Name";
            dropDownListCourses.DataValueField = "Course_Name";
            dropDownListCourses.DataBind();
        }
    }
    protected void btnAddStudent_Click(object sender, EventArgs e)
    {
        DateTime DOB;

        StudentFinancialServicesDataClassesDataContext db = new StudentFinancialServicesDataClassesDataContext();
        StudentRegistration StudentRegistrationTable = new StudentRegistration();

        DOB = Convert.ToDateTime(dobTxtBox.Text);

        //code from https://www.youtube.com/watch?v=8ql8SWYRzOk
        var checkUsername = (from t in db.StudentRegistrations
                             where t.Student_Id == studentIdTxtBox.Text
                             select t).SingleOrDefault();
        //check first if student id already exists
        if (checkUsername != null)
        {
            Response.Write("<script>alert('ID already exists. Choose another one.')</script>");
            studentAddressTxtBox.Text = String.Empty;
            studentIdTxtBox.Focus();
        }
        else
        {
            StudentRegistrationTable.Student_Id = studentIdTxtBox.Text;
            StudentRegistrationTable.Student_FirstName = studentFNameTxtBox.Text;
            StudentRegistrationTable.Student_LastName = studentLNameTxtBox.Text;
            StudentRegistrationTable.Student_Gender = genderRadio.SelectedValue;

            StudentRegistrationTable.Student_DateOfBirth = DOB;

            StudentRegistrationTable.Student_Address1 = studentAddressTxtBox.Text;
            StudentRegistrationTable.Student_Accomodation_Type = accomDropDownList.SelectedValue;
            StudentRegistrationTable.Student_Phone = studentPhoneTxtBox.Text;
            StudentRegistrationTable.Student_Mobile = studentMobileTxtBox.Text;
            StudentRegistrationTable.Student_Email = studentEmailTxtBox.Text;
            StudentRegistrationTable.Student_Marital_Status = maritalDropDownList.SelectedValue;
            StudentRegistrationTable.Student_Contact = studentContactTxtBox.Text;
            StudentRegistrationTable.Student_Main_Ethnicity = mainEthDropDownList.SelectedValue;
            StudentRegistrationTable.Student_Faculty = facultyDropDownList.SelectedValue;
            StudentRegistrationTable.Student_Courses = dropDownListCourses.SelectedValue;
            StudentRegistrationTable.Student_Detailed_Ethnicity = detailedEthnicityDropDownList.SelectedValue;
            StudentRegistrationTable.Student_Campus = campusDropDownList.SelectedValue;

            db.StudentRegistrations.InsertOnSubmit(StudentRegistrationTable);
            db.SubmitChanges();

            Response.Write("<script>alert('Student has been added successfully.')</script>");
            //Response.Redirect("ViewStudents.aspx");
        }
    }
}