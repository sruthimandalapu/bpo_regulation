using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class register1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void register_Click(object sender, EventArgs e)
        {
            var form_date_of_birth = date_of_birth.Text;
            var form_gender = gender.Text;
            var form_residential_city=residential_city.Text;   
            var form_qualification=qualification.Text;
            var form_year_passed_out = year_passed_out.Text;
            var form_skill_sets=skill_sets.Text;
            var form_working_company=working_company.Text;
            var form_working_domain=working_domain.Text;
            var form_working_city = working_city.Text;
            var form_years_of_experience=Years_of_experience.Text;
        }
    }
}