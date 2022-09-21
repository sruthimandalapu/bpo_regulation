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

            place_status_open.Visible = false;
            place_status_closed.Visible = false;
            place_view_all.Visible = true;
            view_all.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand c = new SqlCommand("select id,task_title,task_status,task_assigned_to,emp_email_id from tasks where task_assigned_email='" + Session["email"] + "'", connection);
            SqlDataReader r = c.ExecuteReader();
            //list_view_all.Sorce = "";

        }
        protected void view_all_Click(object sender, EventArgs e)
        {
            place_status_open.Visible = false;
            place_status_closed.Visible = false;
            place_view_all.Visible = true;
            view_all.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            status_open.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_close.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        }
        protected void status_open_Click(object sender, EventArgs e)
        {
            place_status_open.Visible = true;
            place_status_closed.Visible = false;
            place_view_all.Visible = false;
            view_all.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_open.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
            status_close.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        }
        protected void status_close_Click(object sender, EventArgs e)
        {
            place_status_open.Visible = false;
            place_status_closed.Visible = true;
            place_view_all.Visible = false;
            view_all.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_open.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
            status_close.BackColor = System.Drawing.ColorTranslator.FromHtml("#f3f5f9");
        }
        protected void edit_Click(object sender, EventArgs e)
        {

        }
            protected void delete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            var id=btn.CommandArgument.ToString();
            Debug.WriteLine(id);
            /*
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("delete from tasks where id='"+id+"'", connection);
            cmd.ExecuteNonQuery();
            connection.Close();
            */
        }
    }
}