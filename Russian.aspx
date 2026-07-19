<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Russian.aspx.cs" Inherits="Russian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    המטבח הרוסי
    <br />
    <img src="images/russia.png" height="20" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <p>
        המטבח של יהודים שחיו באזור רוסיה וסביבה הוא חלק ממטבח אשכנזי‑מזרח‑אירופי רחב. הוא כולל תבשילי בשר וירקות שורש, מרקים עבים כמו בורשט או חמין בגרסאות מקומיות, מאפיות ורולים ממולאים וכן מנות של דגים ובשרים אפויים. מאכלים אלו נבדלים בפשטות החומרים אך בעומק הטעמים שהם מספקים.
    </p>
    <br />
    <img src="images/russianFood.jpg" class="cuisineImg" onmouseenter="startEffect(this)" onmouseleave="stopEffect(this)"/>
    <br />
    <p>
        בעיקר בשבת וחגים מכינים מנות כמו חמין, כופתאות, פריקנדלים וסוגי לחמים שונים. המטבח מייצג את האקלים הקר והחיים הקשים של יהודי מזרח אירופה, והוא שומר על ערכי נוחות, שובע וחום משפחתי סביב שולחן הארוחה.
    </p>
</asp:Content>
