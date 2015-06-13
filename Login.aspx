<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/customStyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="loginForm">
            <div class="container ">
                <h1 style="color: black">Student Financial Support</h1>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ForgotPassword.aspx">Forgotten Password?</asp:HyperLink>
                <hr />
                <asp:Label ID="usernamePromptLabel" runat="server" Text=""></asp:Label>
                
                <p>Username:</p>
                <asp:TextBox ID="usernameTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validUsername" ForeColor="Red" runat="server" ErrorMessage="Username is required." ControlToValidate="usernameTxtBox"></asp:RequiredFieldValidator>
                
                <p>Password:</p>
                <asp:TextBox ID="passwordTxtBox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validPassword" ForeColor="Red" runat="server" ErrorMessage="Password is required." ControlToValidate="passwordTxtBox"></asp:RequiredFieldValidator>
                
                <br />
                
                <br />
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-info" OnClick="btnLogin_Click" />

            </div>
        </div>
        <div>
            <footer style="background-color: #555; padding: 20px; margin-top: 0px; height: 100px; text-align: center;">
                <h3>Copyright &copy; Student Financial Support 2015</h3>
            </footer>
        </div>
    </form>
</body>
</html>
