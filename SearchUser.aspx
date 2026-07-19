<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchUser.aspx.cs" Inherits="SearchUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    חיפוש משתמש
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="text-align: center; margin: 0 auto; width: 80%;">
        <h3>כל המשתמשים</h3>
        <div style="text-align:center;">
            <form name="search_all" class="formTable" method="post" action="" style="text-align:center;">
                <input type="submit" name="submit_all" class="formButton" style="width: 300px;" value="הצגת כל המשתמשים" />
            </form>
        </div>
        <br />
        <br />
        <h3>לפי קידומת טלפון</h3>
        <div>
            <form name="search_kidomet" class="formTable" method="post" action="" style="text-align:center;">
                <select class="formTableSelect" id="phoneKidomet" name="phoneKidomet" style="width: 60%">
                    <option value="" disabled selected hidden>בחר קידומת טלפון...</option>
                    <option value="050">050</option>
                    <option value="051">051</option>
                    <option value="052">052</option>
                    <option value="053">053</option>
                    <option value="054">054</option>
                    <option value="055">055</option>
                    <option value="058">058</option>
                </select>
                <br />
                <br />
                <input type="submit" name="submit_kidomet" class="formButton" style="width: 300px;" value="הצגה לפי קידומת טלפון" />
            </form>
        </div>
        <br />
        <br />
        <h3>לפי שם פרטי</h3>
        <div style="text-align:center;">
            <form name="search_fName" class="formTable" method="post" action="" style="text-align:center;">
                <input type="text" id="fName" name="fName" class="formTableInput" style="width: 60%" />
                <br />
                <br />
                <input type="submit" name="submit_fName" class="formButton" style="width: 300px;" value="הצגה לפי שם פרטי" />
            </form>
        </div>
    </div>
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <div style="text-align: center; overflow-x: auto; width: 90%; margin: 0 auto; padding: 0 10px; max-width: 95vw">
        <h4 style="color: #d41313; font-size:20px;"><%=adminMsg %></h4>
        <table border='1' class="dataTable">
            <%=userList %>
        </table>
        <br />
    </div>
</asp:Content>
