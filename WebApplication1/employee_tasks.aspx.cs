using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class employee_tasks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["emp_status"] == "open")
                    status_open_Click(sender, e);
                else if (Session["emp_status"] == "close")
                    status_close_Click(sender, e);
                else
                    view_all_Click(sender, e);
            }
            catch(Exception exp)
            {
                /*
                tasks.Visible = true;
                view_tasks.Visible = false;
                SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from tasks where task_assigned_to_email='" + Session["email"] + "'", connection);
                SqlDataReader reader = cmd.ExecuteReader();
                ListView1.DataSource = reader;
                ListView1.DataBind();
                view_all.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
                status_open.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                status_close.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
                */
                view_all_Click(sender, e);
            }
        }
        protected void view_all_Click(object sender, EventArgs e)
        {
            tasks.Visible = true;
            view_tasks.Visible = false;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from tasks where task_assigned_to_email='" + Session["email"] + "' ORDER BY task_assigned_date DESC", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
            view_all.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            status_open.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_close.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            Session["emp_status"] = "viewall";
        }
        protected void status_open_Click(object sender, EventArgs e)
        {
            tasks.Visible = true;
            view_tasks.Visible = false;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from tasks where task_status='Open' and task_assigned_to_email='" + Session["email"] + "' ORDER BY task_assigned_date DESC", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
            view_all.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_open.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            status_close.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            Session["emp_status"] = "open";
        }
        protected void status_close_Click(object sender, EventArgs e)
        {
            tasks.Visible = true;
            view_tasks.Visible = false;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from tasks where task_status='Closed' and task_assigned_to_email='" + Session["email"] + "' ORDER BY task_assigned_date DESC", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
            view_all.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_open.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_close.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            Session["emp_status"] = "close";
        }
        protected void view_Click(object sender, EventArgs e)
        {
            tasks.Visible = false;
            view_tasks.Visible = true;
            LinkButton btn = (LinkButton)sender;
            Guid id = new Guid(btn.CommandArgument);
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from tasks where id='" + id + "'", connection);
            SqlDataReader reader=cmd.ExecuteReader();
            if (reader.Read())
            {
                project_name.Text = reader["project_name"].ToString();
                priority.Text = reader["priority"].ToString();
                task_assigned_by.Text = reader["task_assigned_by_name"].ToString();
                task_issuer_mailid.Text = reader["task_assigned_by_email"].ToString();
                task_title.Text = reader["task_title"].ToString();
                task_status.Text = reader["task_status"].ToString();
                task_description.InnerText = reader["task_description"].ToString();
            }
            connection.Close();
        }
        protected void close_Click(object sender, EventArgs e)
        {
            tasks.Visible = true;
            view_tasks.Visible = false;
            LinkButton btn = (LinkButton)sender;
            Guid id = new Guid(btn.CommandArgument);
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("update tasks set task_status='Closed' where id='" + id + "'", connection);
            cmd.ExecuteNonQuery();
            Response.Redirect("employee_tasks");
        }
    }
}