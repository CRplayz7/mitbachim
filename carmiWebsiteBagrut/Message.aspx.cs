using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["message"] == null)
        {
            // אפשר להפנות חזרה לדף הבית אם אין הודעה
            Response.Redirect("Default.aspx");
        }
        else if (((string)Session["message"]).Contains("חשבונך נמחק בהצלחה"))
        {
            Session.Abandon();
        }
    }
}