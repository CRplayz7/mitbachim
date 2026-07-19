<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Polish.aspx.cs" Inherits="Polish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    המטבח הפולני
    <br />
    <img src="images/poland.png" height="20" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <p>
        המטבח היהודי הפולני משתייך למסורת האשכנזית של קהילות יהודיות במרכז ומזרח אירופה. הוא מתאפיין במנות מחממות המתאימות לאקלים הקר, כמו מרקים עבים, חמין וסיר ארוכים, כופתאות ממולאות ותבשילי בשר עם ירקות שורש ותפוחי אדמה. דגים כבושים וסוגי לחמים פופולריים הם חלק בלתי נפרד מהמטבח הזה.
    </p>
    <br />
    <img src="images/polishFood.jpg" class="cuisineImg" onmouseenter="startEffect(this)" onmouseleave="stopEffect(this)"/>
    <br />
    <p>
        שבת וחגים מביאים לשולחן מנות כמו חמין עם בשר ואורז, קוגל תפוחי אדמה או אטריות, וסוגים שונים של מאפים ומתוקים. המאכלים מבוססים על חומרי גלם זמינים ועונתיים, ודרך ההכנה הארוכה מעניקה טעמים עשירים ומרקמים מחזקים, המשמשים חלק מהתרבות המשפחתית והקהילתית במשך דורות.
    </p>
</asp:Content>
