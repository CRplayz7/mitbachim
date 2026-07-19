using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Persian : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["isUser"] == null || (bool)Session["isUser"] == false) && (Session["isAdmin"] == null || (bool)Session["isAdmin"] == false))
        {
            Session["message"] = "אין לך הרשאת צפיה.<br/>התחבר כדי לצפות בדף זה.";
            Response.Redirect("Message.aspx");
        }
    }
}