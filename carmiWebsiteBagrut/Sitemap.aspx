<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sitemap.aspx.cs" Inherits="Sitemap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        מפת אתר
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
        <table style="text-align: right; width: 90%; margin: 0 auto; font-size: 20px;" class="sitemap">
                <tr>
                        <td>בית</td>
                        <td><a href="Default.aspx">Default.aspx</a></td>
                </tr>
                <tr>
                        <td>המטבח האיטלקי</td>
                        <td><a href="Italian.aspx">Italian.aspx</a></td>
                </tr>
                <tr>
                        <td>המטבח האתיופי</td>
                        <td><a href="Ethiopian.aspx">Ethiopian.aspx</a></td>
                </tr>
                <tr>
                        <td>המטבח היווני</td>
                        <td><a href="Greek.aspx">Greek.aspx</a></td>
                </tr>
                <tr>
                        <td>המטבח המרוקאי</td>
                        <td><a href="Moroccan.aspx">Moroccan.aspx</a></td>
                </tr>
                <tr>
                        <td>המטבח הפולני</td>
                        <td><a href="Polish.aspx">Polish.aspx</a></td>
                </tr>
                <tr>
                        <td>המטבח הפרסי</td>
                        <td><a href="Persian.aspx">Persian.aspx</a></td>
                </tr>
                <tr>
                        <td>המטבח הרוסי</td>
                        <td><a href="Russian.aspx">Russian.aspx</a></td>
                </tr>
                <tr>
                        <td>המטבח התימני</td>
                        <td><a href="Yemeni.aspx">Yemeni.aspx</a></td>
                </tr>
                <tr>
                        <td>הרשמה</td>
                        <td><a href="Signup.aspx">Signup.aspx</a></td>
                </tr>
                <tr>
                        <td>התחברות</td>
                        <td><a href="SignIn.aspx">SignIn.aspx</a></td>
                </tr>
                <tr>
                        <td>חיפוש משתמש</td>
                        <td><a href="SearchUser.aspx">SearchUser.aspx</a></td>
                </tr>
                <tr>
                        <td>מחיקת משתמש</td>
                        <td><a href="DeleteUser.aspx">DeleteUser.aspx</a></td>
                </tr>
                <tr>
                        <td>מפת האתר</td>
                        <td>Sitemap.aspx
            <br />
                                (הינך נמצא בדף זה)</td>
                </tr>
                <tr>
                        <td>עלינו</td>
                        <td><a href="About.aspx">About.aspx</a></td>
                </tr>
                <tr>
                        <td>שינוי סיסמה</td>
                        <td><a href="ChangePassword.aspx">ChangePassword.aspx</a></td>
                </tr>
        </table>
        <br />
</asp:Content>

