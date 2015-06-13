<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConfirmUpdate.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h1>Confirm Record Updating</h1>
        <hr />
        <h4>Are you sure you would like to update this record?</h4>
        <br />
        <asp:Button ID="btnYesUpdate" runat="server" Text="Yes" CssClass="btn btn-danger" OnClick="btnYesUpdate_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnNoUpdate" runat="server" Text="No" CssClass="btn btn-info" OnClick="btnNoUpdate_Click" />
    </div>
</asp:Content>

