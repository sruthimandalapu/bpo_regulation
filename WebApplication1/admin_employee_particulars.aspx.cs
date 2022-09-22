using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_emp_particulars : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["direct_all"] == "true")
            {
                emp_details.Visible = true;
                view_details.Visible = false;
                Session["direct_all"] = "";
                SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from login where profile_type='employee'", connection);
                SqlDataReader reader = cmd.ExecuteReader();
                ListView1.DataSource = reader;
                ListView1.DataBind();
                all_employees.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            }
            else if (!IsPostBack)
            {
                emp_details.Visible = true;
                view_details.Visible = false;
                SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from employee where registered_date>=DATEADD(day,-7, GETDATE())", connection);
                SqlDataReader reader = cmd.ExecuteReader();
                ListView1.DataSource = reader;
                ListView1.DataBind();
                new_employees.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            }
        }
        protected void new_emp_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from employee where registered_date>=DATEADD(day,-7, GETDATE())", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
            new_employees.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            all_employees.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        }
        protected void all_emp_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from employee", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
            all_employees.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            new_employees.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        }
        protected void assign_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_assign_task");
        }
        protected void view_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Guid id = new Guid(btn.CommandArgument);
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand c = new SqlCommand("select email from employee where id='" + id + "'", connection);
            SqlDataReader r=c.ExecuteReader();
            if (r.Read())
            {
                Session["details"] = r["email"].ToString();
            }
            r.Close();
            emp_details.Visible = false;
            view_details.Visible = true;
            personal_details.Visible = true;
            professional_details.Visible = false;
            id_personal_details.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            id_professional_details.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            SqlCommand cmd = new SqlCommand("select * from login where email='" + Session["details"].ToString() + "'", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                first_name.Text = reader["first_name"].ToString();
                last_name.Text = reader["last_name"].ToString();
                email1.Text = reader["email"].ToString();
                date_of_birth.Text = reader["date_of_birth"].ToString();
                contact_number1.Text = reader["contact_number"].ToString();
                gender.Text = reader["gender"].ToString();
                state.Text = reader["state"].ToString();
                city.Text = reader["city"].ToString();
                street.Text = reader["street"].ToString();
                pincode.Text = reader["pincode"].ToString();
            }
        }
        protected void professional_details_Click(object sender, EventArgs e)
        {
            emp_details.Visible = false;
            view_details.Visible = true;
            personal_details.Visible = false;
            professional_details.Visible = true;
            id_professional_details.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            id_personal_details.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from employee where email='" + Session["details"] + "'", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                full_name.Text = reader["full_name"].ToString();
                email.Text = reader["email"].ToString();
                contact_number.Text = reader["contact_number"].ToString();
                qualification.Text = reader["qualification"].ToString();
                passed_out_year.Text = reader["year_passed_out"].ToString();
                skill_sets.Text = reader["skill_sets"].ToString();
                working_company.Text = reader["working_company"].ToString();
                working_domain.Text = reader["working_domain"].ToString();
                working_city.Text = reader["working_city"].ToString();
                experience.Text = reader["experience"].ToString();
            }
        }
        protected void personal_details_Click(object sender, EventArgs e)
        {
            emp_details.Visible = false;
            view_details.Visible = true;
            personal_details.Visible = true;
            professional_details.Visible = false;
            id_personal_details.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            id_professional_details.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from login where email='" + Session["details"].ToString() + "'", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                first_name.Text = reader["first_name"].ToString();
                last_name.Text = reader["last_name"].ToString();
                email1.Text = reader["email"].ToString();
                date_of_birth.Text = reader["date_of_birth"].ToString();
                contact_number1.Text = reader["contact_number"].ToString();
                gender.Text = reader["gender"].ToString();
                state.Text = reader["state"].ToString();
                city.Text = reader["city"].ToString();
                street.Text = reader["street"].ToString();
                pincode.Text = reader["pincode"].ToString();
            }
        }
        protected void delete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Guid id = new Guid(btn.CommandArgument);
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("delete from login where id='"+id+"'", connection);
            cmd.ExecuteNonQuery();
            Session["direct_all"] = "true";
            Response.Redirect("admin_employee_particulars");
        }
        protected void submit_Click(object sender, EventArgs e)
        {
            
        }
    }
}