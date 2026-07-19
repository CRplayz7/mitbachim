<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteUser.aspx.cs" Inherits="DeleteUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%=pageNameForAdmin %><%=pageNameForUser %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <form id="myForm" action="" method="post">
        <table class="formTable">
            <tr>
                <td colspan="2" style="text-align:center">
                    <span style="color: #d41313; font-weight: bold; line-height: 35px; padding-bottom: 20px;">שימו ❤︎⁠: לא ניתן לשחזר משתמש שנמחק!<%=adminMsgDelete %></span>
                </td>
            </tr>
            <%=adminUI_ForDelete %>
            <tr>
                <td class="formTableInput" colspan="2" style="text-align: center;">
                    <input type="submit" value="מחיקה" name="mySubmit" class="deleteButton" style="width: 45%;" />
                    <input type="reset" value="ניקוי" class="formButton" style="width: 45%;" />
                </td>
            </tr>
        </table>
        <br />
    </form>
</asp:Content>

