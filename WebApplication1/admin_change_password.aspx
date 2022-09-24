<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin_change_password.aspx.cs" Inherits="WebApplication1.admin_change_password" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<style>
.drop{
            margin-left:600px;
            margin-top:30px;
        }
.textbox{
  border: 1px solid rgba(0, 0, 0, 0.1);
  width: 45%;
  height: 10px;
  padding:20px;
  border-radius:40px;
  font-family: 'Josefin Sans', sans-serif; 
  font-size:16px;
  color:rgba(0,0,0,0.45);
}
.submit,button{
    margin-left:1px;
  width: 45%;
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
    color:rgba(0,0,0,0.25);
    font-family: 'Josefin Sans', sans-serif; 
    margin-left:35px;
}
</style>
    <div class="drop">
        <br /><br />
    <asp:Label CssClass="message" ID="message" runat="server" /><br />
    <asp:TextBox style="margin-top:30px;" runat="server" type="password" ID="current_password" class="textbox" placeholder="Current Password.." required/><br /><br />
    <asp:TextBox runat="server" type="password" ID="new_password" class="textbox" placeholder="New Password.." required/><br /><br />
    <asp:TextBox runat="server" type="password" ID="confirm_new_password" class="textbox" placeholder="Confirm New Password.." required/>
        <br><br>
    <span><asp:Button runat="server" onclick="change_Click" class="submit" Text="update"/></span><br /><br />
    </div>

</asp:Content>