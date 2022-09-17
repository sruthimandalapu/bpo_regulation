<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verify_password.aspx.cs" Inherits="WebApplication1.verify_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BPO</title>
</head>
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
    margin-left:95px;
}
</style>
<body>
    <div style="float:left;width:69%">
  <img src="./images/bpo.png" height="550" width="850">
  </div>
    <form id="form1" runat="server">
        <br><br /><br /><br /><br /><br /><br />
    <asp:Label ID="message" runat="server" />
    <asp:TextBox style="margin-top:30px;" runat="server" ID="otp" class="textbox" placeholder="otp.." required/><br /><br />
    <asp:TextBox runat="server" type="password" ID="password" class="textbox" placeholder="Password.." required/><br /><br />
    <asp:TextBox runat="server" type="password" ID="confirm_password" class="textbox" placeholder="Confirm Password.." required/>
        <br><br>
    <span><asp:Button runat="server" onclick="verify_Click" class="submit" Text="submit"/></span><br /><br />
        <!--
    <hr style="border:solid 1px rgba(0,0,0,0.1);width:25%;margin-left:7px;"/><br />
    <a href="reset"><p style="line-height:20px;" id="bot">Get back to reset!</p></a> -->
    </form>
</body>
</html>
