using System;
using System.Collections.Generic;
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
            AssignTasks.Visible = false;
            ViewTasks.Visible = false;
            Tasks.Visible = true;
        }

        protected void TasksDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (TasksDropDown.SelectedValue == "3")
            {
                AssignTasks.Visible = false;
                ViewTasks.Visible = false;
                Tasks.Visible = true;
            }
            else if(TasksDropDown.SelectedValue == "1")
            {
                Tasks.Visible=false;
                ViewTasks.Visible=false;
                AssignTasks.Visible = true;
            }
            else
            {
                Tasks.Visible=false;
                AssignTasks.Visible = false;
                ViewTasks.Visible = true;
            }

        }
    }
}