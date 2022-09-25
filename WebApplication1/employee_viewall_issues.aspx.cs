using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class employee_viewall_issues : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            issues.Visible = true;
            reply.Visible = false;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from issues where emp_mail='" + Session["email"]+"' order by issue_raised_on desc", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
        }
        protected void reply_Click(object sender, EventArgs e)
        {
            issues.Visible = false;
            reply.Visible = true;
            LinkButton btn = (LinkButton)sender;
            Guid id = new Guid(btn.CommandArgument);
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from issues where id='" + id + "'", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                full_name.Text = reader["replied_by"].ToString();
                email.Text = reader["replied_by_email"].ToString();
                issue_about.Text = reader["issue_about"].ToString();
                comments.InnerText = reader["reply"].ToString();
            }
        }
    }
}