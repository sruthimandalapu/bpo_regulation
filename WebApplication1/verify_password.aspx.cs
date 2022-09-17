using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class verify_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void verify_Click(object sender, EventArgs e)
        {
            var form_email = Request.QueryString["email"].ToString();
            var form_otp = otp.Text;
            var form_password = password.Text;
            var form_confirm_password = confirm_password.Text;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand command = new SqlCommand("select otp from login where email='"+form_email+"'", connection);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                var otp=Convert.ToString(reader["otp"]);
                reader.Close();
                if(otp!=form_otp)
                    message.Text = "Incorrect OTP!";
                else
                {
                    if (form_password != form_confirm_password)
                    {
                        message.Text = "Passwords didn't match!";
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("update login set password='"+form_password+"' where email='" + form_email + "'", connection);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("login");
                    }
                }
            }
            connection.Close(); 
        }
    }
}