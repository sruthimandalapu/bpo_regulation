using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_issues_raised1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            issues.Visible = true;
            reply.Visible = false;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from issues", connection);
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
            SqlCommand cmd = new SqlCommand("select emp_mail from issues where id='" + id + "'", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                emp_email_id.Text = Convert.ToString(reader["emp_mail"]);
            }
            Session["reply_id"] = id;
        }
        protected void reply1_Click(object sender, EventArgs e)
        {
            issues.Visible = false;
            reply.Visible = true;
            var id = Session["reply_id"];
            var form_comments = comments.InnerText;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("update issues set status='Resolved' , reply='" + form_comments + "', replied_by='" + Session["full_name"] + "', replied_by_email='" + Session["email"] + "' where id='" + id + "'", connection);
            cmd.ExecuteNonQuery();
            connection.Close();
            message.Text = "Reply is sent!";
        }
    }
}