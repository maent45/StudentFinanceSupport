<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewStudents.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h1>Student List</h1>
        <hr />
        <h4>The following list contains all students who are currently registered within the system.</h4>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ViewStudentsLinqDataSource1" CellPadding="10" ForeColor="#333333" GridLines="None" Width="1103px" CellSpacing="5" CssClass="table table-hover table-striped">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <%-- Edit/Delete column options --%>
                <asp:HyperLinkField DataNavigateUrlFields="Student_Id" DataNavigateUrlFormatString="EditStudent.aspx?Student_Id={0}" Text="Edit" />
                <asp:HyperLinkField DataNavigateUrlFields="Student_Id" DataNavigateUrlFormatString="DeleteStudent.aspx?Student_Id={0}" Text="Delete" />

                <asp:BoundField DataField="Student_Id" HeaderText="ID" ReadOnly="True" SortExpression="Student_Id" />
                <asp:BoundField DataField="Student_FirstName" HeaderText="First name" SortExpression="Student_FirstName" ReadOnly="True" />
                <asp:BoundField DataField="Student_LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="Student_LastName" />
                <asp:BoundField DataField="Student_Gender" HeaderText="Gender" SortExpression="Student_Gender" ReadOnly="True" />
                <asp:BoundField DataField="Student_DateOfBirth" HeaderText="Date of Birth" SortExpression="Student_DateOfBirth" ReadOnly="True" dataformatstring="{0:dd MMMM yyyy}" />
                <asp:BoundField DataField="Student_Faculty" HeaderText="Faculty" SortExpression="Student_Faculty" ReadOnly="True" />
                <asp:BoundField DataField="Student_Campus" HeaderText="Campus" SortExpression="Student_Campus" ReadOnly="True" />

                <asp:HyperLinkField DataNavigateUrlFields="Student_Id" DataNavigateUrlFormatString="AddGrant.aspx?Student_Id={0}" Text="Add Grant" />

                <asp:HyperLinkField DataNavigateUrlFields="Student_Id" DataNavigateUrlFormatString="ViewGrant.aspx?Student_Id={0}" Text="View Grant" />

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
        <asp:LinqDataSource ID="ViewStudentsLinqDataSource1" runat="server" ContextTypeName="StudentFinancialServicesDataClassesDataContext" EntityTypeName="" TableName="StudentRegistrations" Select="new (Student_Id, Student_FirstName, Student_Gender, Student_DateOfBirth, Student_Faculty, Student_Campus, Student_LastName)">
        </asp:LinqDataSource>

        <%-- redirect back to Search Page --%>
        <asp:Button ID="btnRedirectSearchStudent" runat="server" Text="Search Students" CssClass="btn btn-info" OnClick="btnRedirectSearchStudent_Click" />
        
    </div>
</asp:Content>

