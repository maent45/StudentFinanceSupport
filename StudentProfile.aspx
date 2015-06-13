<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h1>Student Profile</h1>
        <hr />
        <h4>To view the individual profile of each student click on view Full Profile</h4>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-hover table-bordered" DataKeyNames="Student_Id" DataSourceID="StudentProfileSqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Student_Id" HeaderText="Student_Id" ReadOnly="True" SortExpression="Student_Id" />
                <asp:BoundField DataField="Student_FirstName" HeaderText="Student_FirstName" SortExpression="Student_FirstName" />
                <asp:BoundField DataField="Student_LastName" HeaderText="Student_LastName" SortExpression="Student_LastName" />
                <%-- view individual profile link --%>
                <asp:HyperLinkField DataNavigateUrlFields="Student_Id" DataNavigateUrlFormatString="IndividualProfile.aspx?Student_Id={0}" Text="View Profile" />
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
        <asp:SqlDataSource ID="StudentProfileSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>" SelectCommand="SELECT [Student_Id], [Student_FirstName], [Student_LastName] FROM [StudentRegistration]"></asp:SqlDataSource>
    </div>
</asp:Content>

