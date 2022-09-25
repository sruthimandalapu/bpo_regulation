using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class employee_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void employee_tasks_Click(object sender, EventArgs e)
        {
            Session["emp_status"] = "viewall";
            Response.Redirect("employee_tasks");
        }
        protected void employee_viewall_issues_Click(object sender, EventArgs e)
        {
            Response.Redirect("employee_viewall_issues");
        }
    }
}