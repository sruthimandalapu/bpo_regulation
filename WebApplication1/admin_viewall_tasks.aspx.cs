using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_viewall_tasks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["task_status"] == "open")
                    status_open_Click(sender, e);
                else if (Session["task_status"] == "close")
                    status_close_Click(sender, e);
                else
                    view_all_Click(sender, e);
            }
            catch(Exception exp)
            {
                view_all_Click(sender, e);
            }
        }
        protected void view_all_Click(object sender, EventArgs e)
        {
            Session["task_status"] = "viewall";
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from tasks where task_assigned_by_email='" + Session["email"] + "' order by task_assigned_date desc", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
            view_all.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            status_open.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_close.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            tasks.Visible = true;
            edit_task.Visible = false;
            connection.Close();
        }
        protected void status_open_Click(object sender, EventArgs e)
        {
            Session["task_status"] = "open";
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from tasks where task_status='Open' and task_assigned_by_email='" + Session["email"] + "' order by task_assigned_date desc", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
            view_all.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_open.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            status_close.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            tasks.Visible = true;
            edit_task.Visible = false;
            connection.Close();
        }
        protected void status_close_Click(object sender, EventArgs e)
        {
            Session["task_status"] = "close";
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from tasks where task_status='Closed' and task_assigned_by_email='" + Session["email"] + "' order by task_assigned_date desc", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
            view_all.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_open.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_close.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            tasks.Visible = true;
            edit_task.Visible = false;
            connection.Close();
        }
        protected void edit_Click(object sender, EventArgs e)
        {
            tasks.Visible = false;
            edit_task.Visible = true;
            LinkButton btn = (LinkButton)sender;
            Guid id = new Guid(btn.CommandArgument);
            Session["task_id"] = id;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from tasks where id='" + id+ "'", connection);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                project_name.Text = reader["project_name"].ToString();
                priority.Text = reader["priority"].ToString();
                task_assigned_to.Text = reader["task_assigned_to_name"].ToString();
                employee_mail_id.Text = reader["task_assigned_to_email"].ToString();
                task_title.Text = reader["task_title"].ToString();
                task_status.Text = reader["task_status"].ToString();
                task_description.InnerText = reader["task_description"].ToString();
            }
            connection.Close();
        }
        protected void task_Click(object sender, EventArgs e)
        {
            tasks.Visible = false;
            edit_task.Visible = true;
            var form_project_name = project_name.Text;
            var form_priority = priority.Text;
            var form_task_assigned_to = task_assigned_to.Text;
            var form_employee_mail_id = employee_mail_id.Text;
            var form_task_title = task_title.Text;
            var form_task_status = task_status.Text;
            var form_task_description = task_description.InnerText;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("update tasks set project_name='"+form_project_name+"', "+
                "priority='" + form_priority+ "', "+
                "task_title='"+form_task_title+"', "+
                "task_status='"+form_task_status+"', "+
                "task_description='"+form_task_description+"', "+
                "task_assigned_to_name='"+form_task_assigned_to+"', "+
                "task_assigned_to_email='"+ form_employee_mail_id+"' "+
                "where id='" + Session["task_id"]+"'"
                , connection);
            cmd.ExecuteNonQuery();
            connection.Close();
            message.Text = "Updated Successfully!";
        }
        protected void delete_Click(object sender, EventArgs e)
        {
            tasks.Visible = true;
            edit_task.Visible = false;
            LinkButton btn = (LinkButton)sender;
            Guid id = new Guid(btn.CommandArgument);
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("delete from tasks where id='" + id + "'", connection);
            cmd.ExecuteNonQuery();
            connection.Close();
            Response.Redirect("admin_viewall_tasks");
        }
    }
}