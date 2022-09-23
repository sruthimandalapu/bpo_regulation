<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_viewall_tasks.aspx.cs" Inherits="WebApplication1.admin_viewall_tasks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%@ Import Namespace="System.Data.SqlClient" %>
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
            margin-right:10px;
        }

            .submit:hover {
                background-color: #f3f5f9;
            }


            .submit1{
    margin-left:330px;
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

    .drop{
            margin-left:330px;
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
    margin-left:380px;
    color:rgba(0,0,0,0.25);
    font-family: 'Josefin Sans', sans-serif; 
}
.name{
    color:rgba(0,0,0,0.35);
}
    </style>

    <asp:PlaceHolder runat="server" ID="tasks">

        <asp:Button Style="margin-left: 500px;" runat="server" ID="view_all" OnClick="view_all_Click" class="submit" Text="VIEW ALL TASKS" />
        <asp:Button runat="server" ID="status_open" OnClick="status_open_Click" class="submit" Text="STATUS OPEN" />
        <asp:Button runat="server" ID="status_close" OnClick="status_close_Click" class="submit" Text="STATUS CLOSE" />


        <asp:ListView ID="ListView1" runat="server">
        <LayoutTemplate> 
                <table runat="server">
                    <tr>
                        <th>TASK TITLE</th>
                        <th>TASK STATUS</th>
                        <th>TASK ASSIGNED TO</th>
                        <th>EMPLOYEE EMAIL ID</th>
                        <th>EDIT</th>
                        <th>DELETE</th>
                    </tr>
                    <tr id="itemPlaceHolder" runat="server">
                    </tr>
                </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%#DataBinder.Eval(Container,"DataItem.task_title") %>           
                </td>
                <td><%#DataBinder.Eval(Container,"DataItem.task_status") %>   
                </td>
                <td><%#DataBinder.Eval(Container,"DataItem.task_assigned_to_name") %>
                </td>
                <td><%#DataBinder.Eval(Container,"DataItem.task_assigned_to_email")    %>           
                </td>
                <td><asp:LinkButton runat="server" ID="edit" OnClick="edit_Click" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id")%>'><i style="color:rgba(0,0,0,0.4);padding-left:20px;" class="fas fa-edit"></i>
                </asp:LinkButton></td>
                <td><asp:LinkButton runat="server" ID="delete" OnClick="delete_Click" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id")%>'><i style="color:rgba(0,0,0,0.4);padding-left:20px;" class="fas fa-trash"></i>
                </asp:LinkButton></td>
            </tr>
        </ItemTemplate>
        </asp:ListView>
    </asp:PlaceHolder>




    <asp:PlaceHolder runat="server" ID="edit_task">
    <div class="drop">
    <br />
    <asp:Label class="message" ID="message" runat="server" /><br />
    <span class="name" style="margin-right:52.5px;">Project Name</span><asp:TextBox style="margin-top:20px;margin-right:20px;" runat="server" ID="project_name" class="textbox" type="text" placeholder="Null" required/>
    <span class="name" style="margin-right:95.5px;">Priority</span><asp:TextBox style="margin-top:20px;margin-right:20px; " runat="server" ID="priority" class="textbox" type="text" placeholder="Null" required/><br /><br />
    <span class="name" style="margin-right:30px;">Task Assigned To</span><asp:TextBox style="margin-right:20px;" runat="server" ID="task_assigned_to" class="textbox" type="text" placeholder="Null" required/>
    <span class="name" style="margin-right:20px;">Employee Mail Id</span><asp:TextBox style="margin-right:20px;" runat="server" ID="employee_mail_id" class="textbox" type="email" placeholder="Null" required/><br /><br />
    <span class="name" style="margin-right:85px;">Task Title</span><asp:TextBox style="margin-right:20px;" runat="server" ID="task_title" class="textbox" type="text" placeholder="Null" required/>
    <span class="name" style="margin-right:66px;">Task Status</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="task_status" class="textbox" type="text" placeholder="Null" required/><br /><br />
    <span class="name" style="margin-right:30px;vertical-align: top;">Task Description</span><textarea type="text" style="resize:none;height:100px;width:740px;border-radius:30px;" runat="server" ID="task_description" class="textbox" placeholder="Task Description" required></textarea>
    <br /><br />
    <span><asp:Button runat="server" class="submit1" Text="submit" OnClick="task_Click"/></span><br /><br />
    <a style="margin-left:370px;color:rgba(0,0,0,0.3);margin-top:30px;font-size:16px;" href="admin_viewall_tasks">Get back to employees!</a>
    </div>
    </asp:PlaceHolder>

    
</asp:Content>
