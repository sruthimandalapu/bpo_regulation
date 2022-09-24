<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin_employee_particulars.aspx.cs" Inherits="WebApplication1.admin_emp_particulars" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        table {
            border-collapse: collapse;
            width: 950px;
            margin: 30px;
            margin-left: 300px;
            margin-right: 30px;
            color: rgba(0,0,0,0.4);
            font-family: Calibri;
            letter-spacing: 0.45;
            font-size: 15px;
            background-color: white;
        }

        th, td {
            padding: 13px;
            text-align: center;
            border-bottom: 1px solid #DDD;
            cursor: pointer;
        }

        th {
            font-family: 'Josefin Sans', sans-serif;
            letter-spacing: 1;
        }

        tr:hover {
            background-color: #D6EEEE;
            /* background-color:#B9D9EB;  */
            /* background-color:#ADD8E6; */
            /*background-color:#AFDBF5; */
            /* background-color:white; */
            background-color: #f3f5f9;
        }

        .submit {
            margin-top: 30px;
            width: 170px;
            border-radius: 10px;
            height: 40px;
            padding-top: 9px;
            padding-bottom: 9px;
            color: white;
            background-color: white;
            color: rgba(0,0,0,0.4);
            border: 1px solid rgba(0, 0, 0, 0.1);
            font-family: Bahnschrift;
            font-family: Calibri;
            font-size: 14px;
            font-weight: bold;
            font-family: 'Josefin Sans', sans-serif;
            letter-spacing: 0;
            cursor: pointer;
        }






 .drop{
            margin-left:350px;
            margin-top:10px;
        }

        .textbox{
  border: 1px solid rgba(0, 0, 0, 0.1);
  width: 30%;
  height: 10px;
  padding:20px;
  border-radius:40px;
  font-family: 'Josefin Sans', sans-serif; 
  font-size:16px;
  color:rgba(0,0,0,0.45);
}
/*
button{
  width: 16%;
  margin-left: 5px;
} */
.message{
    margin-left:330px;
    color:rgba(0,0,0,0.25);
    font-family: 'Josefin Sans', sans-serif; 
}
.name{
    color:rgba(0,0,0,0.35);
}
    </style>
 
    <asp:PlaceHolder runat="server" ID="emp_details">
    <asp:Button runat="server" ID="new_employees" OnClick="new_emp_Click" class="submit" Text="NEW EMPLOYEES" Style="margin-left: 590px;margin-right:10px;" />
    <asp:Button runat="server" ID="all_employees" OnClick="all_emp_Click" class="submit" Text="ALL EMPLOYEES" />
    
    <asp:ListView ID="ListView1" runat="server">
    <LayoutTemplate> 
            <table runat="server">
                <tr>
                    <th>FULL NAME</th>
                    <th>EMAIL</th>
                    <th>WORKING COMPANY</th>
                    <th>DOMAIN</th>
                    <th>SKILLS</th>
                    <th>VIEW DETAILS</th>
                    <th>ASSIGN A TASK</th>
                    <th>DELETE</th>
                </tr>
                <tr id="itemPlaceHolder" runat="server">
                </tr>
            </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr>
            <td><%#DataBinder.Eval(Container,"DataItem.full_name") %>           
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.email") %>   
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.working_company") %>
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.working_domain")    %>           
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.skill_sets")    %>           
            </td>
            <td><asp:LinkButton runat="server" ID="LinkButton1" OnClick="view_Click" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id")%>'><i style="color:rgba(0,0,0,0.4);padding-left:20px;" class="fas fa-eye"></i>
            </asp:LinkButton></td>
            <td><asp:LinkButton runat="server" ID="reply" OnClick="assign_Click" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id")%>'><i style="color:rgba(0,0,0,0.4);padding-left:20px;" class="fas fa-user-plus"></i>
            </asp:LinkButton></td>
            <td><asp:LinkButton runat="server" ID="delete" OnClick="delete_Click" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id")%>'><i style="color:rgba(0,0,0,0.4);padding-left:20px;" class="fas fa-trash"></i>
            </asp:LinkButton></td>
        </tr>
    </ItemTemplate>
    </asp:ListView>
    </asp:PlaceHolder>





    <asp:PlaceHolder runat="server" ID="view_details">

    <asp:Button runat="server" ID="id_personal_details" OnClick="personal_details_Click" class="submit" Text="PERSONAL DETAILS" Style="margin-left: 550px;margin-right:10px;width:220px;"  />
    <asp:Button runat="server" ID="id_professional_details" OnClick="professional_details_Click" class="submit" Text="PROFESSIONAL DETAILS" style="width:220px;"  />

    <asp:PlaceHolder runat="server" ID="personal_details" >
    <div class="drop">
    <span class="name" style="margin-right:52.5px;">First Name</span><asp:TextBox style="margin-top:20px;margin-right:20px; " runat="server" ID="first_name" class="textbox" placeholder="Null" disabled/>
    <span class="name" style="margin-right:35.5px;">Last Name</span><asp:TextBox style="margin-top:20px;margin-right:20px; " runat="server" ID="last_name" class="textbox" placeholder="Null" disabled/><br /><br />
    <span class="name" style="margin-right:92px;">Email</span><asp:TextBox style="margin-right:20px;" runat="server" ID="email1" class="textbox" type="email" placeholder="Null" disabled/>
    <span class="name" style="margin-right:20px;">Date of Birth</span><asp:TextBox style="margin-right:20px;" runat="server" ID="date_of_birth" onfocus="(this.type='date')" class="textbox" placeholder="Null" disabled/><br /><br />
    <span class="name" style="margin-right:14px;">Contact Number</span><asp:TextBox style="margin-right:20px;" runat="server" ID="contact_number1" class="textbox" type="number" placeholder="Null" disabled/>
    <span class="name" style="margin-right:60px;">Gender</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="gender" class="textbox" placeholder="Null" disabled/><br /><br />
    <span class="name" style="margin-right:98px;">State</span><asp:TextBox style="margin-right:20px;" runat="server" ID="state" class="textbox" placeholder="Null" disabled/>
    <span class="name" style="margin-right:83px;">City</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="city" class="textbox" placeholder="Null" disabled/><br /><br />
    <span class="name" style="margin-right:93px;">Street</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="street" class="textbox" placeholder="Null" disabled/>
    <span class="name" style="margin-right:55px;">Pincode</span><asp:TextBox style="margin-right:20px;" runat="server" ID="pincode" class="textbox" placeholder="Null" disabled/><br /><br />
    <br />
    <a style="margin-left:350px;color:rgba(0,0,0,0.3);margin-top:30px;font-size:16px;" href="admin_employee_particulars">Get back to employees!</a>
    </div>
    </asp:PlaceHolder>




    <asp:PlaceHolder runat="server" ID="professional_details">
    <div class="drop">
    <!-- Assign Tasks -->
    <span class="name" style="margin-right:75.5px;">Full Name</span><asp:TextBox style="margin-top:20px;margin-right:20px; " runat="server" ID="full_name" class="textbox" placeholder="Null" disabled/>
    <span class="name" style="margin-right:95.5px;">Email</span><asp:TextBox style="margin-top:20px;margin-right:20px; " runat="server" ID="email" class="textbox" placeholder="Null" disabled/><br /><br />
    <span class="name" style="margin-right:30px;">Contact Number</span><asp:TextBox style="margin-right:20px;" runat="server" ID="contact_number" class="textbox" type="email" placeholder="Null" disabled/>
    <span class="name" style="margin-right:45px;">Qualification</span><asp:TextBox style="margin-right:20px;" runat="server" ID="qualification" onfocus="(this.type='date')" class="textbox" placeholder="Null" disabled/><br /><br />
    <span class="name" style="margin-right:30px;">Passed Out Year</span><asp:TextBox style="margin-right:20px;" runat="server" ID="passed_out_year" class="textbox" type="number" placeholder="Null" disabled/>
    <span class="name" style="margin-right:75px;">Skill Sets</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="skill_sets" class="textbox" placeholder="Null" disabled/><br /><br />
    <span class="name" style="margin-right:17px;">Working Company</span><asp:TextBox style="margin-right:20px;" runat="server" ID="working_company" class="textbox" placeholder="Null" disabled/>
    <span class="name" style="margin-right:20px;">Working Domain</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="working_domain" class="textbox" placeholder="Null" disabled/><br /><br />
    <span class="name" style="margin-right:57px;">Working City</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="working_city" class="textbox" placeholder="Null" disabled/>
    <span class="name" style="margin-right:62px;">Experience</span><asp:TextBox style="margin-right:20px;" runat="server" ID="experience" class="textbox" placeholder="Null" disabled/><br /><br />
    <br />
    <a style="margin-left:350px;color:rgba(0,0,0,0.3);font-size:16px;" href="admin_employee_particulars">Get back to employees!</a>
    </div>
    </asp:PlaceHolder>


    </asp:PlaceHolder>




</asp:Content>
