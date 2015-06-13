<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <h1>Admin Settings</h1>
        <hr />
        <h4>As an Admin you have the options to change your current password, add new administrators, edit course or faculty types, and edit grant types.</h4>
        <br />

        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mainDiv">
            <%-- change current password div --%>
            <div class="col-lg-6 col-md-6 col-sm-6 col-lg-12">
                <h3>Change your current password</h3>
                <hr />
                <asp:Label ID="lblChangePasswordError" runat="server" ForeColor="Red" Text=""></asp:Label>
                <p>Current Password:</p>
                <asp:TextBox ID="txtBoxCurrentPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validCurrentPassword" ValidationGroup="changePasswordValid" runat="server" ForeColor="Red" ErrorMessage="Enter your current password" ControlToValidate="txtBoxCurrentPassword"></asp:RequiredFieldValidator>
                
                <p>New Password:</p>
                <asp:TextBox ID="txtBoxNewPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                <%-- ajax password strength tester
                     code from: http://www.ajaxcontroltoolkit.com/PasswordStrength/PasswordStrength.aspx --%>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="col-lg-12">
                    <cc1:PasswordStrength ID="PasswordStrength1" runat="server" TargetControlID="txtBoxNewPassword" PreferredPasswordLength="6" MinimumNumericCharacters="1" StrengthIndicatorType="Text" TextStrengthDescriptions="Weak;Medium;Strong;Unbreakable;Unbreakably Strong;" DisplayPosition="BelowLeft" StrengthStyles="weakPass;mediumPass;strongPass;unbreakablePass;unbreakablePass;" />
                </div>
                <asp:RequiredFieldValidator ID="validNewPassword" ValidationGroup="changePasswordValid" ForeColor="Red" runat="server" ErrorMessage="Enter your new password." ControlToValidate="txtBoxNewPassword"></asp:RequiredFieldValidator>
                <br /><br />
                <p>Confirm Password:</p>
                <asp:TextBox ID="txtBoxConfPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validConfNewPassword" ValidationGroup="changePasswordValid" runat="server" ErrorMessage="Confirm your new password." ForeColor="Red" ControlToValidate="txtBoxConfPassword"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="compareValidNewConfPassword" ValidationGroup="changePasswordValid" runat="server" ForeColor="Red" ErrorMessage="New passwords must match." ControlToValidate="txtBoxConfPassword" ControlToCompare="txtBoxNewPassword"></asp:CompareValidator>

                <br />
                <asp:Button ID="btnChangePassword" runat="server" ValidationGroup="changePasswordValid" CausesValidation="true" CssClass="btn btn-info pull-right" Text="Change Password" OnClick="btnChangePassword_Click" />
            </div>

            <%-- add new admin div --%>
            <div class="col-lg-6 col-md-6 col-sm-12 col-lg-12">
                <h3>Add New Admin</h3>
                <hr />
                <asp:Label ID="lblErrorAddNewAdmin" ForeColor="Red" runat="server" Text=""></asp:Label>
                <p>Username:</p>
                <asp:TextBox ID="txtBoxNewAdminUsername" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validNewAdminUsername" ValidationGroup="addNewAdminValid" runat="server" ErrorMessage="Username required." ForeColor="#CC0000" ControlToValidate="txtBoxNewAdminUsername"></asp:RequiredFieldValidator>
                <p>Password:</p>
                <asp:TextBox ID="txtBoxNewAdminPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                <%-- ajax password strength tester
                     code from: http://www.ajaxcontroltoolkit.com/PasswordStrength/PasswordStrength.aspx --%>
                <div class="col-lg-12">
                    <cc1:PasswordStrength ID="PasswordStrength2" runat="server" TargetControlID="txtBoxNewAdminPassword" PreferredPasswordLength="6" MinimumNumericCharacters="2" StrengthIndicatorType="Text" TextStrengthDescriptions="Weak;Medium;Strong;Unbreakable;Unbreakably Strong;" DisplayPosition="BelowLeft" MinimumUpperCaseCharacters="2" MinimumLowerCaseCharacters="2" StrengthStyles="weakPass;mediumPass;strongPass;unbreakablePass;unbreakablePass;" />
                </div>
                <asp:RequiredFieldValidator ID="validNewAdminPassword" ValidationGroup="addNewAdminValid" runat="server" ErrorMessage="Password required." ForeColor="#CC0000" ControlToValidate="txtBoxNewAdminPassword"></asp:RequiredFieldValidator>
                <br />
                <br />
                
                <p>Confirm Password:</p>
                <asp:TextBox ID="txtBoxConfNewAdminPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validConfNewAdminPassword" ValidationGroup="addNewAdminValid" runat="server" ForeColor="Red" ErrorMessage="Confirm the new password." ControlToValidate="txtBoxConfNewAdminPassword"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="addNewAdminValid" ErrorMessage="Passwords must match." ForeColor="#CC0000" ControlToValidate="txtBoxConfNewAdminPassword" ControlToCompare="txtBoxNewAdminPassword"></asp:CompareValidator>
                <br /><br />
                <asp:Button ID="btnAddNewAdmin" runat="server" ValidationGroup="addNewAdminValid" CssClass="btn btn-info pull-right" Text="Add" OnClick="btnAddNewAdmin_Click" />
            </div>
        </div>

        <div class="col-lg-12 col-md-12 col-sm-12 col-lg-12 divThree">
            <h3>Update Grant Types</h3>
            <p>Below is a list of all current grant types. You can add or update existing names.</p>
            <hr />
            <asp:GridView ID="gridViewGrantTypes" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="GrantTypesSqlDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="Grant_Id">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    <%--<asp:BoundField DataField="Grant_Id" HeaderText="Grant_Id" SortExpression="Grant_Id" InsertVisible="False" ReadOnly="True" />--%>
                    <asp:BoundField DataField="Grant_Name" HeaderText="Grant_Name" SortExpression="Grant_Name" ControlStyle-CssClass="form-control">
                        <ControlStyle CssClass="form-control"></ControlStyle>
                    </asp:BoundField>
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

            <asp:SqlDataSource ID="GrantTypesSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>" SelectCommand="SELECT * FROM [GrantTypes]" DeleteCommand="DELETE FROM [GrantTypes] WHERE [Grant_Id] = @Grant_Id" InsertCommand="INSERT INTO [GrantTypes] ([Grant_Name]) VALUES (@Grant_Name)" UpdateCommand="UPDATE [GrantTypes] SET [Grant_Name] = @Grant_Name WHERE [Grant_Id] = @Grant_Id">
                <DeleteParameters>
                    <asp:Parameter Name="Grant_Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Grant_Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Grant_Name" Type="String" />
                    <asp:Parameter Name="Grant_Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <%-- add new grant type div --%>
            <hr />
            <div class="col-lg-4">
                <p>Add new Grant Type:</p>
                <asp:TextBox ID="txtBoxAddNewGrantType" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validAddNewGrantType" ValidationGroup="addNewGrantType" runat="server" ErrorMessage="Grant Name required." ForeColor="Red" ControlToValidate="txtBoxAddNewGrantType"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="btnAddNewGrantType" CssClass="btn btn-info" ValidationGroup="addNewGrantType" runat="server" Text="Add Grant Type" OnClick="btnAddNewGrantType_Click" PostBackUrl="#divThree" />
                <br />
                <br />
            </div>
        </div>

        <div class="col-lg-12 col-md-12 col-sm-12 col-lg-12 divFour" id="divFour">
            <h3>Update Faculty Names</h3>
            <p>Below is a list of all current Faculty names. You can add or update existing names.</p>
            <hr />
            <%-- faculty names gridview --%>
            <asp:GridView ID="gridViewFaculties" runat="server" CssClass="table table-hover table-striped" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Faculty_Id" DataSourceID="FacultyNamesSqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    <%--<asp:BoundField DataField="Faculty_Id" HeaderText="Faculty_Id" InsertVisible="False" ReadOnly="True" SortExpression="Faculty_Id" />--%>
                    <asp:BoundField DataField="Faculty_Name" ControlStyle-CssClass="form-control" HeaderText="Faculty_Name" SortExpression="Faculty_Name">
                        <ControlStyle CssClass="form-control"></ControlStyle>
                    </asp:BoundField>
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

            <asp:SqlDataSource ID="FacultyNamesSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>" DeleteCommand="DELETE FROM [FacultyTypes] WHERE [Faculty_Id] = @Faculty_Id" InsertCommand="INSERT INTO [FacultyTypes] ([Faculty_Name]) VALUES (@Faculty_Name)" SelectCommand="SELECT * FROM [FacultyTypes]" UpdateCommand="UPDATE [FacultyTypes] SET [Faculty_Name] = @Faculty_Name WHERE [Faculty_Id] = @Faculty_Id">
                <DeleteParameters>
                    <asp:Parameter Name="Faculty_Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Faculty_Id" Type="Int32" />
                    <asp:Parameter Name="Faculty_Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Faculty_Name" Type="String" />
                    <asp:Parameter Name="Faculty_Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <%-- insert new faculty name div --%>
            <div class="col-lg-4">
                <p>Add new faculty name:</p>
                <asp:TextBox ID="txtBoxNewFacultyName" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validNewFacultyName" ValidationGroup="newFacultyName" runat="server" ForeColor="Red" ErrorMessage="Faculty name required." ControlToValidate="txtBoxNewFacultyName"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="btnAddNewFacultyName" runat="server" ValidationGroup="newFacultyName" CssClass="btn btn-info" Text="Add Faculty Name" OnClick="btnAddNewFacultyName_Click" PostBackUrl="#divFour" />
                <br />
                <br />
            </div>
        </div>

        <%-- update course names div --%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 divFive" id="divFive">
            <h3>Update Course Names</h3>
            <p>Below is a list of all current Course Names. You can add or update existing names.</p>
            <hr />
            <asp:GridView ID="gridViewCourses" runat="server" CssClass="table table-hover table-striped" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Course_Id" DataSourceID="CourseTypesSqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <%--<asp:BoundField DataField="Course_Id" HeaderText="Course_Id" InsertVisible="False" ReadOnly="True" SortExpression="Course_Id" />--%>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    <asp:BoundField DataField="Course_Name" ControlStyle-CssClass="form-control" HeaderText="Course_Name" SortExpression="Course_Name" >
<ControlStyle CssClass="form-control"></ControlStyle>
                    </asp:BoundField>
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
            <asp:SqlDataSource ID="CourseTypesSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentFinancialServicesConnectionString %>" DeleteCommand="DELETE FROM [CourseTypes] WHERE [Course_Id] = @Course_Id" InsertCommand="INSERT INTO [CourseTypes] ([Course_Name]) VALUES (@Course_Name)" SelectCommand="SELECT * FROM [CourseTypes]" UpdateCommand="UPDATE [CourseTypes] SET [Course_Name] = @Course_Name WHERE [Course_Id] = @Course_Id">
                <DeleteParameters>
                    <asp:Parameter Name="Course_Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Course_Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Course_Name" Type="String" />
                    <asp:Parameter Name="Course_Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <hr />
            <%-- insert new course names div --%>
            <div class="col-lg-4">
                <p>Add new course:</p>
                <asp:TextBox ID="txtBoxAddNewCourse" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="validAddNewCourse" ValidationGroup="addNewCourse" runat="server" ErrorMessage="Course name required." ForeColor="Red" ControlToValidate="txtBoxAddNewCourse"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="btnAddNewCourse" ValidationGroup="addNewCourse" CssClass="btn btn-info" runat="server" Text="Add Course" OnClick="btnAddNewCourse_Click" PostBackUrl="#divFive" />
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>

