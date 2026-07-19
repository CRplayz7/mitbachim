using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool loggedAdmin = Session["isAdmin"] != null && (bool)Session["isAdmin"] == true;
        bool loggedUser = Session["isUser"] != null && (bool)Session["isUser"] == true;

        if (loggedAdmin || loggedUser)
        {
            Session["message"] = "אינך יכול להתחבר כאשר הינך מחובר לחשבון משתמש או מנהל. התנתק כדי להתחבר לחשבון אחר.";
            Response.Redirect("Message.aspx");
        }

        if (Request.Form["mySubmit"] != null)
        {
            string uName_c = Request.Form["uName"];
            string pass1_c = Request.Form["pass1"];

            string sqlSelectQuery = string.Format("SELECT uName, manager FROM Table1 WHERE (uName = '{0}' AND pass1 = '{1}')", uName_c, pass1_c);
            //            SELECT uName, pass1
            //FROM Table1
            //WHERE(uName = '12') AND(pass1 = 'ab')

            bool found = MyAdoHelperAccess.IsExist(sqlSelectQuery);
            if (found)
            {
                DataTable dt = MyAdoHelperAccess.ExecuteDataTable(sqlSelectQuery);
                bool isAdmin = (bool)(dt.Rows[0]["manager"]);
                Session["userName"] = Request.Form["uName"];
                
                if (isAdmin)
                {
                    Session["isAdmin"] = true;
                }
                else
                {
                    Session["isUser"] = true;
                }
                Session["message"] = "התחברת בהצלחה! <br/> <br/> <div class='button' style='width: 100%; margin: 0 auto'><a href = 'Default.aspx' >לדף הבית</a></div>";
            }
            else
            {
                Session["isUser"] = false;
                Session["message"] = "לא נמצא חשבונך.";
            }
            Response.Redirect("Message.aspx");
        }
    }
}