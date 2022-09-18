using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void login_Click(object sender, EventArgs e)
        {
            var form_email = email.Text;
            var form_password = password.Text;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand command = new SqlCommand("select email,password,profile_type,full_name,profile from login", connection);
            SqlDataReader reader = command.ExecuteReader();
            int flag = 0;
            string st = "";
            while (reader.Read())
            {
                var email = Convert.ToString(reader["email"]);
                if (email == form_email)
                {
                    flag = 1;
                    var password = Convert.ToString(reader["password"]);
                    if (password == form_password)
                    {
                        Session["email"] = form_email;
                        Session["full_name"] = reader["full_name"];
                        Session["profile"] = reader["profile"];
                        if (Convert.ToString(reader["profile_type"]) == "admin")
                            Response.Redirect("admin_dashboard");
                        else
                            Response.Redirect("employee_dashboard");
                    }
                    else
                        st = "Password incorrect!";
                }
            }
            if (flag == 0)
            {
                st = "Id not registered!";
                message.Text = st;
            }
            else
            {
                message.Text = st;
            }
            reader.Close();
            connection.Close();
        }
    }
}