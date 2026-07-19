<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    היי, ברוכים הבאים לאתר!
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="text-align:center;">
        <img src="images/balcony.png" class="introductionImage" />
    </div>
    <div style="width: 100%; text-align:center;">
        <p class="introductionParagraph">
            ישראל היא מדינה מדהימה עם כל כך הרבה עדות ותרבויות שחיות יחד תחת קורת גג אחת. אחד הדברים הכי יפים בזה? <b>האוכל!</b>
            כל עדה הביאה איתה מטבח שלם עם טעמים, ריחות ומסורות משלה
            באתר זה תוכלו לטייל בין המטבחים של עדות שונות ולגלות מאכלים שאולי מעולם לא הכרתם. אז בואו נתחיל לגלות!
        </p>
    </div>
    <%=defaultLogin %>
    <br />
    <br />
</asp:Content>

