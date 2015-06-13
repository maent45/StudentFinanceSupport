<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConfirmGrantUpdate.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Confirm Grant Update</h1>
    <hr />
    <h4>Are you sure you would like to update this grant?</h4>
    <br />
    <asp:Button ID="btnYesUpdate" runat="server" Text="Yes" CssClass="btn btn-danger" OnClick="btnYesUpdate_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnNoUpdate" runat="server" Text="No" CssClass="btn btn-success" OnClick="btnNoUpdate_Click" />
</asp:Content>

