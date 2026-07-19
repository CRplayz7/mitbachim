<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Italian.aspx.cs" Inherits="Italian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    המטבח האיטלקי
    <br />
    <img src="images/italy.png" height="20" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <p>
        המטבח היהודי האיטלקי הוא חלק מקולינריית יהודי ים‑תיכון ונחשב תוצר של אורחות החיים של הקהילות היהודיות באיטליה לאורך מאות שנים. הוא שואב רבות מהמטבח המקומי האיטלקי, עם דגש על שמן זית, עשבי תיבול, אורז ופסטה, ירקות טריים ומאפים מסורתיים. למשל, גרסאות יהודיות למנות איטלקיות מסורתיות כמו פסטיצ'ו של פולנטה או מאפי בוריקה ממולאים הן חלק בלתי נפרד מהמטבח הזה, והשפעות ספרדיות מהמגורשים לאחר גירוש ספרד שותפות לו גם הן.
    </p>
    <br />
    <img src="images/italianFood.jpg" class="cuisineImg" onmouseenter="startEffect(this)" onmouseleave="stopEffect(this)"/>
    <br />
    <p>
        בשבת ובחגים המטבח מביא לידי ביטוי מנות איטלקיות‑יהודיות מיוחדות, כמו רבקה (מנה של אורז עם תבלינים), חמין מקומי בגרסאות שונות וכיכרות לחם מתוק לחג. האופייה הייחודי של המטבח האיטלקי נובע מהמפגש בין המסורת היהודית והמטבח הים‑תיכוני המקומי, יחד עם שמירה על כלל הכשרות, מה שמוביל למנות שמשלבות טעמים עשירים אך גם פרקטיים וטעמי בית.
    </p>
</asp:Content>

