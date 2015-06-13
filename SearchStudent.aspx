<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchStudent.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <h1>Search Students</h1>
        <hr />
            <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

        <%--<asp:RadioButtonList ID="radioSearchChoice" runat="server" >
            <asp:ListItem Value="Name" Text="Name"></asp:ListItem>
            <asp:ListItem Value="ID" Text="ID"></asp:ListItem>
        </asp:RadioButtonList>

        <p>Name:</p>
        <asp:TextBox ID="txtBoxSearchName" runat="server"></asp:TextBox>--%>
        <h4>Search students either by Name or ID. The results displayed show the list of students registered within the system. If you can't find the 
            student you are looking for, try adding them by clicking 'Add Student'.
        </h4>
        <br />
        <%-- search textbox --%>
        <p>Name or ID:</p>
        <asp:TextBox ID="txtBoxSearchID" CssClass="form-control" runat="server"></asp:TextBox>
        <br />
        <br />
        <%-- ajax scriptmanager and autocomplete extender --%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" CompletionListCssClass="ajaxAutoCompleteStyle" CompletionListHighlightedItemCssClass="" MinimumPrefixLength="1" FirstRowSelected="false" ServiceMethod="SearchStudentsAutoComplete" CompletionSetCount="10" CompletionInterval="100" TargetControlID="txtBoxSearchID" runat="server">

        </cc1:AutoCompleteExtender>

        <div class="col-lg-3">
            <div>
                <%-- this button will search db based on user input --%>
                <asp:Button ID="btnSearchStudent" runat="server" Text="Search" CssClass="btn btn-info pull-left" OnClick="btnSearchStudent_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <%-- redirects user to add student page --%>
                <asp:Button ID="btnRedirectAddStudent" runat="server" Text="Add Student" CssClass="btn btn-info " OnClick="btnRedirectAddStudent_Click" />
                <br />
                <br />
            </div>
        </div>
        <%-- seach results gridview --%>
        <asp:GridView ID="gridViewSearchResults" runat="server" AutoGenerateColumns="False" DataKeyNames="Student_Id" DataSourceID="SearchStudentSqlDataSource1" CellPadding="4" CssClass="table table-hover table-striped" ForeColor="#333333" GridLines="None" databou >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Student_Id" HeaderText="Student ID" ReadOnly="True" SortExpression="Student_Id" />
                <asp:BoundField DataField="Student_FirstName" HeaderText="First Name" SortExpression="Student_FirstName" />
                <asp:BoundField DataField="Student_LastName" HeaderText="Last Name" SortExpression="Student_LastName" />
                <asp:BoundField DataField="Student_Gender" HeaderText="Gender" SortExpression="Student_Gender" />
                <asp:BoundField DataField="Student_DateOfBirth" HeaderText="Date Of Birth" SortExpression="Student_DateOfBirth" dataformatstring="{0:dd MMMM yyyy}" />
                <asp:BoundField DataField="Student_Faculty" HeaderText="Faculty" SortExpression="Student_Faculty" />
                <asp:BoundField DataField="Student_Campus" HeaderText="Campus" SortExpression="Student_Campus" />
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

        <%--(([Fname] like @Fname)  OR ([Student_ID] = @Student_ID))--%>
        <asp:SqlDataSource ID="SearchStudentSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>" SelectCommand="SELECT * FROM [StudentRegistration] WHERE (([Student_Id] LIKE '%' + @Student_Id + '%') OR ([Student_FirstName] LIKE '%' + @Student_FirstName + '%'))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtBoxSearchID" Name="Student_Id" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtBoxSearchID" Name="Student_FirstName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <%-- use this datasource if no name or id specified in search textbox --%>
        <asp:SqlDataSource ID="SearchStudentAllSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>" SelectCommand="SELECT [Student_Id], [Student_FirstName], [Student_Gender], [Student_DateOfBirth], [Student_Campus], [Student_Faculty], [Student_LastName] FROM [StudentRegistration]"></asp:SqlDataSource>
    </div>
</asp:Content>

