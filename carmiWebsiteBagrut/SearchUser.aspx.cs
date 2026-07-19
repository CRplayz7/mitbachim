using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchUser : System.Web.UI.Page
{
    // מחרוזת שתכיל את קוד ה-HTML של הטבלה שתוצג בדף
    public string userList = "";
    public string adminMsg = "";

    // פעולה המתבצעת בעת טעינת הדף
    protected void Page_Load(object sender, EventArgs e)
    {
        // בדיקת הרשאות: אם המשתמש לא מחובר (לא משתמש רגיל ולא מנהל)
        if ((Session["isUser"] == null || (bool)Session["isUser"] == false) && (Session["isAdmin"] == null || (bool)Session["isAdmin"] == false))
        {
            // השמת הודעת שגיאה במשתנה Session
            Session["message"] = "אין לך הרשאת צפיה.<br/>התחבר כדי לצפות בדף זה.";

            // [CHANGE_HERE] - וודא שקיים דף בשם Message.aspx להצגת השגיאה
            Response.Redirect("Message.aspx");
        }

        // משתנה לבניית שאילתת הבחירה
        string sqlSelect = "";

        // [CHANGE_HERE] - שנה לשם הטבלה שלך במסד הנתונים
        string tableName = "Table1";

        // בדיקה אם נלחץ הכפתור להצגת כל המשתמשים
        if (Request.Form["submit_all"] != null)
        {
            // יצירת שאילתה לשליפת כל הרשומות מהטבלה
            sqlSelect = string.Format("SELECT * FROM {0}", tableName);
        }
        else
        {
            // בדיקה אם המשתמש ביצע חיפוש לפי קידומת טלפון
            if (Request.Form["submit_kidomet"] != null)
            {
                // שליפת הערך שהוזן בתיבת הטקסט של הקידומת
                string phoneKidomet_c = Request.Form["phoneKidomet"];

                // [CHANGE_HERE] - וודא ששם העמודה במסד הוא אכן phoneKidomet
                sqlSelect = string.Format("SELECT * FROM {0} WHERE(phoneKidomet = '{1}')", tableName, phoneKidomet_c);
            }
            else
            {
                // בדיקה אם המשתמש ביצע חיפוש לפי שם משתמש
                if (Request.Form["submit_fName"] != null)
                {
                    // שליפת הערך שהוזן בתיבת הטקסט של שם המשתמש
                    string fName_c = Request.Form["fName"];

                    // [CHANGE_HERE] - וודא ששם העמודה במסד הוא אכן uName
                    sqlSelect = string.Format("SELECT * FROM {0} WHERE(fName = '{1}')", tableName, fName_c);
                }
            }
        }

        // אם נוצרה שאילתת חיפוש (כלומר המשתמש לחץ על אחד מכפתורי החיפוש)
        if (sqlSelect != "")
        {
            // בדיקה האם המשתמש המחובר הוא מנהל (לצורך תצוגת עמודות רגישות)
            bool isAdmin = (Session["isAdmin"] != null && (bool)Session["isAdmin"]);

            // קריאה לפעולת העזר מהמחלקה הקודמת כדי לקבל את שורות הנתונים ב-HTML
            string str = MyAdoHelperAccess.PrintDataTable(sqlSelect, isAdmin);

            // אם נמצאו תוצאות בחיפוש
            if (str != "")
            {
                // בניית כותרות הטבלה במידה והצופה הוא מנהל (כולל סיסמה ושם משתמש)
                if (Session["isAdmin"] != null && (bool)Session["isAdmin"] == true)
                {

                    adminMsg = "הינך מנהל. יוצגו לך כאן גם שמות המשתמש והסיסמאות של כל המשתשמים.";
                    string tableHeaders = "";
                    tableHeaders += "<tr>";
                    tableHeaders += "<th>" + "שם מלא" + "</th>";
                    tableHeaders += "<th>" + "שם משתמש" + "</th>";
                    tableHeaders += "<th>" + "כתובת אימייל" + "</th>";
                    tableHeaders += "<th>" + "טלפון" + "</th>";
                    tableHeaders += "<th>" + "סיסמה" + "</th>";
                    tableHeaders += "<th>" + "שנת לידה" + "</th>";
                    tableHeaders += "<th>" + "מין" + "</th>";
                    tableHeaders += "<th>" + "עדות" + "</th>";
                    tableHeaders += "<th>" + "מנהל?" + "</th>";
                    tableHeaders += "</tr>";
                    userList += tableHeaders; // הוספת הכותרות
                    userList += str;          // הוספת הנתונים שנשלפו
                }
                // בניית כותרות הטבלה במידה והצופה הוא משתמש רגיל (פחות פרטים)
                else if (Session["isUser"] != null && (bool)Session["isUser"] == true)
                {
                    string tableHeaders = "";
                    tableHeaders += "<tr>";
                    tableHeaders += "<th>" + "שם מלא" + "</th>";
                    tableHeaders += "<th>" + "כתובת אימייל" + "</th>";
                    tableHeaders += "<th>" + "טלפון" + "</th>";
                    tableHeaders += "<th>" + "שנת לידה" + "</th>";
                    tableHeaders += "<th>" + "מין" + "</th>";
                    tableHeaders += "<th>" + "עדות" + "</th>";
                    tableHeaders += "<th>" + "מנהל?" + "</th>";
                    tableHeaders += "</tr>";
                    userList += tableHeaders; // הוספת הכותרות
                    userList += str;          // הוספת הנתונים שנשלפו
                }
            }
            else
            {
                // הודעה שתוצג במידה ואין נתונים התואמים לחיפוש
                userList = "<tr><th>לא נמצאו משתמשים המתאימים לקריטריונים.</th></tr>";
            }
        }
    }
}