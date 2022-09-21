using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_emp_particulars : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from login where profile_type='employee' and registered_date>=DATEADD(day,-7, GETDATE())", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
            new_employees.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
        }
        protected void new_emp_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from login where profile_type='employee' and registered_date>=DATEADD(day,-7, GETDATE())", connection);
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
            SqlCommand cmd = new SqlCommand("select * from login where profile_type='employee'", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
            all_employees.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            new_employees.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        }
        protected void edit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Guid id = new Guid(btn.CommandArgument);
            Response.Redirect("admin_emp_edit?id=" + id.ToString());
        }
        protected void delete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Guid id = new Guid(btn.CommandArgument);
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("delete from login where id='"+id+"'", connection);
            cmd.ExecuteNonQuery();
        }
    }
}