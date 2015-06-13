<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IndividualProfile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container backLink">
        <%-- redirect back to Student Profiles --%>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/StudentProfile.aspx">
            <span class="glyphicon glyphicon-arrow-left"></span>
        </asp:HyperLink>
    </div>
    <br />

    <%-- individual profile container --%>
    <div class="container individualProfile">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="Student_Id" DataSourceID="IndividualProfileSqlDataSource1">
            <ItemTemplate>
                Student Id:
            <asp:Label ID="Student_IdLabel" runat="server" Text='<%# Eval("Student_Id") %>' />
                <br />
                First Name:
            <asp:Label ID="Student_FirstNameLabel" runat="server" Text='<%# Eval("Student_FirstName") %>' />
                <br />
                Last Name:
            <asp:Label ID="Student_LastNameLabel" runat="server" Text='<%# Eval("Student_LastName") %>' />
                <br />
                Gender:
            <asp:Label ID="Student_GenderLabel" runat="server" Text='<%# Eval("Student_Gender") %>' />
                <br />
                Date Of Birth:
            <asp:Label ID="Student_DateOfBirthLabel" runat="server" Text='<%# Eval("Student_DateOfBirth", "{0:dd MMMM yyyy}") %>' />
                <br />
                Address 1:
            <asp:Label ID="Student_Address1Label" runat="server" Text='<%# Eval("Student_Address1") %>' />
                <br />
                Accomodation Type:
            <asp:Label ID="Student_Accomodation_TypeLabel" runat="server" Text='<%# Eval("Student_Accomodation_Type") %>' />
                <br />
                Phone:
            <asp:Label ID="Student_PhoneLabel" runat="server" Text='<%# Eval("Student_Phone") %>' />
                <br />
                Mobile:
            <asp:Label ID="Student_MobileLabel" runat="server" Text='<%# Eval("Student_Mobile") %>' />
                <br />
                Email:
            <asp:Label ID="Student_EmailLabel" runat="server" Text='<%# Eval("Student_Email") %>' />
                <br />
                Marital Status:
            <asp:Label ID="Student_Marital_StatusLabel" runat="server" Text='<%# Eval("Student_Marital_Status") %>' />
                <br />
                Contact:
            <asp:Label ID="Student_ContactLabel" runat="server" Text='<%# Eval("Student_Contact") %>' />
                <br />
                Main Ethnicity:
            <asp:Label ID="Student_Main_EthnicityLabel" runat="server" Text='<%# Eval("Student_Main_Ethnicity") %>' />
                <br />
                Faculty:
            <asp:Label ID="Student_FacultyLabel" runat="server" Text='<%# Eval("Student_Faculty") %>' />
                <br />
                Courses:
            <asp:Label ID="Student_CoursesLabel" runat="server" Text='<%# Eval("Student_Courses") %>' />
                <br />
                Detailed Ethnicity:
            <asp:Label ID="Student_Detailed_EthnicityLabel" runat="server" Text='<%# Eval("Student_Detailed_Ethnicity") %>' />
                <br />
                Campus:
            <asp:Label ID="Student_CampusLabel" runat="server" Text='<%# Eval("Student_Campus") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
    </div>
    <asp:SqlDataSource ID="IndividualProfileSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>" SelectCommand="SELECT * FROM [StudentRegistration] WHERE ([Student_Id] = @Student_Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Student_Id" QueryStringField="Student_Id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

