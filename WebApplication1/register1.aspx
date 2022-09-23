<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register1.aspx.cs" Inherits="WebApplication1.register1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BPO</title>

    <style>
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
    margin-left:200px;
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
    margin-right:0px;
}
#message{
    color:rgba(0,0,0,0.25);
    font-family:Calibri;
    margin-left:115px;
}
</style>
</head>
<body>
    <form id="form1" runat="server" style="margin-left:30%;">
        <br /><br /><br />
        <span style="color:rgba(0,0,0,0.23);font-family:Calibri;margin-left:160px;">A Step To Complete Registration Process!</span><br /><br /><br />
        <asp:TextBox runat="server" type="text" ID="date_of_birth" onfocus="(this.type='date')" class="textbox" placeholder="Date of Birth.." required/>
        <asp:TextBox runat="server" type="text" ID="gender" class="textbox" placeholder="Gender.." required/><br /><br />
        <asp:TextBox runat="server" type="text" ID="residential_city" class="textbox" placeholder="Residential City.." required/>
        <asp:TextBox runat="server" type="text" ID="qualification" class="textbox" placeholder="Qualification.." required/><br /><br />
        <asp:TextBox runat="server" type="text" ID="year_passed_out" class="textbox" placeholder="Year Passed Out.." required/>
        <asp:TextBox runat="server" type="text" ID="skill_sets" class="textbox" placeholder="Skill Sets.." required/><br /><br />
        <asp:TextBox runat="server" type="email" ID="working_company" class="textbox" placeholder="Working Company.." required/>
        <asp:TextBox runat="server" type="text" ID="working_domain" class="textbox" placeholder="Working Domain.." required/><br /><br />
        <asp:TextBox runat="server" type="text" ID="working_city" class="textbox" placeholder="Working in City.." required/>
        <asp:TextBox runat="server" type="text" ID="Years_of_experience" class="textbox" placeholder="Years of Experience.." required/><br /><br />
    <span><asp:Button runat="server" onclick="register_Click" class="submit" Text="register"/></span>
    </form>
</body>
</html>
