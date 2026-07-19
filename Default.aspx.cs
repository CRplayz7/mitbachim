using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public string defaultLogin = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["isUser"] == null || (bool)Session["isUser"] == false) &&
(Session["isAdmin"] == null || (bool)Session["isAdmin"] == false))
        {
            defaultLogin += "<div class=\"button\" style=\"margin: auto;\"><a href=\"SignIn.aspx\">התחברות/הרשמה!</a></div>";
        }
    }
}