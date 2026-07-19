using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["isUser"] == null || (bool)Session["isUser"] == false) && (Session["isAdmin"] == null || (bool)Session["isAdmin"] == false))
        {
            Session["message"] = "אין לך הרשאת צפיה.<br/>התחבר כדי לצפות בדף זה.";
            Response.Redirect("Message.aspx");
        }

        if (Session["isAdmin"] != null && (bool)Session["isAdmin"] == true)
        {
            Response.Redirect("AdminPanel.aspx");
            return;
        }

        if (Request.Form["mySubmit"] != null)
        {
            string uName_c = (string)Session["userName"];

            string pass1_c = Request.Form["pass1"];

            string mySQL = String.Format("UPDATE Table1 SET pass1 = '{0}' WHERE(uName = '{1}')", pass1_c, uName_c);

            int rows = MyAdoHelperAccess.RowsAffected(mySQL);
            if (rows > 0)
            {
                Session["message"] = String.Format("הסיסמה של המשתמש {0} שונתה בהצלחה!", uName_c);
            }
            else
            {
                Session["message"] = String.Format("לא נמצאה רשומה עם שם המשתמש{0}.<br/>הסיסמה לא עודכנה.", uName_c);

            }
            Response.Redirect("Message.aspx");

            //                UPDATE Table1
            //SET fName = 'bublik'
            //WHERE(uName = 'abc')
        }
    }
}