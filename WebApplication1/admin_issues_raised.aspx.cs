using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_emp_feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("select * from issues", connection);
            SqlDataReader reader=cmd.ExecuteReader();
            ListView1.DataSource = reader;
            ListView1.DataBind();
        }
        protected void reply_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Guid id = new Guid(btn.CommandArgument);
            Response.Redirect("admin_reply_issue?id="+id.ToString());
        }
    }
}