<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewReport.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container viewReports">
        <h1>Grant Summaries</h1>

        <h4>You can generate grant summaries based on month, year, faculty, and campus.</h4>
        <hr />

        <%-- weekly summary --%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 viewReportsSubHead div2" id="divNine">
            <div class="col-lg-2">
                <h4>Weekly Grant Type Summary:</h4>
            </div>
            <div class="col-lg-4">
                <asp:TextBox ID="ddlWeeklyGrantWeek" CssClass="form-control" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="ddlWeeklyGrantWeek" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="grantTypeWeeklySumm" runat="server" ErrorMessage="Date is required." ForeColor="Red" ControlToValidate="ddlWeeklyGrantWeek"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-4">
                <asp:DropDownList ID="ddl_Grants" AutoPostBack="false" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">Select Grant Type</asp:ListItem>
                    <asp:ListItem Value="Advice">Advice</asp:ListItem>
                    <asp:ListItem Value="Hardship">Hardship</asp:ListItem>
                    <asp:ListItem Value="Petrol">Petrol</asp:ListItem>
                    <asp:ListItem Value="Food">Food</asp:ListItem>
                    <asp:ListItem Value="Bus Ticket">Bus Ticket(s)</asp:ListItem>
                    <asp:ListItem Value="Train Ticket">Train Ticket(s)</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="grantTypeWeeklySumm" runat="server" ErrorMessage="Grant type required." ForeColor="Red" ControlToValidate="ddl_Grants"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-2">
                <asp:Button ID="btnWeeklyGrantTypeSummary" ValidationGroup="grantTypeWeeklySumm" CssClass="btn btn-info pull-right" runat="server" Text="Generate Report" OnClick="btnWeeklyGrantTypeSummary_Click" />
            </div>
            <asp:GridView ID="gridViewGrantTypeWeeklySumm" EmptyDataText="No results" CssClass="table table-hover table-striped summaryGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>

        <%-- monthly grant summary --%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 viewReportsSubHead div1" id="divOne">
            <div class="col-lg-2">
                <h4>Monthly Grant Summary:</h4>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                <asp:DropDownList ID="dropDownListMonth" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">Select Month</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="validMonthDDL" ValidationGroup="monthlyGrantSummary" runat="server" ForeColor="Red" ErrorMessage="Please provide a month." ControlToValidate="dropDownListMonth"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                <asp:DropDownList ID="dropDownListYear" CssClass="form-control dropdown" runat="server">
                    <asp:ListItem Value="">Select Year</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="validYear" ValidationGroup="monthlyGrantSummary" runat="server" ForeColor="Red" ErrorMessage="Please provide a year." ControlToValidate="dropDownListYear"></asp:RequiredFieldValidator>
            </div>
            <asp:GridView ID="gridViewGenerateReports" EmptyDataText="No results" CssClass="table table-hover table-striped summaryGridView" runat="server" AutoGenerateColumns="False" DataSourceID="GenerateReportsSqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Grant_Type" HeaderText="Grant Type" SortExpression="Grant_Type" />
                    <asp:BoundField DataField="TotalStudents" HeaderText="Total Students" SortExpression="TotalStudents" ReadOnly="True" />
                    <asp:BoundField DataField="TotalGrants" HeaderText="Total Grants" ReadOnly="True" SortExpression="TotalGrants" />
                    <asp:BoundField DataField="Funds" HeaderText="Funds" ReadOnly="True" SortExpression="Funds" />
                    <asp:BoundField DataField="KohaFunds" HeaderText="Koha Funds" ReadOnly="True" SortExpression="KohaFunds" />
                    <asp:BoundField DataField="TotalGrantSum" HeaderText="Total Grant Sum" ReadOnly="True" SortExpression="TotalGrantSum" />
                    <asp:BoundField DataField="MonthName" HeaderText="Month" ReadOnly="True" SortExpression="MonthName" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <%-- snippets of the SQL query are from Tony Assadi's example project --%>
            <asp:SqlDataSource ID="GenerateReportsSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>" SelectCommand="SELECT Grant_Type, COUNT(DISTINCT Student_Id) AS TotalStudents, COUNT(Student_Id) AS TotalGrants, SUM(Grant_Value) AS Funds, SUM((KohaFunds)) AS KohaFunds, SUM(Grant_Value) + SUM(ISNULL(KohaFunds, 0)) AS TotalGrantSum, DATENAME(month, Date_Of_Issue) AS MonthName FROM StudentVouchers WHERE (MONTH(Date_Of_Issue) = @Month) AND (YEAR(Date_Of_Issue) = @year) GROUP BY Grant_Type, DATENAME(month, Date_Of_Issue), MONTH(Date_Of_Issue) ORDER BY MonthName">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dropDownListMonth" Name="Month" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dropDownListYear" Name="year" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Button ID="Button2" ValidationGroup="monthlyGrantSummary" runat="server" CssClass="btn btn-info pull-right" Text="Generate Report" PostBackUrl="#divOne" />
        </div>


        <%-- monthly campus grant summary --%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 viewReportsSubHead div2" id="divTwo">
            <div class="col-lg-2">
                <h4>Monthly Campus-Grant Summary:</h4>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                <asp:DropDownList ID="dropDownList5" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">Select Month</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="monthlyCampusGrantSumm" runat="server" ErrorMessage="Month is required." ForeColor="Red" ControlToValidate="dropDownList5"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                <asp:DropDownList ID="dropDownList6" CssClass="form-control dropdown" runat="server">
                    <asp:ListItem Value="">Select Year</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="monthlyCampusGrantSumm" runat="server" ForeColor="Red" ErrorMessage="Year is required." ControlToValidate="dropDownList6"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="Button1" runat="server" ValidationGroup="monthlyCampusGrantSumm" CssClass="btn btn-info pull-right" Text="Generate Report" PostBackUrl="#divTwo" />

            <asp:GridView ID="GridView1" EmptyDataText="No results" runat="server" CssClass="table table-hover table-striped summaryGridView" DataSourceID="MonthlyCampusGrantSummarySqlDataSource1" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Grant_Type" HeaderText="Grant Type" SortExpression="Grant_Type" />
                    <asp:BoundField DataField="CurrentMonth" HeaderText="Current Month" ReadOnly="True" SortExpression="CurrentMonth" />
                    <asp:BoundField DataField="TotalStudents" HeaderText="Total Students" ReadOnly="True" SortExpression="TotalStudents" />
                    <asp:BoundField DataField="TotalGrants" HeaderText="TotalGrants" ReadOnly="True" SortExpression="TotalGrants" />
                    <asp:BoundField DataField="Funds" HeaderText="Funds" ReadOnly="True" SortExpression="Funds" />
                    <asp:BoundField DataField="KohaFunds" HeaderText="Koha Funds" ReadOnly="True" SortExpression="KohaFunds" />
                    <asp:BoundField DataField="GrantAmount" HeaderText="Grant Amount" ReadOnly="True" SortExpression="GrantAmount" />
                    <asp:BoundField DataField="Student_Campus" HeaderText="Campus" SortExpression="Student_Campus" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <%-- snippets of the SQL query are from Tony Assadi's example project --%>
            <asp:SqlDataSource ID="MonthlyCampusGrantSummarySqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>"
                SelectCommand="select A.Grant_Type,datename(MONTH,A.Date_Of_Issue) as CurrentMonth, count(distinct A.Student_Id) as TotalStudents,COUNT( A.Student_Id) as TotalGrants,
                                SUM(Grant_Value) as Funds,
                                SUM(KohaFunds) as KohaFunds,
                                (SUM(Grant_Value)+sum(KohaFunds)) as GrantAmount, B.Student_Campus
                                from StudentVouchers as A join StudentRegistration as B
                                on A.student_ID=B.Student_Id
                                where MONTH(A.Date_Of_Issue)=@month and YEAR(A.Date_Of_Issue)=@Year
                                group by Grant_Type,datename(MONTH,A.Date_Of_Issue),Student_Campus
                                order by Student_Campus">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dropDownList5" Name="month" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dropDownList6" Name="Year" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>


        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 viewReportsSubHead div1" id="divThree">
            <div class="col-lg-2">
                <h4>Monthly Faculty Summary:</h4>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                <%-- year drop down list --%>
                <asp:DropDownList ID="dropDownList3" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">Select Month</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="monthlyFacultySumm" runat="server" ErrorMessage="Month is required." ForeColor="Red" ControlToValidate="dropDownList3"></asp:RequiredFieldValidator>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                <%-- monthly Faculty-Grant summary div --%>
                <asp:DropDownList ID="dropDownList4" CssClass="form-control dropdown" runat="server">
                    <asp:ListItem Value="">Select Year</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="monthlyFacultySumm" runat="server" ErrorMessage="Year is required." ForeColor="Red" ControlToValidate="dropDownList4"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="Button3" runat="server" ValidationGroup="monthlyFacultySumm" CssClass="btn btn-info pull-right" Text="Generate Report" PostBackUrl="#divThree" />
            <asp:GridView ID="GridView2" EmptyDataText="No results" runat="server" CssClass="table table-hover table-striped summaryGridView" AutoGenerateColumns="False" DataSourceID="MonthlyFacultyGrantSummarySqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Grant_Type" HeaderText="Grant Type" SortExpression="Grant_Type" />
                    <asp:BoundField DataField="CurrentMonth" HeaderText="Current Month" ReadOnly="True" SortExpression="CurrentMonth" />
                    <asp:BoundField DataField="TotalStudents" HeaderText="Total Students" ReadOnly="True" SortExpression="TotalStudents" />
                    <asp:BoundField DataField="TotalGrants" HeaderText="Total Grants" ReadOnly="True" SortExpression="TotalGrants" />
                    <asp:BoundField DataField="Totalamount" HeaderText="Total Amount" ReadOnly="True" SortExpression="Totalamount" />
                    <asp:BoundField DataField="Student_Faculty" HeaderText="Faculty" SortExpression="Student_Faculty" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="MonthlyFacultyGrantSummarySqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>" SelectCommand="select Grant_Type,datename(MONTH,A.Date_Of_Issue) as CurrentMonth, COUNT(distinct A.Student_Id) as TotalStudents,
             COUNT( A.Student_Id) as TotalGrants,
             SUM(Grant_Value+ISNULL(KohaFunds,0)) as Totalamount, B.Student_Faculty 
             from StudentVouchers as A join StudentRegistration as B on A.Student_Id=B.Student_Id 
             where MONTH(A.Date_Of_Issue)=@Month and Year(A.Date_Of_Issue)=@Year
            group by datename(MONTH,A.Date_Of_Issue),Student_Faculty,Grant_Type">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dropDownList3" Name="Month" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dropDownList4" Name="Year" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>


        <%-- year-to-date summary --%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 viewReportsSubHead div2" id="divFour">
            <div class="col-lg-2">
                <h4>Year-to-Date Summary</h4>
            </div>
            <div class="col-lg-8">
                <asp:DropDownList ID="dropDownList12" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">Select Year</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="yearToDateSumm" ErrorMessage="Year is required." ForeColor="Red" ControlToValidate="dropDownList12"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="Button4" runat="server" Text="Generate Report" CssClass="btn btn-info pull-right" ValidationGroup="yearToDateSumm" PostBackUrl="#divFour" />

            <asp:GridView ID="gridViewMonthlyFacultySummary" EmptyDataText="No results" runat="server" CssClass="table table-hover table-striped summaryGridView" AutoGenerateColumns="False" DataSourceID="YearToDateSummarySqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Grant_Type" HeaderText="Grant_Type" SortExpression="Grant_Type" />
                    <asp:BoundField DataField="TotalStudents" HeaderText="TotalStudents" ReadOnly="True" SortExpression="TotalStudents" />
                    <asp:BoundField DataField="TotalGrants" HeaderText="TotalGrants" ReadOnly="True" SortExpression="TotalGrants" />
                    <asp:BoundField DataField="GrantAmount" HeaderText="GrantAmount" ReadOnly="True" SortExpression="GrantAmount" />
                    <asp:BoundField DataField="KohaGrantAmount" HeaderText="KohaGrantAmount" ReadOnly="True" SortExpression="KohaGrantAmount" />
                    <asp:BoundField DataField="TotalGrantAmount" HeaderText="TotalGrantAmount" ReadOnly="True" SortExpression="TotalGrantAmount" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="YearToDateSummarySqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>" SelectCommand="select Grant_Type,COUNT(distinct Student_Id) as TotalStudents,
            COUNT(Student_Id) as TotalGrants,
            SUM(Grant_Value) as GrantAmount,
            SUM(ISNULL(kohaFunds,0)) as KohaGrantAmount,
            SUM(Grant_Value)+SUM(ISNULL(KohaFunds,0)) as TotalGrantAmount
            from StudentVouchers
            where YEAR(Date_Of_Issue)=@Year
            group by Grant_Type">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dropDownList12" Name="Year" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <%-- grants by selected date div --%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 viewReportsSubHead div1" id="divFive">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="col-lg-2">
                <h4>Grant by Selected Date:</h4>
            </div>
            <div class="col-lg-8">
                <%-- calendar extension code from http://www.ajaxcontroltoolkit.com/Calendar/Calendar.aspx --%>
                <p style="color: #444; font-size: 11px;">*Click below to prompt calendar</p>
                <asp:TextBox ID="calendarTxtBox" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="calendarSumm" ForeColor="Red" runat="server" ErrorMessage="Date is required." ControlToValidate="calendarTxtBox"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Not a valid date." ForeColor="Red" ControlToValidate="calendarTxtBox" ValidationExpression="^[0-9m]{1,2}/[0-9d]{1,2}/[0-9y]{4}$" ValidationGroup="calendarSumm"></asp:RegularExpressionValidator>
                <cc1:CalendarExtender ID="CalendarExtender1" Format="dd/MM/yyyy" runat="server" TargetControlID="calendarTxtBox" />
            </div>
            <asp:Button ID="btnGrantBySelectedDate" CssClass="btn btn-info pull-right" ValidationGroup="calendarSumm" runat="server" Text="Generate Report" PostBackUrl="#divFive" OnClick="btnGrantBySelectedDate_Click" />
            <asp:GridView ID="gridViewBySelectedDate" EmptyDataText="No results" runat="server" CssClass="table table-hover table-striped summaryGridView" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

            </asp:GridView>
        </div>

        <%-- grants by gender --%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 viewReportsSubHead div2" id="divSix">
            <div class="col-lg-2">
                <h4>Grants by Gender:</h4>
            </div>
            <div class="col-lg-8">
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">Select Gender</asp:ListItem>
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="DropDownList1" runat="server" ErrorMessage="Gender is required." ValidationGroup="genderSummary" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <asp:GridView ID="GridView3" EmptyDataText="No results" runat="server" CssClass="table table-hover table-striped summaryGridView" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:Button ID="Button6" runat="server" CssClass="btn btn-info pull-right" ValidationGroup="genderSummary" Text="Generate Report" OnClick="Button6_Click" PostBackUrl="#divSix" />
        </div>

        <%-- grants by ethnicity div --%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 viewReportsSubHead div1" id="divSeven">
            <div class="col-lg-2">
                <h4>Grants by Ethnicity:</h4>
            </div>
            <div class="col-lg-8">
                <asp:DropDownList ID="dropDownEthnicity" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">Select Ethnicity</asp:ListItem>
                    <asp:ListItem Value="NZ European">NZ European</asp:ListItem>
                    <asp:ListItem Value="Maori">Maori</asp:ListItem>
                    <asp:ListItem Value="Pacifika">Pacifika</asp:ListItem>
                    <asp:ListItem Value="Other">Other</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="dropDownEthnicity" ValidationGroup="ethnicityGrant" runat="server" ErrorMessage="Ethnicity is required." ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <asp:GridView ID="gridViewEthnicityGrantSummary" EmptyDataText="No results" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:Button ID="btnEthnicityGrantSummary" runat="server" Text="Generate Report" CausesValidation="true" ValidationGroup="ethnicityGrant" CssClass="btn btn-info pull-right" OnClick="btnEthnicityGrantSummary_Click" PostBackUrl="#divSeven" />
        </div>

        <%-- grants by age --%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 viewReportsSubHead div2" id="divEight">
            <div class="col-lg-2">
                <h4>Grants by Age:</h4>
            </div>
            <div class="col-lg-8">
                <asp:DropDownList ID="dropDownListAge" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">Select Age</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="grantByAge" runat="server" ErrorMessage="Age is required." ForeColor="Red" ControlToValidate="dropDownListAge"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="btnGrantByAge" PostBackUrl="#divEight" runat="server" ValidationGroup="grantByAge" CssClass="btn btn-info pull-right" Text="Generate Report" OnClick="btnGrantByAge_Click" />
            <asp:GridView ID="gridViewGrantByAge" EmptyDataText="No results" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="DATE_OF_ISSUE" DataFormatString="{0: d MMMM, yyyy}" HeaderText="Date" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>

