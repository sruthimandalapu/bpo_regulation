using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace WebApplication1
{
    public partial class reset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void reset_Click(object sender, EventArgs e)
        {
            var form_email = email.Text;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand command = new SqlCommand("select email from login", connection);
            SqlDataReader reader = command.ExecuteReader();
            int flag = 0;
            while (reader.Read())
            {
                var email = Convert.ToString(reader["email"]);
                if (email == form_email)
                    flag = 1;
            }
            reader.Close();
            if (flag == 0)
            {
                message.Text = "Id not registered!";
            }
            else
            {
                Random rnd = new Random();
                int otp = rnd.Next(10000, 99999);
                SqlCommand cmd = new SqlCommand("update login set otp='"+otp+"' where email='"+form_email+"'", connection);
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
                    Subject = "Reset Verification",
                    Body = "OTP : " + otp,
                    IsBodyHtml = true,
                };
                mailMessage.To.Add(form_email);
                smtpClient.Send(mailMessage);
                Response.Redirect("verify_password?email=" + form_email);
            }
            connection.Close();
        }
    }
}