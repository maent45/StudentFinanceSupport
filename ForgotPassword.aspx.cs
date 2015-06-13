using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web.Security;

public partial class ForgotPassword : System.Web.UI.Page
{
    StudentFinancialServicesDataClassesDataContext db = new StudentFinancialServicesDataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRecoverPassword_Click(object sender, EventArgs e)
    {
        LoginDetail LoginDetailTable = new LoginDetail();

        var checkUsername = (from t in db.LoginDetails
                             where t.Login_Id == txtRetrievePassUsername.Text
                             select t).SingleOrDefault();

        //get password from LoginDetails table in db that matches the username
        //var getPassword = from m in db.LoginDetails
        //                  where m.Login_Id == txtRetrievePassUsername.Text && m.Login_Id == m.Login_Password
        //                  select m;

        //get password from LoginDetails table in db that matches the username
        /*
        var getPassword = from m in db.LoginDetails
                          where m.Login_Id == txtRetrievePassUsername.Text && m.Login_Id == m.Login_Password
                          select m;*/

        //make sure username exists first before recovering password
        if (checkUsername != null)
        {
            //todo password unhasing needs to go here
            //string hashPass = FormsAuthentication.HashPasswordForStoringInConfigFile("Your password is " + checkUsername.Login_Password, "SHA1");


            String recoveryPassMessage = "Your Recovery Password is : " + checkUsername.Login_Password.ToString();

            //various snippets of this code was taken from Luke Hardiman
            using (MailMessage recoverPassMsg = new MailMessage("no-reply@lukes-server.com", txtBoxEmailAdd.Text))
            {
                //Header = {"Message-Id",.Format("<{0}@{1}>",Guid.NewGuid().ToString(),"@lukes-server.com"))
                //various snippets of this code was taken from Luke Hardiman
                recoverPassMsg.Headers.Add("Message-Id", String.Format("<{0}@{1}>", Guid.NewGuid().ToString(),"luke-server.com"));

                recoverPassMsg.Subject = "Password Recovery";
                recoverPassMsg.Body = recoveryPassMessage;

                recoverPassMsg.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");

                recoverPassMsg.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "mail.lukes-server.com";
                smtp.EnableSsl = false;
                NetworkCredential NetworkCred = new NetworkCredential("no-reply.lukes-server", "a1O3k07N21");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(recoverPassMsg);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Your recovered password has been successfully sent to your email.');", true);
            }
        }
        else
        {
            Response.Write("<script>alert('Your username must first exist before recovering your password.')</script>");
        }
    }
}