using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class register1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void register_Click(object sender, EventArgs e)
        {
            var form_date_of_birth = date_of_birth.Text;
            var form_gender = gender.Text;
            var form_residential_city=residential_city.Text;   
            var form_qualification=qualification.Text;
            var form_year_passed_out = year_passed_out.Text;
            var form_skill_sets=skill_sets.Text;
            var form_working_company=working_company.Text;
            var form_working_domain=working_domain.Text;
            var form_working_city = working_city.Text;
            var form_years_of_experience=Years_of_experience.Text;
            Random rnd = new Random();
            int otp = rnd.Next(10000, 99999);
            var form_email = Request.QueryString["email"].ToString();
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand command = new SqlCommand("update login set date_of_birth='"+form_date_of_birth+"', "+
                "gender='"+form_gender+"', "+
                "city='"+form_residential_city+"', "+
                "otp='" + otp + "' " +
                "where email='" +form_email+"'"
                , connection);
            command.ExecuteNonQuery();
            SqlCommand cmd = new SqlCommand("update employee set qualification='" +form_qualification+ "', " +
                "year_passed_out='" + form_year_passed_out + "', " +
                "skill_sets='" + form_skill_sets + "', " +
                "working_company='" + form_working_company + "', " +
                "working_domain='" + form_working_domain + "', " +
                "experience='" + form_years_of_experience + "', " +
                "working_city='" + form_working_city + "' where email='" + form_email + "'"
                , connection);
            cmd.ExecuteNonQuery();
            var smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential("lhostadlogin127@gmail.com", "grgrqcijdjnmtelc"),
                EnableSsl = true,
            };
            //smtpClient.Send("email", "recipient", "subject", "body");
            var mailMessage = new MailMessage
            {
                From = new MailAddress("lhostadlogin127@gmail.com"),
                Subject = "Registration Verification",
                Body = "OTP : " + otp,
                IsBodyHtml = true,
            };
            mailMessage.To.Add(form_email);
            smtpClient.Send(mailMessage);
            connection.Close();
            Response.Redirect("verify_password?email="+form_email);
        }
    }
}