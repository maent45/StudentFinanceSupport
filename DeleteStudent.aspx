<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteStudent.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h1>Delete Record</h1>
        <hr />
        <h4>Are you sure you want to delete this record?</h4>
        <asp:Button ID="btnDeleteStudent" runat="server" Text="Yes" CssClass="btn btn-danger" OnClick="btnDeleteStudent_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancelDeleteStudent" runat="server" Text="No" CssClass="btn btn-info" OnClick="btnCancelDeleteStudent_Click" />
    </div>
</asp:Content>

