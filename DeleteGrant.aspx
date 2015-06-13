<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteGrant.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h1>Delete Grant</h1>
        <hr />
        <h4>Are you sure you want to delete this Grant?</h4>
        <asp:Button ID="btnDeleteGrant" runat="server" Text="Yes" CssClass="btn btn-danger" OnClick="btnDeleteGrant_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancelDeleteGrant" runat="server" Text="No" CssClass="btn btn-info" OnClick="btnCancelDeleteGrant_Click" />
    </div>
</asp:Content>

