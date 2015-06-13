<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditGrant.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h1>Edit Grant</h1>
        <hr />
        <%-- student ID which is obtained through Request.QueryString on previous page --%>
        <p>Grant Reference Number:</p>
        <asp:TextBox ID="txtBoxGrantRefNo" runat="server" ReadOnly="True" CssClass="disabled form-control"></asp:TextBox>

        <br />
        <%-- grant type dropdown list --%>
        <p>Grant Type:</p>
        <asp:DropDownList ID="dropDownListGrantType" runat="server" CssClass="form-control" AutoPostBack="False" >
            <asp:ListItem Value="">Select grant type</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="validGrantTypeDDL" runat="server" ForeColor="Red" ErrorMessage="Select grant type" ControlToValidate="dropDownListGrantType"></asp:RequiredFieldValidator>

        <p>Grant Description:</p>
        <asp:TextBox ID="txtBoxGrantDesc" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150"></asp:TextBox>
        <asp:RequiredFieldValidator ID="validGrantDesc" runat="server" ErrorMessage="Describe the grant" ControlToValidate="txtBoxGrantDesc"></asp:RequiredFieldValidator>

        <br />
        <asp:Label ID="labelGrantValue" runat="server" Text="Grant Value:"></asp:Label>
        <asp:TextBox ID="txtBoxGrantValue" runat="server" CssClass="form-control"></asp:TextBox>
        <%--<asp:RegularExpressionValidator ID="regexValidGrantValue" runat="server" ForeColor="Red" ErrorMessage="Input numbers only" ValidationExpression="\d+" ControlToValidate="txtBoxGrantValue"></asp:RegularExpressionValidator>--%>
        <br />

        <p>Date of Issue:</p>
        <asp:TextBox ID="txtBoxGrantDOI" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="validDateOfIssue" runat="server" ForeColor="Red" ErrorMessage="Provide a date" ControlToValidate="txtBoxGrantDOI"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regexValidDOI" ForeColor="Red" runat="server" ErrorMessage='Please provide a correct Date format. E.g "26/12/1993".' ControlToValidate="txtBoxGrantDOI" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"></asp:RegularExpressionValidator>

        <br />
        <asp:Label ID="labelKohaFunds" runat="server" Text="Koha Funds:"></asp:Label>
        <asp:TextBox ID="txtKohaFunds" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RegularExpressionValidator ID="regexValidKohaFunds" runat="server" ForeColor="Red" ErrorMessage="Input numbers only" ValidationExpression="\d+" ControlToValidate="txtKohaFunds"></asp:RegularExpressionValidator>

        <br />
        <br />
        <asp:Button ID="btnEditGrant" runat="server" Text="Edit Grant" CssClass="btn btn-info" OnClick="btnEditGrant_Click" />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </div>
</asp:Content>

