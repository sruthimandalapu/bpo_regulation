<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_employee_particulars.aspx.cs" Inherits="WebApplication1.admin_emp_particulars" %>

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


    <asp:Button runat="server" ID="new_employees" OnClick="new_emp_Click" class="submit" Text="NEW EMPLOYEES" Style="margin-left: 600px;" />
    <asp:Button runat="server" ID="all_employees" OnClick="all_emp_Click" class="submit" Text="ALL EMPLOYEES" />
    


    <asp:ListView ID="ListView1" runat="server">
    <LayoutTemplate> 
            <table runat="server">
                <tr>
                    <th>FIRST NAME</th>
                    <th>LAST NAME</th>
                    <th>EMAIL ID</th>
                    <th>DATE OF BIRTH</th>
                    <th>CONTACT NUMBER</th>
                    <th>GENDER</th>
                    <th>EDIT</th>
                    <th>DELETE</th>
                </tr>
                <tr id="itemPlaceHolder" runat="server">
                </tr>
            </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr>
            <td><%#DataBinder.Eval(Container,"DataItem.first_name") %>           
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.last_name") %>   
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.email") %>
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.date_of_birth")    %>           
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.contact_number") %>
            </td>
            <td><%#DataBinder.Eval(Container,"DataItem.gender") %>
            </td>
            <td><asp:LinkButton runat="server" ID="reply" OnClick="edit_Click" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id")%>'><i style="color:rgba(0,0,0,0.4);padding-left:20px;" class="fas fa-pen"></i>
            </td></asp:LinkButton>
            <td><asp:LinkButton runat="server" ID="delete" OnClick="delete_Click" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id")%>'><i style="color:rgba(0,0,0,0.4);padding-left:20px;" class="fas fa-trash"></i>
            </td></asp:LinkButton>
        </tr>
    </ItemTemplate>
    </asp:ListView>




</asp:Content>
