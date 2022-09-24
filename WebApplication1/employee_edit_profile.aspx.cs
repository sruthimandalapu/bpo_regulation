using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class employee_edit_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
                connection.Open();
                SqlCommand c = new SqlCommand("select * from login where email='" + Session["email"] + "'", connection);
                SqlDataReader r = c.ExecuteReader();
                if (r.Read())
                {
                    first_name.Text = Convert.ToString(r["first_name"]);
                    last_name.Text = Convert.ToString(r["last_name"]);
                    email.Text = Convert.ToString(r["email"]);
                    date_of_birth.Text = Convert.ToString(r["date_of_birth"]);
                    contact_number.Text = Convert.ToString(r["contact_number"]);
                    gender.Text = Convert.ToString(r["gender"]);
                    state.Text = Convert.ToString(r["state"]);
                    city.Text = Convert.ToString(r["city"]);
                    street.Text = Convert.ToString(r["street"]);
                    pincode.Text = Convert.ToString(r["pincode"]);
                }
                email.Enabled = false;
                r.Close();
                connection.Close();
            }
        }
        protected void edit_Click(object sender, EventArgs e)
        {
            var form_first_name = first_name.Text;
            var form_last_name = last_name.Text;
            var form_full_name = form_first_name + " " + form_last_name;
            var form_date_of_birth = date_of_birth.Text;
            var first = Convert.ToString(form_first_name[0]).ToUpper();
            var second = Convert.ToString(form_last_name[0]).ToUpper();
            second.ToUpper();
            var form_profile = first + second;
            var form_contact_number = contact_number.Text;
            var form_gender = gender.Text;
            var form_state = state.Text;
            var form_city = city.Text;
            var form_street = street.Text;
            var form_pincode = pincode.Text;

            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand c = new SqlCommand("update login set first_name='" + form_first_name + "', last_name='" + form_last_name + "', full_name='" +
                form_full_name + "', date_of_birth='" +
                form_date_of_birth + "', gender='" +
                form_gender + "', state='" +
                form_state + "', city='" +
                form_city + "', street='" +
                form_street + "', pincode='" +
                form_pincode + "', profile='" +
                form_profile + "' where email='" + Session["email"] + "'"
                , connection);
            c.ExecuteNonQuery();
            message.Text = "Updated Successfully!";
            Session["full_name"] = form_full_name;
            Session["profile"] = form_profile;
            connection.Close();
        }
    }
}