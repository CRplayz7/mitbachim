using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool isAdmin = Session["isAdmin"] != null && (bool)Session["isAdmin"] == true;
        bool isUser = Session["isUser"] != null && (bool)Session["isUser"] == true;

        if (!isAdmin && !isUser)
        {
            Session["message"] = "אינך יכול להתנתק כאשר אינך מחובר לחשבון משתמש או מנהל";
            Response.Redirect("Message.aspx");
        }
        Session.Abandon();
        Response.Redirect("SignIn.aspx");
    }
}