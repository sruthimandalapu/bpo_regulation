<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="admin_tasks.aspx.cs" Inherits="WebApplication1.admin_tasks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .drop{
            margin-left:280px;
            margin-top:30px;
        }
        .textbox{
  border: 1px solid rgba(0, 0, 0, 0.1);
  width: 30%;
  height: 10px;
  padding:20px;
  border-radius:40px;
  font-family:Calibri;
  font-size:16px;
  color:rgba(0,0,0,0.45);
}
.submit,button{
    margin-left:1px;
  width: 26%;
  border-radius:40px;
  height: 40px;
  padding-top: 8px;
  padding-bottom: 10px;
  color: white;
  background-color: rgb(0, 0, 128);
  border: 1px solid rgba(0, 0, 0, 0.1);
  font-family: Bahnschrift;
  font-family:Calibri;
  font-size: 17px;
}
button{
  width: 16%;
  margin-left: 5px;
}

        #message {
            color: rgba(0,0,0,0.25);
            font-family: Calibri;
            margin-left: 95px;
        }
.list{
    padding:10px;
    border-radius:10px;
    border:none;
    background-color:#002B5B;
    color:white;
    font-family:Calibri;
    font-size:15px;
}
.list:hover{
    background-color:#002B5B;
}
ListItem:hover{
    background-color:#002B5B;
}
    </style>
    <div class="drop">
    <asp:DropDownList CssClass="list" style=" margin-left:400px;"  ID="TasksDropDown" runat="server" AutoPostBack="true" OnSelectedIndexChanged="TasksDropDown_SelectedIndexChanged">
        <asp:ListItem CssClass="view" Enabled="true" Text= "Task" Value= "3"></asp:ListItem>
        <asp:ListItem CssClass="view" Text= "Assign a Tasks" Value="1"></asp:ListItem>
        <asp:ListItem CssClass="view" Text= "View all Tasks" Value="2"></asp:ListItem>
    </asp:DropDownList>
    <br />

        <asp:PlaceHolder ID="Tasks" runat="server">
            tasks
        </asp:PlaceHolder>


        <asp:PlaceHolder ID="AssignTasks" runat="server">
    <!-- Assign Tasks -->
    <asp:TextBox style="margin-top:30px;" runat="server" ID="task_title" class="textbox" placeholder="Task Title" required/>
    <asp:TextBox runat="server" ID="task_status" class="textbox" placeholder="Task Status" required/><br /><br />
    <textarea type="text" style="resize:none;height:100px;width:600px;" runat="server" ID="task_description" class="textbox" placeholder="Task Description" required></textarea><br /><br />
    <asp:TextBox runat="server" ID="priority" class="textbox" placeholder="Priority" required/>
    <asp:TextBox runat="server" ID="project_name" class="textbox" placeholder="Project Name" required/><br /><br />
    <asp:TextBox runat="server" ID="task_assigned_to" class="textbox" placeholder="Task assigned to" required/>
    <asp:TextBox runat="server" ID="employee_email_id" class="textbox" placeholder="Employee Email ID" required/>
        <br><br>
    <span><asp:Button runat="server" class="submit" Text="submit"/></span><br /><br />
        </asp:PlaceHolder>

        <asp:PlaceHolder ID="ViewTasks" runat="server">
            view tasks
        </asp:PlaceHolder>
    </div>


</asp:Content>