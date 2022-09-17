using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void register_Click(object sender, EventArgs e)
        {
            var form_first_name = first_name.Text;
            var form_last_name = last_name.Text;
            var form_email = email.Text;
            var form_registered_date= Convert.ToString(DateTime.Now.ToString("yyyy-MM-dd"));
            var form_full_name = form_first_name + " " + form_last_name;
            var form_profile= form_first_name[0]+ form_last_name[0];
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand command = new SqlCommand("select email from login", connection);
            SqlDataReader reader = command.ExecuteReader();
            string st = "";
            int flag = 0;
            while (reader.Read())
            {
                var email = Convert.ToString(reader["email"]);
                if (form_email == email)
                {
                    st = "Id registered!";
                    flag = 1;
                    break;
                }
            }
            reader.Close();
            if (flag == 1)
            {
                message.Text = st;
            }
            else
            {
                Random rnd = new Random();
                int otp= rnd.Next(10000,99999);
                SqlCommand cmd = new SqlCommand("insert into login(full_name,email,profile,registered_date,otp,profile_type) values('"+
                    form_full_name+"','"+
                    form_email + "','" +
                    form_profile + "','" +
                    form_registered_date + "','"+
                    otp+"','" +
                    "employee"+"')"
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
                    Body = "OTP : "+otp,
                    IsBodyHtml = true,
                };
                mailMessage.To.Add(form_email);
                smtpClient.Send(mailMessage);
                connection.Close();
                Response.Redirect("verify_password?email=" + form_email); ;
            }
        }
    }
}