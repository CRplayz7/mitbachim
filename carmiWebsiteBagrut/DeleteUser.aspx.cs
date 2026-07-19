using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteUser : System.Web.UI.Page
{
    public string msg = "";
    public string adminUI_ForDelete = "";
    public string pageNameForUser = "";
    public string pageNameForAdmin = "";
    public string adminMsgDelete = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["isUser"] == null || (bool)Session["isUser"] == false) && (Session["isAdmin"] == null || (bool)Session["isAdmin"] == false))
        {
            // השמת הודעת שגיאה במשתנה Session
            Session["message"] = "אין לך הרשאת צפיה.<br/>התחבר כדי לצפות בדף זה.";

            Response.Redirect("Message.aspx");
        }

        if (Session["isAdmin"] != null && (bool)Session["isAdmin"] == true)
        {
            Response.Redirect("AdminPanel.aspx");
            return;
        }

        if (Session["isUser"] != null && (bool)Session["isUser"] == true)
        {
            pageNameForUser = "מחיקת המשתמש שלך";
        }

        if (Request.Form["mySubmit"] != null)
        {
            string uName_c = (string)Session["userName"];

            string fileName = "Database.accdb";   //שם הקובץ
            string path = HttpContext.Current.Server.MapPath("App_Data/");//מיקום מסד בפורוייקט
            path += fileName;

            string connString = "Provider=Microsoft.ACE.OLEDB.12.0;Data source=" + path;//נתוני ההתחברות הכוללים מיקום וסוג המסד

            OleDbConnection conn = new OleDbConnection(connString);

            string tableName = "Table1"; //שם הטבלה
            string sql = string.Format("DELETE FROM {0} WHERE (uName = '{1}')", tableName, uName_c);

            OleDbCommand com = new OleDbCommand(sql, conn);
            conn.Open();

            int rows = com.ExecuteNonQuery();

            com.Dispose();
            conn.Close();

            if (Session["isUser"] != null && (bool)Session["isUser"] == true)
            {
                Session["message"] = "חשבונך נמחק בהצלחה.<br/> <br/> <div class='button' style='width: 100%; margin: 0 auto'><a href = 'SignIn.aspx' >להתחברות</a></div>";
                
                Session["isUser"] = false;
                Session["isAdmin"] = false;
                Session["userName"] = null;

                Response.Redirect("Message.aspx");
            }

            if (rows == 1)
            {
                msg = String.Format("רשומה אחת נמחקה.");
            }
            else
            {
                msg = String.Format("לא נמצאה רשומה עם שם המשתמש {0}.<br/>לא נמחקה אף רשומה.", uName_c);
            }

            msg += "<br/> <br/> <div class='button' style='width: 100%; margin: 0 auto'><a href = 'DeleteUser.aspx' >למחיקת משתמש נוסף</a></div><br/><div class='button' style='width: 100%; margin: 0 auto'><a href = 'SearchUser.aspx' > לחיפוש משתמש</a></div>";
            Session["message"] = msg;
            Response.Redirect("Message.aspx");
        }
    }
}