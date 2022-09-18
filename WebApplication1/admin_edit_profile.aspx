<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_edit_profile.aspx.cs" Inherits="WebApplication1.admin_edit_profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <style>
        .drop{
            margin-left:350px;
            margin-top:30px;
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
.submit,button{
    margin-left:280px;
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
.name{
    color:rgba(0,0,0,0.35);
}
</style>


    <div class="drop">
    <!-- Assign Tasks -->
    <asp:Label class="message" ID="message" runat="server"/><br />
    <span class="name" style="margin-right:35.5px;">Full Name</span><asp:TextBox style="margin-top:20px;margin-right:20px; " runat="server" ID="full_name" class="textbox" placeholder="Full Name"/>
    <span class="name" style="margin-right:90px;">Email</span><asp:TextBox style="margin-right:20px;" runat="server" ID="email" class="textbox" type="email" placeholder="Email"/><br /><br />
    <span class="name" style="margin-right:15px;">Date of Birth</span><asp:TextBox style="margin-right:20px;" runat="server" ID="date_of_birth" class="textbox" placeholder="Date of Birth"/>
    <span class="name" style="margin-right:14px;">Contact Number</span><asp:TextBox style="margin-right:20px;" runat="server" ID="contact_number" class="textbox" type="number" placeholder="Contact Number"/><br /><br />
    <span class="name" style="margin-right:58px;">Gender</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="gender" class="textbox" placeholder="Gender"/>
    <span class="name" style="margin-right:95px;">State</span><asp:TextBox style="margin-right:20px;" runat="server" ID="state" class="textbox" placeholder="State"/><br /><br />
    <span class="name" style="margin-right:80px;">City</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="city" class="textbox" placeholder="City"/>
    <span class="name" style="margin-right:77px;">Pincode</span><asp:TextBox style="margin-right:20px;" runat="server" ID="pincode" class="textbox" placeholder="Pincode"/><br /><br />
    <br />
    <span><asp:Button runat="server" class="submit" Text="update" /></span><br /><br />
    </div>



</asp:Content>