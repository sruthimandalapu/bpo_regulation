using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class admin_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }        
        protected void close_Click(object sender, EventArgs e)
        {
            Session["task_status"] = "close";
            Response.Redirect("admin_viewall_tasks");
        }
    }
}