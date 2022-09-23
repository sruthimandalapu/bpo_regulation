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
  cursor:pointer;
}
button{
  width: 16%;
  margin-left: 5px;
}
.message{
    margin-left:330px;
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
    <span class="name" style="margin-right:52.5px;">First Name</span><asp:TextBox style="margin-top:20px;margin-right:20px; " runat="server" ID="first_name" class="textbox" placeholder="First Name"/>
    <span class="name" style="margin-right:35.5px;">Last Name</span><asp:TextBox style="margin-top:20px;margin-right:20px; " runat="server" ID="last_name" class="textbox" placeholder="Last Name"/><br /><br />
    <span class="name" style="margin-right:92px;">Email</span><asp:TextBox style="margin-right:20px;width: 30%;border: 1px solid rgba(0, 0, 0, 0.1);
  height: 10px;
  padding:20px;
  border-radius:40px;
  font-family: 'Josefin Sans', sans-serif; 
  font-size:16px;
  color:rgba(0,0,0,0.45);" runat="server" ID="email" class="textbox" type="email" placeholder="Email" />
    <span class="name" style="margin-right:20px;">Date of Birth</span><asp:TextBox style="margin-right:20px;" runat="server" ID="date_of_birth" onfocus="(this.type='date')" class="textbox" placeholder="Date of Birth"/><br /><br />
    <span class="name" style="margin-right:14px;">Contact Number</span><asp:TextBox style="margin-right:20px;" runat="server" ID="contact_number" class="textbox" type="number" placeholder="Contact Number"/>
    <span class="name" style="margin-right:60px;">Gender</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="gender" class="textbox" placeholder="Gender"/><br /><br />
    <span class="name" style="margin-right:98px;">State</span><asp:TextBox style="margin-right:20px;" runat="server" ID="state" class="textbox" placeholder="State"/>
    <span class="name" style="margin-right:83px;">City</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="city" class="textbox" placeholder="City"/><br /><br />
    <span class="name" style="margin-right:93px;">Street</span><asp:TextBox style="margin-right:20px;"  runat="server" ID="street" class="textbox" placeholder="Street"/>
    <span class="name" style="margin-right:55px;">Pincode</span><asp:TextBox style="margin-right:20px;" runat="server" ID="pincode" class="textbox" placeholder="Pincode"/><br /><br />
    <br />
    <span><asp:Button runat="server" class="submit" OnClick="edit_Click" Text="update" /></span><br /><br />
    </div>



</asp:Content>