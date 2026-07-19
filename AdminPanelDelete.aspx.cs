using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanelDelete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["uName"] == null)
        {
            Response.Redirect("AdminPanel.aspx");
            return;
        }

        string tableName = "Table1";
        if (Request.QueryString["uName"] != null)
        {
            string uName = Request.QueryString["uName"];
            string sql = String.Format("DELETE FROM {0} WHERE uName = '{1}'", tableName, uName);
            MyAdoHelperAccess.DoQuery(sql);
        }
        Response.Redirect("AdminPanel.aspx");
    }
}