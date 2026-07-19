<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Greek.aspx.cs" Inherits="Greek" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    המטבח היווני
    <br />
    <img src="images/greece.png" height="20" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <p>
        היהודים שחיו ביוון פיתחו מטבח שמשלב מסורות ים‑תיכוניות עם שימוש בדגים טריים, שמן זית, עשבי תיבול ירוקים וירקות קלויים.
        מאפים תפוחים ושימוש בתבלינים מקומיים כמו זעתר ושום מופיעים רבות במנות גריל, תבשילים ודגים אפויים.
        המטבח היהודי היווני מושפע מאוד ממטבחי הים‑התיכון והבלקן,
        ומאכלים רבים דומים לאלה של שכניהם היוונים אך מותאמים לכשרות ולמסורת היהודית.
    </p>
    <br />
    <img src="images/greekFood.jpg" class="cuisineImg" onmouseenter="startEffect(this)" onmouseleave="stopEffect(this)"/>
    <br />
    <p>
        בחגים ובאירועים מיוחדים מוגשים מאפים ממולאים,
        מנות דגים חגיגיות וסלטים עשירים בשמן זית ולימון.
        התרבות היוונית‑יהודית משלבת טעמים מלוחים ומתוקים,
        כמו בצאיזיקיה המבוסס על חצילים וגבינה או בגלוקטובוריקו המתוק,
        מה שנותן למטבח הזה ייחודיות בטעמים של הים‑תיכון המערבי.
    </p>
</asp:Content>
