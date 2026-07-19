using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string lowerMenu = "";
    public string upperMenu = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        bool isAdmin = Session["isAdmin"] != null && (bool)Session["isAdmin"];
        bool isUser = Session["isUser"] != null && (bool)Session["isUser"];

        // סוג המשתמש
        if (isAdmin)
            Session["TypeOfUser"] = string.Format("{0} (מנהל)", Session["userName"]);
        else if (isUser)
            Session["TypeOfUser"] = Session["userName"];
        else
            Session["TypeOfUser"] = "אורח";

        // קישורים ראשיים
        string menuLinks = "";
        if (isAdmin)
            menuLinks = "<a href=\"SignOut.aspx\">התנתקות</a> | <a href=\"SearchUser.aspx\">חיפוש משתמש</a> ✦ <a href=\"AdminPanel.aspx\">פאנל ניהול</a>";
        else if (isUser)
            menuLinks = "<a href=\"SignOut.aspx\">התנתקות</a> | <a href=\"SearchUser.aspx\">חיפוש משתמש</a> ✦ <a href=\"ChangePassword.aspx\">שינוי הסיסמה שלך</a> ✦ <a href=\"DeleteUser.aspx\">מחיקת המשתמש שלך</a>";
        else
            menuLinks = "<a href=\"Signin.aspx\">התחברות/הרשמה</a>";

        // תמיד מוסיפים מפת אתר
        menuLinks += " | <a href=\"Sitemap.aspx\">מפת אתר</a>";
        lowerMenu += "<tr><td class=\"LowerMenu\" colspan=\"3\">" + menuLinks + "</td></tr>";

        // קישורי העדות
        string edotMenu = "";

        // ארבע הראשונות תמיד
        edotMenu += " ✦ <a href=\"Italian.aspx\">איטלקי</a>";
        edotMenu += " ✦ <a href=\"Ethiopian.aspx\">אתיופי</a>";
        edotMenu += " ✦ <a href=\"Greek.aspx\">יווני</a>";
        edotMenu += " ✦ <a href=\"Moroccan.aspx\">מרוקאי</a>";

        // השאר – רק למשתמשים מחוברים
        if (isAdmin || isUser)
        {
            edotMenu += " ✦ <a href=\"Polish.aspx\">פולני</a>";
            edotMenu += " ✦ <a href=\"Persian.aspx\">פרסי</a>";
            edotMenu += " ✦ <a href=\"Russian.aspx\">רוסי</a>";
            edotMenu += " ✦ <a href=\"Yemeni.aspx\">תימני</a>";
        }
        else
        {
            // אורח רואה הודעה במקום
            edotMenu += " ✦ <span style=\"color:#9c7954; font-weight:500;\">התחבר כדי לגשת לעוד דפים...</span>";
        }

        upperMenu += edotMenu;



        if (Session["firstLogin"] == null)
        {
            Application.Lock();
            if (Application["myCount"] == null)
            {
                Application["myCount"] = 0;
            }
            Application["myCount"] = (int)Application["myCount"] + 1;
            Application.UnLock();

            Session["firstLogin"] = true;
        }
    }
}
