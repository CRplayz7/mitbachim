<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    התחברות
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <form id="signup" action="" method="post">
        <table class="formTable">
            <tr>
                <td colspan="2" style="text-align: center" class="textPiece">אין לך עדיין חשבון? <a href="Signup.aspx">הירשם!</a>
                </td>
            </tr>
            <tr>
                <td class="formTableName">שם משתמש
                </td>
                <td class="formTableInput">
                    <input type="text" id="uName" name="uName" />
                </td>
            </tr>
            <tr>
                <td class="formTableName">סיסמה
                </td>
                <td class="formTableInput">
                    <input type="password" id="pass1" name="pass1" dir="ltr"/>
                </td>
            </tr>
            <tr>
                <td class="formTableInput" colspan="2" style="text-align: center">
                    <input type="submit" value="התחברות" name="mySubmit" class="formButton" />
                    <input type="reset" value="ניקוי" class="formButton" />
                </td>
            </tr>
        </table>
        <br />
    </form>
</asp:Content>

