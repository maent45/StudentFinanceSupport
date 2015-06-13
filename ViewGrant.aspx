<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewGrant.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h1>Student Grant</h1>
        <%-- students grant gridview --%>
        <asp:GridView ID="GridView1" EmptyDataText="This student has no current grants allocated." runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-hover table-striped" DataKeyNames="Ref_No" DataSourceID="ViewGrantSqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="Student_Id" DataNavigateUrlFormatString="AddGrant.aspx?Student_id={0}" Text="Add Grant" />
                <asp:HyperLinkField DataNavigateUrlFields="Ref_No" DataNavigateUrlFormatString="DeleteGrant.aspx?Ref_No={0}" Text="Delete Grant" />

                <asp:BoundField DataField="Student_Id" HeaderText="Student ID" SortExpression="Student_Id" />
                <asp:BoundField DataField="Ref_No" HeaderText="Reference #" InsertVisible="False" ReadOnly="True" SortExpression="Ref_No" />
                <asp:BoundField DataField="Grant_Type" HeaderText="Grant Type" SortExpression="Grant_Type" />
                <asp:BoundField DataField="Grant_Description" HeaderText="Grant Description" SortExpression="Grant_Description" />
                <asp:BoundField DataField="Grant_Value" HeaderText="Grant Value" SortExpression="Grant_Value" />
                <asp:BoundField DataField="Date_Of_Issue" HeaderText="Date Of Issue" SortExpression="Date_Of_Issue" dataformatstring="{0:dd MMMM yyyy}" />
                <asp:BoundField DataField="KohaFunds" HeaderText="Koha Funds" SortExpression="KohaFunds" />

                
                
                <%--<asp:HyperLinkField DataNavigateUrlFields="Ref_No" DataNavigateUrlFormatString="EditGrant.aspx?Ref_No={0}" Text="Edit Grant" />--%>

                
                
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

        <%-- add grant button --%>
        <%--<asp:Button ID="btnAddStudentGrant" runat="server" Text="Add Grant" CssClass="btn btn-info" OnClick="btnAddStudentGrant_Click1"  />--%>
        <%--<asp:HyperLink ID="HyperLink1" DataNavigateUrlFormatString="AddGrant.aspx?Student_Id={0}" runat="server" NavigateUrl="~/AddGrant.aspx">add</asp:HyperLink>--%>

        <asp:SqlDataSource ID="ViewGrantSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>" SelectCommand="SELECT * FROM [StudentVouchers] WHERE ([Student_Id] = @Student_Id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Student_Id" QueryStringField="Student_Id" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <hr />
    </div>
</asp:Content>

