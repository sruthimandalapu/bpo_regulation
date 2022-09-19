<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="admin_assign_task.aspx.cs" Inherits="WebApplication1.admin_tasks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .drop{
            margin-left:480px;
            margin-top:30px;
        }
        .textbox{
  border: 1px solid rgba(0, 0, 0, 0.1);
  width: 35%;
  height: 10px;
  padding:20px;
  border-radius:40px;
  font-family: 'Josefin Sans', sans-serif; 
  font-size:16px;
  color:rgba(0,0,0,0.45);
}
.submit,button{
    margin-left:180px;
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
button{
  width: 16%;
  margin-left: 5px;
}
.message{
    margin-left:220px;
    color:rgba(0,0,0,0.25);
    font-family: 'Josefin Sans', sans-serif; 
}
</style>


    <div class="drop">
    <!-- Assign Tasks -->
    <asp:Label class="message" ID="message" runat="server" /><br />
    <asp:TextBox style="margin-top:20px;" runat="server" ID="project_name" class="textbox" placeholder="Project Name" required/>
    <asp:TextBox runat="server" ID="priority" class="textbox" placeholder="Priority" required/>
    <br /><br />
    <asp:TextBox runat="server" ID="task_assigned_to" class="textbox" placeholder="Task assigned to" required/>
    <asp:TextBox runat="server" ID="employee_email_id" class="textbox" placeholder="Employee Email ID" type="email" required/><br /><br />
    <asp:TextBox  runat="server" ID="task_title" class="textbox" placeholder="Task Title" required/>
    <asp:TextBox runat="server" ID="task_status" class="textbox" placeholder="Task Status" required/><br /><br />
    <textarea type="text" style="resize:none;height:100px;width:570px;border-radius:35px;" runat="server" ID="task_description" class="textbox" placeholder="Task Description" required></textarea><br /><br />
    
    <span><asp:Button runat="server" class="submit" Text="submit" OnClick="task_Click"/></span><br /><br />
    </div>


</asp:Content>