<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/customStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <%-- redirect back to Student Profiles --%>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">
            <span class="glyphicon glyphicon-arrow-left" style="font-size: 2em; color: yellowgreen; margin-top: 10px;"></span>
            </asp:HyperLink>
            <h1>Retrieve Password</h1>
            <p>To retrieve your fogortten password, first enter your username.</p>
            <hr />
            <p>Username:</p>
            <asp:TextBox ID="txtRetrievePassUsername" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validRetrievePassUsername" runat="server" ForeColor="Red" ErrorMessage="Enter your username." ControlToValidate="txtRetrievePassUsername"></asp:RequiredFieldValidator>
            <p>Email Address:</p>
            <asp:TextBox ID="txtBoxEmailAdd" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="validEmailAdd" runat="server" ForeColor="Red" ErrorMessage="Enter your email address." ControlToValidate="txtBoxEmailAdd"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexEmailAdd" runat="server" ForeColor="Red" ErrorMessage="Enter a valid email address." ControlToValidate="txtBoxEmailAdd" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <asp:Button ID="btnRecoverPassword" runat="server" CssClass="btn btn-info" Text="Submit" OnClick="btnRecoverPassword_Click" />
            <br />
        </div>
    </form>
</body>
</html>
