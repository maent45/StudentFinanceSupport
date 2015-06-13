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
    StudentVoucher StudentVoucherTable = new StudentVoucher();
    protected void Page_Load(object sender, EventArgs e)
    {
        //gridViewCalendar.DataBind();
        //call both binding methods on page load to populate month and year dropdown lists
        bindMonth();
        bindYear();
        bindAge();
        //BindGrantTypes();
    }
    //bind GrantTypes table values to grant types dropdown list
    //code from http://stackoverflow.com/questions/554649/how-to-bind-linq-data-to-dropdownlist
    protected void BindGrantTypes()
    {
        using (var dc = new StudentFinancialServicesDataClassesDataContext())
        {
            ddl_Grants.DataSource = from p in db.GrantTypes
                                    orderby 0
                                    select new { p.Grant_Name, p.Grant_Id };
            ddl_Grants.DataTextField = "Grant_Name";
            ddl_Grants.DataValueField = "Grant_Name";
            ddl_Grants.DataBind();
        }
    }
    //weekly grant type summary
    protected void btnWeeklyGrantTypeSummary_Click(object sender, EventArgs e)
    {
        gridViewGrantTypeWeeklySumm.DataBind();
        
        DateTime startDate = Convert.ToDateTime(ddlWeeklyGrantWeek.Text);

        DateTime endDate = startDate;

        endDate = endDate.AddDays(6);

        string grant_type = ddl_Grants.SelectedValue;

        var grantTypeSumm = from grant in db.StudentVouchers
                            //join grant_types in db.GrantTypes on grant.Grant_Type equals grant_types.Grant_Name
                            where grant.Grant_Type == grant_type &&
                            grant.Date_Of_Issue >= startDate && grant.Date_Of_Issue < endDate
                            select grant;

        foreach (var q in grantTypeSumm)
        {
            gridViewGrantTypeWeeklySumm.DataSource = grantTypeSumm.ToList();
            gridViewGrantTypeWeeklySumm.DataBind();
        }
    }
    //dynamically bind month to month dropdown list
    //code from http://www.aspsnippets.com/Articles/Populate-dynamic-month-names-in-ASPNet-DropDownList.aspx
    private void bindMonth()
    {
        for (int i = 1; i <= 12; i++)
        {
            dropDownListMonth.Items.Add(new System.Web.UI.WebControls.ListItem(DateTimeFormatInfo.CurrentInfo.GetMonthName(i), i.ToString()));
            //ddlWeeklyGrantMonth.Items.Add(new System.Web.UI.WebControls.ListItem(DateTimeFormatInfo.CurrentInfo.GetMonthName(i), i.ToString()));
            dropDownList3.Items.Add(new System.Web.UI.WebControls.ListItem(DateTimeFormatInfo.CurrentInfo.GetMonthName(i), i.ToString()));
            dropDownList5.Items.Add(new System.Web.UI.WebControls.ListItem(DateTimeFormatInfo.CurrentInfo.GetMonthName(i), i.ToString()));
            //ddlWeeklyGrantYear.Items.Add(new System.Web.UI.WebControls.ListItem(DateTimeFormatInfo.CurrentInfo.GetMonthName(i), i.ToString()));
            //dropDownList9.Items.Add(new System.Web.UI.WebControls.ListItem(DateTimeFormatInfo.CurrentInfo.GetMonthName(i), i.ToString()));
        }
    }

    //dynamically bind year to year dropdown list
    //code from http://www.aspsnippets.com/Articles/Populate-dynamic-month-names-in-ASPNet-DropDownList.aspx
    private void bindYear()
    {
        //create an int variable for year property
        int year = (System.DateTime.Now.Year);

        for (int intCount = year; intCount >= 1980; intCount--)
        {
            dropDownListYear.Items.Add(intCount.ToString());
            //ddlWeeklyGrantYear.Items.Add(intCount.ToString());
            dropDownList4.Items.Add(intCount.ToString());
            dropDownList6.Items.Add(intCount.ToString());
            //dropDownList8.Items.Add(intCount.ToString());
            dropDownList12.Items.Add(intCount.ToString());
        }
    }

    //bind age to dropdown list
    //code from http://stackoverflow.com/questions/5940070/c-sharp-dropdown-items-0-100-without-adding-each-item
    private void bindAge()
    {
        dropDownListAge.Items.AddRange(Enumerable.Range(18, 83).Select(e => new ListItem(e.ToString())).ToArray());
    }
    //gender summary
    protected void Button6_Click(object sender, EventArgs e)
    {
        /*from student in db.StudentRegistrations 
                                 join grants in db.StudentVouchers on student.Student_ID equals grants.student_ID*/

        //code for joining tables from Luke Hardiman
        var genderSumm = from student in db.StudentRegistrations
                         join grant in db.StudentVouchers on student.Student_Id equals grant.Student_Id
                         where grant.StudentRegistration.Student_Gender == DropDownList1.SelectedValue.ToString()
                         select grant;

        foreach (var q in genderSumm)
        {
            GridView3.DataSource = genderSumm.ToList();
            GridView3.DataBind();
        }
    }

    //ethnicity grant summary linq query
    protected void btnEthnicityGrantSummary_Click(object sender, EventArgs e)
    {
        var ethnicitySumm = from student in db.StudentRegistrations
                            join grant in db.StudentVouchers on student.Student_Id equals grant.Student_Id
                            where grant.StudentRegistration.Student_Detailed_Ethnicity == dropDownEthnicity.SelectedValue.ToString()
                            select grant;

        foreach (var q in ethnicitySumm)
        {
            gridViewEthnicityGrantSummary.DataSource = ethnicitySumm.ToList();
            gridViewEthnicityGrantSummary.DataBind();
        }
    }

    //grants by age summary
    protected void btnGrantByAge_Click(object sender, EventArgs e)
    {
        gridViewGrantByAge.DataBind();
        //code from http://stackoverflow.com/questions/1348080/convert-a-positive-number-to-negative-in-c-sharp
        int theAge = Convert.ToInt32(dropDownListAge.SelectedValue.ToString()) * -1;

        //check year minus from this year
        DateTime theDate = DateTime.Now.AddYears(theAge);

        var ageGrant = from student in db.StudentRegistrations
                       join grantByAge in db.StudentVouchers on student.Student_Id equals grantByAge.Student_Id
                       //where clause by year of student
                       where grantByAge.StudentRegistration.Student_DateOfBirth.Year == theDate.Year
                       select grantByAge;

        foreach (var q in ageGrant)
        {
            gridViewGrantByAge.DataSource = ageGrant.ToList();
            gridViewGrantByAge.DataBind();
        }
    }

    //grants by selected date summary
    protected void btnGrantBySelectedDate_Click(object sender, EventArgs e)
    {
        DateTime selectedDate = Convert.ToDateTime(calendarTxtBox.Text);

        var selectedDateGrant = from student in db.StudentRegistrations
                                join grantSelectedDate in db.StudentVouchers on student.Student_Id equals grantSelectedDate.Student_Id
                                where grantSelectedDate.Date_Of_Issue == selectedDate
                                //Convert.ToDateTime(grantSelectedDate.Date_Of_Issue).ToString("yyyy-MM-dd") == Convert.ToDateTime(calendarTxtBox.Text).ToString("yyyy-MM-dd")
                                select grantSelectedDate;

        /*e.Row.Cells.Cast<TableCell>()
           .Where(c => c.Text == "name")
           .ToList()
           .ForEach(col => col.Visible = false);*/

        gridViewBySelectedDate.DataSource = selectedDateGrant.ToList();
        //gridViewBySelectedDate.Columns[5].Visible = false;
        gridViewBySelectedDate.DataBind();
    }
}