<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin_issues_raised.aspx.cs" Inherits="WebApplication1.admin_issues_raised1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
        }

            .submit:hover {
                background-color: #f3f5f9;
            }
            .submit1{
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
            .message{
    margin-left:220px;
    color:rgba(0,0,0,0.25);
    font-family: 'Josefin Sans', sans-serif; 
}
    </style>

    
    <asp:PlaceHolder runat="server" ID="issues">
    <asp:ListView ID="ListView1" runat="server">
    <LayoutTemplate> 
            <table runat="server">
                <tr>
                    <th>EMP NAME</th>
                    <th>EMP MAIL</th>
                    <th>ISSUE ABOUT</th>
                    <th>ISSUE DESCRIPTION</th>
                    <th>STATUS</th>
                    <th>REPLY</th>
                </tr>
                <tr id="itemPlaceHolder" runat="server">
                </tr>
            </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr>
            <td><%#DataBinder.Eval(Container,"DataItem.emp_name") %>           
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.emp_mail") %>           
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.issue_about") %>           
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.describe_issue") %>
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.status") %>
            </td>
            <td><asp:LinkButton runat="server" ID="reply" OnClick="reply_Click" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id")%>'><i style="color:rgba(0,0,0,0.4);" class="fas fa-reply"></i>
            </asp:LinkButton></td>
        </tr>
    </ItemTemplate>
    </asp:ListView>
    </asp:PlaceHolder>


    <asp:PlaceHolder runat="server" ID="reply">
        <div class="drop">
        <br />
    <asp:Label class="message" ID="message" runat="server" /><br /><br /><br />

    <asp:Label style="margin-left:50px;font-size:17px;" class="message" ID="Label1" runat="server" Text="Employee Mail Id" />
    <asp:TextBox runat="server" style="margin-left:30px;" ID="emp_email_id" class="textbox" placeholder="Employee Email ID" type="email" disabled/><br /><br />
    <textarea type="text" style="resize:none;height:100px;width:570px;border-radius:35px;" runat="server" ID="comments" class="textbox" placeholder="Comments" required></textarea><br /><br />
    <span><asp:Button runat="server" class="submit1" Text="submit" OnClick="reply1_Click"/></span><br /><br />
    <a href="admin_issues_raised"><p style="line-height:20px;margin-left:220px;color:rgba(0,0,0,0.3);" id="bot">Get back to Issues!</p></a>
    </div>
    </asp:PlaceHolder>




</asp:Content>
