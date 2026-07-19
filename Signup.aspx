<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    הרשמה
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script type="text/javascript">

        //בדיקה שהשדה לא ריק
        function isNotEmpty(str) {
            return str.trim().length > 0;
        }

        // בדיקה שאין ספרות במחרוזת
        function noDigits(str) {
            for (var i = 0; i < str.length; i++) {
                if (str.charAt(i) >= '0' && str.charAt(i) <= '9')
                    return false;
            }
            return true;
        }

        // בדיקה שמחרוזת מורכבת מספרות בלבד
        function onlyDigits(str) {
            for (var i = 0; i < str.length; i++) {
                if (str.charAt(i) < '0' || str.charAt(i) > '9')
                    return false;
            }
            return true;
        }

        // בדיקת סימנים אסורים
        function checkWarningSigns(str) {
            var warningSigns = '"!@#$%^&*(){}[];~';
            var warningSigns2 = "'-+:. ?/<>\\";
            for (var i = 0; i < str.length; i++) {
                if (warningSigns.indexOf(str.charAt(i)) != -1 || warningSigns2.indexOf(str.charAt(i)) != -1)
                    return false;
            }
            return true;
        }

        // מחזירה אמת אם המייל מכיל @ ונקודה אחריו במקום תקין
        function checkEmail(email) {
            var atIndex = email.indexOf("@");
            if (atIndex <= 0) return false;
            var dotIndex = email.indexOf(".", atIndex);
            if (dotIndex == -1 || dotIndex == email.length - 1) return false;
            return true;
        }

        // מחזירה אמת אם השנה מוגדרת וטווח הגילאים הוא בין 1 ל-120
        function checkYearOfBirth(year) {
            if (!onlyDigits(year)) return false;
            var y = parseInt(year);
            var currentYear = new Date().getFullYear();
            return (y >= currentYear - 120 && y <= currentYear - 1);
        }

        //בדיקת כפתורי רדיו
        function checkRadio(radioName) {
            var radios = document.getElementsByName(radioName);
            for (var i = 0; i < radios.length; i++) {
                if (radios[i].checked) {
                    return true; // נמצא כפתור מסומן
                }
            }
            return false; // אף כפתור לא מסומן
        }

        //בדיקת תיבות סימון
        function checkBoxes(boxName) {
            var boxes = document.getElementsByName(boxName);
            for (var i = 0; i < boxes.length; i++) {
                if (boxes[i].checked) {
                    return true; // נמצאה לפחות תיבה אחת מסומנת
                }
            }
            return false; // אף תיבה לא מסומנת
        }




        // ===== בדיקה ראשית לפני שליחה =====
        function validateRegistration() {

            var message = "";// משתנה לריכוז הודעות השגיאה
            var errorList = document.getElementById("errorList");
            var summary = document.getElementById("errorSummary");

            // איפוס תצוגת השגיאות לפני תחילת בדיקה חדשה
            errorList.innerHTML = "";
            summary.style.display = "none";


            // שליפת ערך השם הפרטי ובדיקת תקינותו
            var fName_m = document.getElementById("fName").value;

            if (!isNotEmpty(fName_m))
                message += "<li>חובה להזין שם פרטי.</li>";
            else if (!noDigits(fName_m) || !checkWarningSigns(fName_m))
                message += "<li>שם פרטי חייב להכיל אותיות בלבד.</li>";


            // שליפת ערך שם המשפחה ובדיקת תקינותו
            var lName_m = document.getElementById("lName").value;

            if (!isNotEmpty(lName_m))
                message += "<li>חובה להזין שם משפחה.</li>";
            else if (!noDigits(lName_m) || !checkWarningSigns(lName_m))
                message += "<li>שם משפחה חייב להכיל אותיות בלבד.</li>";


            //שליפת ערך שם המשתמש ובדיקת תקינותו
            var uName_m = document.getElementById("uName").value;

            if (!isNotEmpty(uName_m))
                message += "<li>חובה להזין שם משתמש.</li>";
            else if (!checkWarningSigns(uName_m))
                message += "<li>שם משתמש יכול להכיל אך ורק אותיות, מספרים וקו תחתון.</li>";


            //שליפת ערך הדוא"ל ובדיקת תקינותו
            var mail_m = document.getElementById("mail").value;

            if (!isNotEmpty(mail_m))
                message += '<li>חובה להזין כתובת דוא"ל.</li>';
            else if (!checkEmail(mail_m))
                message += '<li>כתובת הדוא"ל אינה תקינה.</li>';


            // בדיקה שקידומת הטלפון לא ריקה (כי יש אופציה שתהיה ריקה בגלל הplaceholder)
            var phoneKidomet_m = document.getElementById("phoneKidomet").value;

            if (!isNotEmpty(phoneKidomet_m))
                message += "<li>חובה לבחור קידומת טלפון.</li>";


            // בדיקה שהטלפון מכיל ספרות בלבד ובאורך המדויק (7 ספרות)
            var phoneNum_m = document.getElementById("phoneNum").value;

            if (!isNotEmpty(phoneNum_m))
                message += "<li>חובה להזין מספר טלפון.</li>";

            else if (!onlyDigits(phoneNum_m) || phoneNum_m.length != 7)
                message += "<li>מספר הטלפון חייב להכיל 7 ספרות בדיוק (לא כולל קידומת).</li>";


            //שליפת הסיסמה ובדיקת תקינותה
            var pass1_m = document.getElementById("pass1").value;


            if (pass1_m.length < 6)
                message += "<li>חובה להזין סיסמה באורך 6 תווים לפחות.</li>";


            //שליפת אימות הסיסמה
            var passCheck_m = document.getElementById("passCheck").value;

            // בדיקה שהסיסמה והאימות זהים לחלוטין
            if (pass1_m != passCheck_m)
                message += "<li>הסיסמה חייבת להיות זהה לאימות הסיסמה.</li>";


            //שליפת שנת הלידה ובדיקת תקינותה
            var yearOfBirth_m = document.getElementById("yearOfBirth").value;

            if (!isNotEmpty(yearOfBirth_m))
                message += "<li>חובה להזין שנת לידה.</li>";
            else if (!checkYearOfBirth(yearOfBirth_m))
                message += "<li>שנת לידה אינה הגיונית - על גילך להיות בין 1 ל-120.</li>";


            //--- בדיקת מין (Radio) ---
            if (!checkRadio("sex"))
                message += "<li>חובה לבחור מין.</li>";


            // --- בדיקת עדות (Checkbox) ---
            if (!checkBoxes("eda"))
                message += "<li>חובה לבחור לפחות עדה אחת מהרשימה.</li>";


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

    <form id="myForm" name="myForm" action="" method="post" onsubmit="return validateRegistration()">

        <!-- אזור הודעות שגיאה - נשאר מוסתר כל עוד הטופס תקין -->
        <div id="errorSummary" style="display: none; padding: 10px; margin-bottom: 20px; border: 1px solid #d41313; border-radius: 5px;">
            <p style="color: #d41313; font-weight: bold; margin-top: 0;">כדי להשלים את ההרשמה, עליך לתקן את השגיאות הבאות:</p>
            <ul id="errorList" style="color: #d41313; direction: rtl; text-align: right;">
                <!-- השגיאות יוזרקו לכאן באמצעות JavaScript -->
            </ul>
        </div>

        <table class="formTable">
            <tr>
                <td colspan ="2" style="text-align: center; color: #d41313; font-weight:bold; line-height:30px;" class="textPiece">
                    כוכבית (*) מציינת שדה שאי אפשר לדלג עליו
                    <br />
                    <span style="color: black; font-weight:normal;">כבר יש לך חשבון? <a href="Signin.aspx">התחבר!</a></span>
                </td>
            </tr>
            <tr>
                <td class="formTableName">שם פרטי<span class="requiredField">*</span>
                </td>
                <td class="formTableInput">
                    <input type="text" id="fName" name="fName" />
                </td>
            </tr>
            <tr>
                <td class="formTableName">שם משפחה<span class="requiredField">*</span>
                </td>
                <td class="formTableInput">
                    <input type="text" id="lName" name="lName" />
                </td>
            </tr>
            <tr>
                <td class="formTableName">שם משתמש<span class="requiredField">*</span>
                </td>
                <td class="formTableInput">
                    <input type="text" id="uName" name="uName" />
                </td>
            </tr>
            <tr>
                <td class="formTableName">כתובת דוא"ל<span class="requiredField">*</span>
                </td>
                <td class="formTableInput">
                    <input type="email" id="mail" name="mail" dir="ltr" />
                </td>
            </tr>
            <tr>
                <td class="formTableName">טלפון נייד<span class="requiredField">*</span>
                </td>
                <td class="formTableSelectInput">
                    <span dir="ltr">
                        <select class="formTableSelect" id="phoneKidomet" name="phoneKidomet" style="width:55%" dir="rtl">
                            <option value="" disabled selected hidden>בחרו קידומת טלפון...</option>
                            <option value="050">050</option>
                            <option value="051">051</option>
                            <option value="052">052</option>
                            <option value="053">053</option>
                            <option value="054">054</option>
                            <option value="055">055</option>
                            <option value="058">058</option>
                        </select>
                        <input type="text" id="phoneNum" name="phoneNum" class="phoneInput" style="width:40%;"/></span>
                </td>
            </tr>
            <tr>
                <td class="formTableName">סיסמה<span class="requiredField">*</span>
                </td>
                <td class="formTableInput">
                    <input type="password" id="pass1" name="pass1" dir="ltr" />
                </td>
            </tr>
            <tr>
                <td class="formTableName">אימות סיסמה<span class="requiredField">*</span>
                </td>
                <td class="formTableInput">
                    <input type="password" id="passCheck" name="passCheck" dir="ltr" />
                </td>
            </tr>
            <tr>
                <td class="formTableName">שנת לידה<span class="requiredField">*</span>
                </td>
                <td>
                    <input type="text" id="yearOfBirth" name="yearOfBirth" />
                </td>
            </tr>
            <tr>
                <td class="formTableName">מין<span class="requiredField">*</span>
                </td>
                <td class="formTableInput">
                    <input type="radio" id="male" name="sex" dir="ltr" value="זכר" style="width: fit-content;" />
                    זכר
                <br />
                    <input type="radio" id="female" name="sex" dir="ltr" value="נקבה" style="width: fit-content;" />
                    נקבה
                </td>
            </tr>
            <tr>
                <td class="formTableName">העדות שלך<span class="requiredField">*</span>
                </td>
                <td class="formTableInput">
                    <div class="checkboxes">
                        <span class="bold">בחר את העדות שלך:</span>
                    </div>
                    <div class="checkboxes">
                        <input type="checkbox" id="eda1" name="eda" value="איטלקי" style="width: fit-content;" />איטלקי
                    </div>
                    <div class="checkboxes">
                        <input type="checkbox" id="eda2" name="eda" value="אתיופי" style="width: fit-content;" />אתיופי
                    </div>
                    <div class="checkboxes">
                        <input type="checkbox" id="eda3" name="eda" value="יווני" style="width: fit-content;" />יווני
                    </div>
                    <div class="checkboxes">
                        <input type="checkbox" id="eda4" name="eda" value="מרוקאי" style="width: fit-content;" />מרוקאי
                    </div>
                    <div class="checkboxes">
                        <input type="checkbox" id="eda5" name="eda" value="פולני" style="width: fit-content;" />פולני
                    </div>
                    <div class="checkboxes">
                        <input type="checkbox" id="eda6" name="eda" value="פרסי" style="width: fit-content;" />פרסי
                    </div>
                    <div class="checkboxes">
                        <input type="checkbox" id="eda7" name="eda" value="רוסי" style="width: fit-content;" />רוסי
                    </div>
                    <div class="checkboxes">
                        <input type="checkbox" id="eda8" name="eda" value="תימני" style="width: fit-content;" />תימני
                    </div>
                    <div class="checkboxes">
                        <input type="checkbox" id="eda9" name="eda" value="אחר" style="width: fit-content;" />אחר
                    </div>
                </td>
            </tr>
            <tr>
                <td class="formTableInput" colspan="3" style="text-align: center">
                    <div>
                        <input type="submit" value="הרשמה" name="mySubmit" class="formButton" />
                        <input type="reset" value="ניקוי" class="formButton" />
                    </div>
                </td>
            </tr>
        </table>
        <br />
    </form>
</asp:Content>

