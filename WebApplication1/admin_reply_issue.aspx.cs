using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class reply_issue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var id = Request.QueryString["id"].ToString();
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select emp_mail from issues where id='"+id+"'", connection);
            SqlDataReader reader=cmd.ExecuteReader();
            if (reader.Read())
            {
                emp_email_id.Text = Convert.ToString(reader["emp_mail"]);
            }
        }
        protected void reply_Click(object sender, EventArgs e)
        {
            var id = Request.QueryString["id"].ToString();
            var form_comments = comments.InnerText;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("update issues set status='Resolved' , reply='"+form_comments +"', replied_by='"+Session["full_name"]+"', replied_by_email='" + Session["email"] + "' where id='"+id+"'", connection);
            cmd.ExecuteNonQuery();
            connection.Close();
            message.Text = "Reply is sent!";
        }
    }
}