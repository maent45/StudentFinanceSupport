<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <h1>About Student Financial Support</h1>
        <p>Browse through the different tabs to find out more on how this website works.</p>
        <hr />
        <%-- code from http://getbootstrap.com/javascript/#tabs --%>
        <div role="tabpanel">

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">Adding Students</a></li>
                <li role="presentation"><a href="#2" aria-controls="2" role="tab" data-toggle="tab">Adding Grants</a></li>
                <li role="presentation"><a href="#3" aria-controls="3" role="tab" data-toggle="tab">Editing Students</a></li>
                <li role="presentation"><a href="#4" aria-controls="4" role="tab" data-toggle="tab">Searching Students</a></li>
                <li role="presentation"><a href="#5" aria-controls="5" role="tab" data-toggle="tab">Viewing Reports & Summaries</a></li>
                <li role="presentation"><a href="#6" aria-controls="6" role="tab" data-toggle="tab">Recovering Passwords</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="1">
                    <hr />
                    <h3 style="margin-bottom: 250px;">To add new students into the system, first click on 'Add Student' from the main menu page, then fill out all the required fields before
                        submitting the students' details.
                    </h3>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="2">
                    <hr />
                    <h3 style="margin-bottom: 150px;">Before allocating a grant to a student, first click on 'View Student List' from the main menu page. You will then be provided with a
                        table that contains a list of all students currently registered within the system. From here you can then click on 'View Grants' where
                        you will be shown the grants of that specific student. At this point you then click on 'Add Grant' which will redirect you to the 
                        adding grants page.
                    </h3>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="3">
                    <hr />
                    <h3 style="margin-bottom: 230px;">To edit the details of a student first click on 'View Student List' from the main menu page, from here you are then presented with a 
                        table that contains a list of all currently registered students. On the left side of each students' name you can click on 'Edit'
                        to edit the details of that particular student.
                    </h3>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="4">
                    <hr />
                    <h3 style="margin-bottom: 150px;">To search for students first click on 'Search Student' from the main menu page, once clicked you are then redirected the search
                        students page where you can search by either the students' first name or ID. By typing the first letter of their name or the first
                        number or letter of their ID a list will automatically drop down and show suggestions of student's first names and ID's that
                        may be similar to your search input.
                    </h3>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="5">
                    <hr />
                    <h3 style="margin-bottom: 170px;">The system allows you to generate reports and summaries of grants that have been allocated to students. To do this first click on
                        'View Reports' from the main menu page. Once clicked you are then taken to the reports page where you are presented with options
                        to generate summary reports based on monthly, yearly, by campus, by faculty, by gender, and by ethnicity.
                    </h3>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="6">
                    <hr />
                    <h3 style="margin-bottom: 150px;">If you have forgotten your password you have the option to recover it. To do this click on 'Forgotten Password' link which is located
                        on the login page. Once clicked you are then redirected to the 'Retrieve Password' page. From here you then have to provide your 
                        username and email address. If the username you provide has not been registered within the system you are then prompted that your 
                        username first has to exist before trying to recover your password. If the username is valid an email containing your password 
                        will then be emailed to the email address that you have provided.
                    </h3>
                </div>
            </div>

        </div>
    </div>
    <%-- script for enabling tabs --%>
    <%-- code from http://getbootstrap.com/javascript/#tabs --%>
    <script type="text/javascript">
        $('#myTab a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        })
    </script>
</asp:Content>

