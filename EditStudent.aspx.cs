using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    //create new db data context instance
    StudentFinancialServicesDataClassesDataContext db = new StudentFinancialServicesDataClassesDataContext();

    //declare variables for text field values
    public string studentID, studentFname, studentLname, studentGender, studentDOB, studentAddress1, studentAccomType, studentPhone, studentMobile,
                  studentEmail, studentMaritalStat, studentContact, studentMainEth, studentFaculty, studentCourses, studentDetailEth, studentCampus;
    protected void Page_Load(object sender, EventArgs e)
    {
        //DateTime DOB;
        //DOB = Convert.ToDateTime(dobTxtBox.Text);

        //initialize text field values
        studentID = studentIdTxtBox.Text;
        studentFname = studentFNameTxtBox.Text;
        studentLname = studentLNameTxtBox.Text;
        studentGender = genderRadio.SelectedValue;

        studentDOB = dobTxtBox.Text;

        studentAddress1 = studentAddressTxtBox.Text;
        studentAccomType = accomDropDownList.SelectedValue;
        studentPhone = studentPhoneTxtBox.Text;
        studentMobile = studentMobileTxtBox.Text;
        studentEmail = studentEmailTxtBox.Text;
        studentMaritalStat = maritalDropDownList.SelectedValue;
        studentContact = studentContactTxtBox.Text;
        studentMainEth = mainEthDropDownList.SelectedValue;
        studentFaculty = facultyDropDownList.SelectedValue;
        studentCourses = coursesTxtBox.Text;
        studentDetailEth = detailedEthnicityDropDownList.SelectedValue;
        studentCampus = campusDropDownList.SelectedValue;

        if (Request.QueryString["Student_Id"] != null)
        {
            var query = from m in db.StudentRegistrations
                        where m.Student_Id == Request.QueryString["Student_Id"]
                        select m;

            foreach (var q in query)
            {
                studentIdTxtBox.Text = q.Student_Id;
                studentFNameTxtBox.Text = q.Student_FirstName;
                studentLNameTxtBox.Text = q.Student_LastName;
                genderRadio.SelectedValue = q.Student_Gender;

                dobTxtBox.Text = q.Student_DateOfBirth.ToString("dd/MM/yyyy");

                studentAddressTxtBox.Text = q.Student_Address1;
                accomDropDownList.SelectedValue = q.Student_Accomodation_Type;
                studentPhoneTxtBox.Text = q.Student_Phone;
                studentMobileTxtBox.Text = q.Student_Mobile;
                studentEmailTxtBox.Text = q.Student_Email;
                maritalDropDownList.SelectedValue = q.Student_Marital_Status;
                studentContactTxtBox.Text = q.Student_Contact;
                mainEthDropDownList.SelectedValue = q.Student_Main_Ethnicity;
                facultyDropDownList.SelectedValue = q.Student_Faculty;
                coursesTxtBox.Text = q.Student_Courses;
                detailedEthnicityDropDownList.SelectedValue = q.Student_Detailed_Ethnicity;
                campusDropDownList.SelectedValue = q.Student_Campus;
            }
            getData();
        }
    }

    void getData()
    {
        //var query = from m in db.StudentRegistrations
        //            where m.Id == Request.QueryString["Id"]
        //            select m;
        //foreach (var q in query)
        //{
        //    idTxtBox.Text = q.Id;
        //    firstNameTxtBox.Text = q.FirstName;
        //    lastNameTxtbox.Text = q.LastName;
        //}
    }
    protected void btnEditStudent_Click(object sender, EventArgs e)
    {
        //using sessions to transfer data
        Session["id"] = studentID;
        Session["fname"] = studentFname;
        Session["lname"] = studentLname;
        Session["gender"] = studentGender;
        Session["dob"] = studentDOB;
        Session["address"] = studentAddress1;
        Session["accomodation"] = studentAccomType;
        Session["phone"] = studentPhone;
        Session["mobile"] = studentMobile;
        Session["email"] = studentEmail;
        Session["maritalStat"] = studentMaritalStat;
        Session["contact"] = studentContact;
        Session["mainEthnicity"] = studentMainEth;
        Session["faculty"] = studentFaculty;
        Session["courses"] = studentCourses;
        Session["detailedEthnicity"] = studentDetailEth;
        Session["campus"] = studentCampus;

        Response.Redirect("ConfirmUpdate.aspx?Student_Id=" + Request.QueryString["Student_Id"]);
    }
}