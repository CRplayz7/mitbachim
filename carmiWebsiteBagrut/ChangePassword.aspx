<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    שינוי הסיסמה שלך
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script type="text/javascript">
        
        // ===== בדיקה ראשית לפני שליחה =====
        function validateRegistrationChangePass() {

            var message = "";// משתנה לריכוז הודעות השגיאה
            var errorList = document.getElementById("errorList");
            var summary = document.getElementById("errorSummary");

            // איפוס תצוגת השגיאות לפני תחילת בדיקה חדשה
            errorList.innerHTML = "";
            summary.style.display = "none";


            //שליפת הסיסמה ובדיקת תקינותה
            var pass1_m = document.getElementById("pass1").value;

            if (pass1_m.length < 6)
                message += "<li>חובה להזין סיסמה באורך 6 תווים לפחות.</li>";


            // אם המשתנה message אינו ריק - נמצאו שגיאות
            if (message.length > 0) {
                errorList.innerHTML = message; // הצגת כל השגיאות ברשימה
                summary.style.display = "block";// הצגת תיבת השגיאות למשתמש
                window.scrollTo(0, 0); // קפיצה לראש העמוד כדי שיראו את השגיאות
                return false; // מחזיר false כדי למנוע את שליחת הטופס לשרת
            }

            return true;// הטופס תקין - השליחה תתבצע
        }
    </script>

    <!-- אזור הודעות שגיאה - נשאר מוסתר כל עוד הטופס תקין -->
    <div id="errorSummary" style="display: none; padding: 10px; margin-bottom: 20px; border: 1px solid #d41313; border-radius: 5px;">
        <p style="color: #d41313; font-weight: bold; margin-top: 0;">כדי להשלים את שינוי הסיסמה, עליך לתקן את השגיאות הבאות:</p>
        <ul id="errorList" style="color: #d41313; direction: rtl; text-align: right;">
            <!-- השגיאות יוזרקו לכאן באמצעות JavaScript -->
        </ul>
    </div>

    <form id="myForm" action="" method="post" onsubmit="return validateRegistrationChangePass()">
        <table class="formTable">
            <tr>
                <td class="formTableName">הסיסמה החדשה
                </td>
                <td class="formTableInput">
                    <input type="password" id="pass1" name="pass1" />
                </td>
            </tr>
            <tr>
                <td class="formTableInput" colspan="2" style="text-align: center">
                    <input type="submit" value="סיום" name="mySubmit" class="formButton" />
                    <input type="reset" value="ניקוי" class="formButton" />
                </td>
            </tr>
        </table>
        <br />
    </form>
</asp:Content>

