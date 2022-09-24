<%@ Page Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="employee_particulars.aspx.cs" Inherits="WebApplication1.employee_particulars" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent1" runat="server">


    <style>
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
    margin-left:360px;
    color:rgba(0,0,0,0.25);
    font-family: 'Josefin Sans', sans-serif; 
}
.name{
    color:rgba(0,0,0,0.35);
}
.submit,button{
    margin-left:310px;
  width: 26%;
  border-radius:40px;
  height: 40px;
  padding-top: 8px;
  padding-bottom: 10px;
  color: white;
  background-color: rgb(0, 0, 128);
  border: 1px solid rgba(0, 0, 0, 0.1);
  font-family: Bahnschrift;
  font-family: 'Josefin Sans', sans-serif; 
  font-size: 17px;
  cursor:pointer;
}
    </style>


    

    <div class="drop">
    <br />
    <asp:Label style="margin-bottom:100px;" class="message" ID="message" runat="server"/><br />
    <!-- Assign Tasks -->
    <span class="name" style="margin-right:75.5px;">Full Name</span><asp:TextBox style="margin-top:20px;margin-right:20px;  border: 1px solid rgba(0, 0, 0, 0.1);
  width: 30%;
  height: 10px;
  padding:20px;
  border-radius:40px;font-family: 'Josefin Sans', sans-serif; 
  font-size:16px;
  color:rgba(0,0,0,0.45);" runat="server" ID="full_name" type="text" class="textbox" placeholder="Null" />
    <span class="name" style="margin-right:95.5px;">Email</span><asp:TextBox type="email" style="margin-top:20px;margin-right:20px;  border: 1px solid rgba(0, 0, 0, 0.1);
  width: 30%;
  height: 10px;
  padding:20px;
  border-radius:40px;font-family: 'Josefin Sans', sans-serif; 
  font-size:16px;
  color:rgba(0,0,0,0.45);" runat="server" ID="email" class="textbox" placeholder="Null"/><br /><br />
    <span class="name" style="margin-right:30px;">Contact Number</span><asp:TextBox style="margin-right:20px; border: 1px solid rgba(0, 0, 0, 0.1);
  width: 30%;
  height: 10px;
  padding:20px;
  border-radius:40px;font-family: 'Josefin Sans', sans-serif; 
  font-size:16px;
  color:rgba(0,0,0,0.45);" runat="server" ID="contact_number" class="textbox" type="number" placeholder="Null" />
    <span class="name" style="margin-right:45px;">Qualification</span><asp:TextBox style="margin-right:20px;" runat="server" ID="qualification" class="textbox" placeholder="Null" /><br /><br />
    <span class="name" style="margin-right:30px;">Passed Out Year</span><asp:TextBox style="margin-right:20px;" runat="server" ID="passed_out_year" class="textbox" type="number" placeholder="Null" />
    <span class="name" style="margin-right:75px;">Skill Sets</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="skill_sets" class="textbox" placeholder="Null" /><br /><br />
    <span class="name" style="margin-right:17px;">Working Company</span><asp:TextBox style="margin-right:20px;" runat="server" ID="working_company" class="textbox" placeholder="Null" />
    <span class="name" style="margin-right:20px;">Working Domain</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="working_domain" class="textbox" placeholder="Null" /><br /><br />
    <span class="name" style="margin-right:57px;">Working City</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="working_city" class="textbox" placeholder="Null" />
    <span class="name" style="margin-right:62px;">Experience</span><asp:TextBox style="margin-right:20px;" runat="server" ID="experience" class="textbox" placeholder="Null" /><br /><br />
    <br />
    <span><asp:Button runat="server" class="submit" OnClick="edit_Click" Text="update" /></span><br /><br />
    </div>
   
</asp:Content>