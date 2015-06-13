<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditStudent.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h1>Edit Student Details</h1>
        <hr />
        <p>Student ID:</p>
        <asp:TextBox ID="studentIdTxtBox" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="studentIDValidator" runat="server" ErrorMessage="Student ID required" ForeColor="Red" ControlToValidate="studentIdTxtBox"></asp:RequiredFieldValidator>

        <p>First Name:</p>
        <asp:TextBox ID="studentFNameTxtBox" CssClass="form-control" runat="server"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="fNameValidator" runat="server" ErrorMessage="First name required" ForeColor="Red" ControlToValidate="studentFNameTxtBox"></asp:RequiredFieldValidator>

        <p>Last Name:</p>
        <asp:TextBox ID="studentLNameTxtBox" CssClass="form-control" runat="server"></asp:TextBox>
        <%-- gender radio button list --%>
        <p>Gender:</p>
        <asp:RadioButtonList runat="server" ID="genderRadio">
            <asp:ListItem Value="Male">Male</asp:ListItem>
            <asp:ListItem Value="Female">Female</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="genderValidator" runat="server" ErrorMessage="Select gender" ForeColor="Red" ControlToValidate="genderRadio"></asp:RequiredFieldValidator>

        <%-- dob calendar --%>
        <p>Date of Birth:</p>
        <asp:TextBox ID="dobTxtBox" CssClass="form-control" runat="server"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="dobValidator" runat="server" ForeColor="Red" ErrorMessage="Date of Birth required" ControlToValidate="dobTxtBox"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="dobRegexValidator" ForeColor="Red" runat="server" ErrorMessage='Please provide a correct Date format. E.g "26/12/1993".' ControlToValidate="dobTxtBox" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>

        <p>Address:</p>
        <asp:TextBox ID="studentAddressTxtBox" CssClass="form-control" runat="server"></asp:TextBox>

        <%-- accomodation dropdown --%>
        <p>Accomodation:</p>
        <asp:DropDownList ID="accomDropDownList" CssClass="form-control" runat="server">
            <asp:ListItem Value="">Select accomodation type</asp:ListItem>
            <asp:ListItem Value="Flat">Flat</asp:ListItem>
            <asp:ListItem Value="Day School">Day school</asp:ListItem>
        </asp:DropDownList>

        <p>Phone:</p>
        <asp:TextBox ID="studentPhoneTxtBox" CssClass="form-control" runat="server"></asp:TextBox>
        <p>Mobile:</p>
        <asp:TextBox ID="studentMobileTxtBox" CssClass="form-control" runat="server"></asp:TextBox>
        <p>Email:</p>
        <asp:TextBox ID="studentEmailTxtBox" CssClass="form-control" runat="server"></asp:TextBox>

        <%-- marital status dropdown --%>
        <p>Marital Status:</p>
        <asp:DropDownList ID="maritalDropDownList" CssClass="form-control" runat="server">
            <asp:ListItem Value="">Select Marital Status</asp:ListItem>
            <asp:ListItem Value="Married">Married</asp:ListItem>
            <asp:ListItem Value="Single">Single</asp:ListItem>
            <asp:ListItem Value="Divorced">Divorced</asp:ListItem>
        </asp:DropDownList>
        <p>Contact:</p>
        <asp:TextBox ID="studentContactTxtBox" CssClass="form-control" runat="server"></asp:TextBox>

        <%-- main ethnicity dropdown--%>
        <p>Main Ethnicity:</p>
        <asp:DropDownList ID="mainEthDropDownList" CssClass="form-control" runat="server">
            <asp:ListItem Value="">Select Ethnicity</asp:ListItem>
            <asp:ListItem Value="NZ European">NZ European</asp:ListItem>
            <asp:ListItem Value="Maori">Maori</asp:ListItem>
            <asp:ListItem Value="Pacifika">Pacifika</asp:ListItem>
            <asp:ListItem Value="Other">Other</asp:ListItem>
        </asp:DropDownList>

        <%-- faculty dropdown --%>
        <p>Faculty:</p>
        <asp:DropDownList ID="facultyDropDownList" CssClass="form-control" runat="server">
            <asp:ListItem Value="">Select Faculty</asp:ListItem>
            <asp:ListItem Value="Business">Business</asp:ListItem>
            <asp:ListItem Value="Nursing">Nursing</asp:ListItem>
            <asp:ListItem Value="Information Technology">Information Technology</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:RequiredFieldValidator ID="facultyValidator" runat="server" ErrorMessage="Select a faculty" ControlToValidate="facultyDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>

        <p>Courses:</p>
        <asp:TextBox ID="coursesTxtBox" CssClass="form-control" runat="server"></asp:TextBox>
        <%-- detailed ethnicity dropdown --%>
        <p>Detailed Ethnicity:</p>
        <asp:DropDownList ID="detailedEthnicityDropDownList" CssClass="form-control" runat="server">
            <asp:ListItem Value="">Select Ethnicity</asp:ListItem>
            <asp:ListItem Value="NZ European">NZ European</asp:ListItem>
            <asp:ListItem Value="Maori">Maori</asp:ListItem>
            <asp:ListItem Value="Pacifika">Pacifika</asp:ListItem>
            <asp:ListItem Value="Other">Other</asp:ListItem>
        </asp:DropDownList>
        <%-- campus dropdown --%>
        <p>Campus:</p>
        <asp:DropDownList ID="campusDropDownList" CssClass="form-control" runat="server" >
            <asp:ListItem Value="">Select Campus</asp:ListItem>
            <asp:ListItem Value="Porirua">Porirua</asp:ListItem>
            <asp:ListItem Value="Wellington">Wellington</asp:ListItem>
            <asp:ListItem Value="Auckland">Auckland</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:RequiredFieldValidator ID="campusValidator" runat="server" ErrorMessage="Select a campus" ForeColor="Red" ControlToValidate="campusDropDownList"></asp:RequiredFieldValidator>

        <br />
        <br />
        <asp:Button ID="btnEditStudent" runat="server" Text="Update" CssClass="btn btn-info" OnClick="btnEditStudent_Click" />
    </div>
</asp:Content>

