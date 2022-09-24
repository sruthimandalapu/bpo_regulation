using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login");
        }
        protected void task_function_Click(object sender, EventArgs e)
        {
            Session["task_status"] = "viewall";
            Response.Redirect("admin_viewall_tasks");
        }
        protected void emp_function_Click(object sender, EventArgs e)
        {
            Session["direct_all"] = "false";
            Response.Redirect("admin_employee_particulars");
        }
    }
}