<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BPO</title>
    <style>
.textbox{
  border: 1px solid rgba(0, 0, 0, 0.1);
  width: 23%;
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
  cursor:pointer;
}
button{
  width: 16%;
  margin-left: 5px;
}
p,span{
  font-family: Bahnschrift;
}
a{
  text-decoration: none;
  font-size: 15px;
  color: #B2BEB5;
}
#bot{
    color: rgb(0,0,128);
    font-family:Calibri;
    font-size:15px;
    line-height:10px;
    text-align:center;
    margin-right:60px;
}
#message{
    color:rgba(0,0,0,0.25);
    font-family:Calibri;
    margin-left:115px;
}
</style>
</head>
<body>
    <div style="float:left;width:69%">
  <img src="./images/bpo.png" height="550" width="850">
  </div>
    <form id="form1" runat="server">
        <br /><br /><br />
    <asp:Label ID="message" runat="server" />
    <asp:TextBox style="margin-top:30px;" runat="server" type="text" ID="first_name" class="textbox" placeholder="First Name.." required/><br /><br />
    <asp:TextBox runat="server" type="text" ID="last_name" class="textbox" placeholder="Last Name.." required/><br /><br />
    <asp:TextBox runat="server" type="email" ID="email" class="textbox" placeholder="Email Address.." required/><br /><br />
        <asp:TextBox runat="server" type="number" ID="contact_number" class="textbox" placeholder="Contact Number.." required/><br /><br />
    <span><asp:Button runat="server" onclick="register_Click" class="submit" Text="next"/></span><br /><br />
    <hr style="border:solid 1px rgba(0,0,0,0.1);width:25%;margin-left:7px;"/>
    <a href="login"><p style="line-height:20px;" id="bot">Get back to login!</p></a>
    </form>
</body>
</html>