<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_issues_raised.aspx.cs" Inherits="WebApplication1.admin_emp_feedback" %>

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
    </style>



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




</asp:Content>
