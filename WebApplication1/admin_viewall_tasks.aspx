<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_viewall_tasks.aspx.cs" Inherits="WebApplication1.admin_viewall_tasks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%@ Import Namespace="System.Data.SqlClient" %>  
    <style>
        table {
  border-collapse: collapse;
  width: 950px;
  margin:30px;
  margin-left:300px;
  margin-right:30px;
  color:rgba(0,0,0,0.4);
  font-family:Calibri;
  letter-spacing:0.45;
  font-size:15px;
  background-color:white;
}

th, td {
  padding: 13px;
  text-align: center;
  border-bottom: 1px solid #DDD;
}
th{
    font-family: 'Josefin Sans', sans-serif;
    letter-spacing:1;
}
tr:hover {background-color: #D6EEEE;
          
           /* background-color:#B9D9EB;  */
           /* background-color:#ADD8E6; */
           /*background-color:#AFDBF5; */
           /* background-color:white; */
           background-color:#f3f5f9;

}
.submit{
    margin-top:30px;
  width: 170px;
  border-radius:10px;
  height: 40px;
    padding-top: 9px;
  padding-bottom: 9px;
  color: white;
  background-color: white;
  color:rgba(0,0,0,0.4);
  border: 1px solid rgba(0, 0, 0, 0.1);
  font-family: Bahnschrift;
  font-family:Calibri;
  font-size: 14px;
  font-weight:bold;
  font-family: 'Josefin Sans', sans-serif;
  letter-spacing:0;
  cursor:pointer;
}
        .submit:hover {
            background-color : #f3f5f9;
        }
    </style>

    <asp:Button style="margin-left:500px;" runat="server" ID="view_all" onclick="view_all_Click" class="submit" Text="VIEW ALL TASKS"/>
    <asp:Button runat="server" ID="status_open" onclick="status_open_Click" class="submit" Text="STATUS OPEN"/>
    <asp:Button runat="server" ID="status_close" onclick="status_close_Click" class="submit" Text="STATUS CLOSE"/>






    <asp:PlaceHolder runat="server" ID="place_view_all">
    <table>
  <tr>
    <th>TASK TITLE</th>
    <th>TASK STATUS</th>
    <th>TASK ASSIGNED TO</th>
      <th>EMPLOYEE EMAIL ID</th>
      <th>EDIT</th>
      <th>DELETE</th>
  </tr>
    <%
        SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
        connection.Open();
        SqlCommand c = new SqlCommand("select task_title,task_status,task_assigned_to,emp_email_id from tasks where task_assigned_email='" + Session["email"] +"'", connection);
        SqlDataReader r = c.ExecuteReader();
        while (r.Read())
        {
    %>
    <tr><td><%=r["task_title"] %></td>
    <td><%=r["task_status"] %></td>
    <td><%=r["task_assigned_to"] %></td>
      <td><%=r["emp_email_id"] %></td>
        <td><i style="padding-left:20px;" class="fas fa-pen"></i></td>
      <td><i style="padding-left:20px;"     class="fas fa-trash"></i></td>
      <% 
          }r.Close();  %>
      
  </tr>
  
</table>
</asp:PlaceHolder>






     <asp:PlaceHolder runat="server" ID="place_status_open">
    <table>
  <tr>
    <th>TASK TITLE</th>
    <th>TASK STATUS</th>
    <th>TASK ASSIGNED TO</th>
      <th>EMPLOYEE EMAIL ID</th>
      <th>EDIT</th>
      <th>DELETE</th>
  </tr>
    <%
        SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
        connection.Open();
        SqlCommand cmd = new SqlCommand("select task_title,task_status,task_assigned_to,emp_email_id from tasks where task_assigned_email='" + Session["email"] +"' and task_status='Open'", connection);
        SqlDataReader rea = cmd.ExecuteReader();
        while (rea.Read())
        {
    %>
    <tr><td><%=rea["task_title"] %></td>
    <td><%=rea["task_status"] %></td>
    <td><%=rea["task_assigned_to"] %></td>
      <td><%=rea["emp_email_id"] %></td>
        <td><i style="padding-left:20px;" class="fas fa-pen"></i></td>
      <td><i style="padding-left:20px;"     class="fas fa-trash"></i></td>
      <% 
          }  rea.Close();%>
      
  </tr>
  
</table>
</asp:PlaceHolder>








     <asp:PlaceHolder runat="server" ID="place_status_closed">
    <table>
  <tr>
    <th>TASK TITLE</th>
    <th>TASK STATUS</th>
    <th>TASK ASSIGNED TO</th>
      <th>EMPLOYEE EMAIL ID</th>
      <th>EDIT</th>
      <th>DELETE</th>
  </tr>
    <%
        SqlConnection connection = new SqlConnection("Data Source=LAPTOP-IPNJ48D\\SQLEXPRESS;Initial Catalog=bpo;Integrated Security=true");
        connection.Open();
        SqlCommand command = new SqlCommand("select task_title,task_status,task_assigned_to,emp_email_id from tasks where task_assigned_email='" + Session["email"] +"' and task_status='Closed'", connection);
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
    %>
    <tr><td><%=reader["task_title"] %></td>
    <td><%=reader["task_status"] %></td>
    <td><%=reader["task_assigned_to"] %></td>
      <td><%=reader["emp_email_id"] %></td>
        <td><i style="padding-left:20px;" class="fas fa-pen"></i></td>
      <td><i style="padding-left:20px;"     class="fas fa-trash"></i></td>
      <%}  %>
      
  </tr>
  
</table>
</asp:PlaceHolder>


</asp:Content>