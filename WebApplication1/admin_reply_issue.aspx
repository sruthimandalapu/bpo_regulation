<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_reply_issue.aspx.cs" Inherits="WebApplication1.reply_issue" %>

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
        <br />
        <br />
    <asp:Label class="message" ID="message" runat="server" /><br /><br /><br />

    <asp:Label style="margin-left:50px;font-size:17px;" class="message" ID="Label1" runat="server" Text="Employee Mail Id" />
    <asp:TextBox runat="server" style="margin-left:30px;" ID="emp_email_id" class="textbox" placeholder="Employee Email ID" type="email" disabled/><br /><br />
    <textarea type="text" style="resize:none;height:100px;width:570px;border-radius:35px;" runat="server" ID="comments" class="textbox" placeholder="Comments" required></textarea><br /><br />
    <span><asp:Button runat="server" class="submit" Text="submit" OnClick="reply_Click"/></span><br /><br />
    <a href="admin_issues_raised"><p style="line-height:20px;margin-left:220px;color:#002B5B;" id="bot">Get back to Issues!</p></a>
    </div>

</asp:Content>