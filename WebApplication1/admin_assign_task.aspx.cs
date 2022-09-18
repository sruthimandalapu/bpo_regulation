using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_tasks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void task_Click(object sender, EventArgs e)
        {
            var form_project_name =project_name.Text;
            var form_priority=project_name.Text;
            var form_task_assigned_to=task_assigned_to.Text;    
            var form_employee_email_id=employee_email_id.Text;
            var form_task_title=task_title.Text;
            var form_task_status=task_status.Text;
            var form_task_description = task_description.InnerText;
            var form_task_assigned_name = Session["full_name"];
            var form_task_assigned_email = Session["email"];
            var form_task_assigned_date = DateTime.Now.ToString("yyyy-MM-dd");
            var form_id=0;
            SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
            connection.Open();
            
            SqlCommand cmd = new SqlCommand("select email from login where email='" + form_employee_email_id + "' and profile_type='employee'", connection);
            SqlDataReader r = cmd.ExecuteReader();
            if (r.Read())
            {
                r.Close();
                SqlCommand command = new SqlCommand("select count(*) c from tasks", connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    form_id = Convert.ToInt32(reader["c"]);
                }
                reader.Close();
                form_id = form_id + 1;
                SqlCommand c = new SqlCommand("insert into tasks(id,project_name,emp_email_id,priority,task_assigned_to,task_title,task_status,task_description,task_assigned_name,task_assigned_email,task_assigned_date) values('" +
                    form_id + "','" +
                    form_project_name + "','" +
                    form_employee_email_id + "','" +
                    form_priority + "','" +
                    form_task_assigned_to + "','" +
                    form_task_title + "','" +
                    form_task_status + "','" +
                    form_task_description + "','" +
                    form_task_assigned_name + "','" +
                    form_task_assigned_email + "','" +
                    form_task_assigned_date + "')"
                    , connection);
                c.ExecuteNonQuery();
                connection.Close();
                message.Text = "Updated Successfully!";
            }
            else
            {
                message.Text = "Invalid Employee Id!";
            }

            
        }
    }
}