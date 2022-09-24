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
            var form_contact_number = contact_number.Text;
            var form_full_name = form_first_name + " " + form_last_name;
            var first = Convert.ToString(form_first_name[0]).ToUpper();
            var second = Convert.ToString(form_last_name[0]).ToUpper();
            second.ToUpper();
            var form_profile = first + second;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            var form_id =Guid.NewGuid();
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
                
                SqlCommand cmd = new SqlCommand("insert into login(id,first_name,last_name,full_name,email,contact_number,profile,registered_date,profile_type) values('"+
                    form_id + "','" +
                    form_first_name + "','" +
                    form_last_name + "','" +
                    form_full_name +"','"+
                    form_email + "','" +
                    form_contact_number + "','" +
                    form_profile + "','" +
                    form_registered_date + "','"+
                    "employee"+"')"
                    , connection);
                cmd.ExecuteNonQuery();
                var form_id1 = Guid.NewGuid();
                SqlCommand c = new SqlCommand("insert into employee(id,full_name,email,contact_number,registered_date) values('" +
                    form_id1 + "','" +
                    form_full_name + "','" +
                    form_email + "','" +
                    form_contact_number + "','" +
                    form_registered_date + "'" +
                     ")"
                    , connection);
                c.ExecuteNonQuery();
                /*
                Random rnd = new Random();
                int otp= rnd.Next(10000,99999);
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
                smtpClient.Send(mailMessage); */
                connection.Close(); 
                Response.Redirect("register1?email=" + form_email); ;
            }
        }
    }
}