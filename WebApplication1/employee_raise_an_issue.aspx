<%@ Page Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="employee_raise_an_issue.aspx.cs" Inherits="WebApplication1.employee_raise_an_issue" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent1" runat="server">
    
    
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
    margin-left:190px;
    color:rgba(0,0,0,0.25);
    font-family: 'Josefin Sans', sans-serif; 
}
</style>

    <div class="drop">
    <!-- Assign Tasks -->
    <br /><br /><br />
    <asp:Label class="message" ID="message" runat="server" /><br /><br />
    <asp:TextBox runat="server" style="margin-left:140px;" ID="issue_about" class="textbox" placeholder="Issue about.." required/><br /><br />
    <textarea type="text" style="resize:none;height:100px;width:570px;border-radius:35px;" runat="server" ID="issue_description" class="textbox" placeholder="Issue description.." required></textarea><br /><br />
    <span><asp:Button runat="server" class="submit" Text="submit" OnClick="issue_Click"/></span><br /><br />
    </div>
    
</asp:Content>