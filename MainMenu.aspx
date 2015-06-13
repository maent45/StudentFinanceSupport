<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MainMenu.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="container menuPage">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <%-- student list div --%>
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 mainMenuLinks">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mainMenuStudentList">
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/ViewStudents.aspx">
                        <h2>VIEW STUDENT LIST</h2>
                        <hr />
                        <span class="glyphicon glyphicon-user"></span>
                    </asp:HyperLink>
                </div>
            </div>
            <%-- search student div --%>
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 mainMenuLinks">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mainMenuSearch">
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/SearchStudent.aspx">
                        <h2>SEARCH<br /> STUDENT</h2>
                        <hr />
                        <span class="glyphicon glyphicon-search"></span>
                    </asp:HyperLink>
                </div>
            </div>
            <%-- add student div --%>
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 mainMenuLinks">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mainMenuAdd">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddStudent.aspx">
                        <h2>ADD <br />STUDENT</h2>
                        <hr />
                        <span class="glyphicon glyphicon-plus"></span>
                    </asp:HyperLink>
                </div>
            </div>
            <%-- view report div --%>
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 mainMenuLinks">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mainMenuGenerate">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ViewReport.aspx">
                        <h2>VIEW <br />REPORTS</h2>
                        <hr />
                        <span class="glyphicon glyphicon-pencil"></span>
                    </asp:HyperLink>
                </div>
            </div>

            <br /><br /><br />
            <%-- student profile div --%>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 mainMenuLinks" style="margin-top: 30px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mainMenuStudentProfile">
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/StudentProfile.aspx">
                        <h2>STUDENT <br />PROFILE</h2>
                        <hr />
                        <span class="glyphicon glyphicon-book"></span>
                    </asp:HyperLink>
                </div>
            </div>
            <%-- admin page div --%>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 mainMenuLinks" style="margin-top: 30px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mainMenuStudentProfile">
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/AdminPage.aspx">
                        <h2>ADMIN <br />SETTINGS</h2>
                        <hr />
                        <span class="glyphicon glyphicon-wrench"></span>
                    </asp:HyperLink>
                </div>
            </div>
            <%-- about system div --%>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 mainMenuLinks" style="margin-top: 30px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mainMenuStudentProfile">
                    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/About.aspx">
                        <h2>ABOUT <br />SYSTEM</h2>
                        <hr />
                        <span class="glyphicon glyphicon-info-sign"></span>
                    </asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
    <%-- animation jquery scripts --%>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".mainMenuLinks").hover(function () {
                $(this).animate({ "top": "-=12px"}, 200);
            }, function () {
                $(this).stop().animate({ "top": "+=12px"}, 200);
            });
        });
    </script>

</asp:Content>

