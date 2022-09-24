using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class employee_change_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void change_Click(object sender, EventArgs e)
        {
            var form_current_password = current_password.Text;
            var form_new_password = new_password.Text;
            var form_confirm_new_password = confirm_new_password.Text;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand command = new SqlCommand("select password from login where email='" + Session["email"] + "'", connection);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                var password = Convert.ToString(reader["password"]);
                reader.Close();
                if (password == form_current_password)
                {
                    if (form_confirm_new_password == form_new_password)
                    {
                        SqlCommand c = new SqlCommand("update login set password='" + form_new_password + "' where email='" + Session["email"] + "'", connection);
                        c.ExecuteNonQuery();
                        message.Text = "Password Updated successfully!";
                    }
                    else
                    {
                        message.Text = "New passwords didnt match!";
                    }
                }
                else
                {
                    message.Text = "Current password didnt match!";
                }
            }
        }
    }
}