using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class employee_raise_an_issue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void issue_Click(object sender, EventArgs e)
        {
            var form_id= Guid.NewGuid();
            var form_name = Session["full_name"];
            var form_mail = Session["email"];
            var form_issue_about = issue_about.Text;
            var form_describe_issue = issue_description.InnerText;
            var form_issued_on= DateTime.Now.ToString("yyyy-MM-dd");
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            SqlCommand cmd = new SqlCommand("insert into issues(id,emp_name,emp_mail,issue_about,describe_issue,status,issue_raised_on) values(" +
                "'"+form_id+"',"+
                "'"+form_name+"',"+
                "'"+form_mail+"',"+
                "'"+form_issue_about+"',"+
                "'"+form_describe_issue+"',"+
                "'Open',"+
                "'"+form_issued_on+"')"
                ,connection);
            cmd.ExecuteNonQuery();
            message.Text = "Issue raised successfully!";
        }
    }
}