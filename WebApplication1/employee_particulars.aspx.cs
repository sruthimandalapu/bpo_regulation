using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class employee_particulars : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from employee where email='" + Session["email"]+"'",connection);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    full_name.Text = reader["full_name"].ToString();
                    email.Text = reader["email"].ToString();
                    contact_number.Text = reader["contact_number"].ToString();
                    qualification.Text = reader["qualification"].ToString();
                    passed_out_year.Text = reader["year_passed_out"].ToString();
                    skill_sets.Text = reader["skill_sets"].ToString();
                    working_company.Text = reader["working_company"].ToString() ;
                    working_domain.Text = reader["working_domain"].ToString();
                    working_city.Text = reader["working_city"].ToString();
                    experience.Text = reader["experience"].ToString();
                }
                email.Enabled = false;
                full_name.Enabled = false;
                contact_number.Enabled = false;
                reader.Close();
                connection.Close();
            }
        }
        protected void edit_Click(object sender, EventArgs e)
        {
            var form_qualification = qualification.Text;
            var form_passed_out_year= passed_out_year.Text;
            var form_skill_sets = skill_sets.Text;
            var form_working_company= working_company.Text;
            var form_working_domain = working_domain.Text;
            var form_working_city= working_city.Text;
            var form_experience= experience.Text;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("update employee set qualification='" +form_qualification+"', "+
                "year_passed_out='"+form_passed_out_year+"', "+
                "skill_sets='"+form_skill_sets+"', "+
                "working_company='"+form_working_company+"', "+
                "working_domain='" + form_working_domain + "', " +
                "working_city='" +form_working_city+"', "+
                "experience='"+form_experience+"' "+
                "where email='" + Session["email"] + "'", connection);
            cmd.ExecuteNonQuery();
            message.Text = "Updated Successfully!";
        }
    }
}