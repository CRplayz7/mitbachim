using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanelEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["uName"] == null)
        {
            Response.Redirect("AdminPanel.aspx");
            return;
        }

        string fName_c = Request.Form["fName"];
        string lName_c = Request.Form["lName"];
        string uName_c = Request.Form["uName"];
        string mail_c = Request.Form["mail"];
        string phoneKidomet_c = Request.Form["phoneKidomet"];
        string phoneNum_c = Request.Form["phoneNum"];
        string pass1_c = Request.Form["pass1"];
        int yearOfBirth_c = int.Parse(Request.Form["yearOfBirth"]);
        string sex_c = Request.Form["sex"];
        string eda_c = Request.Form["eda"];

        string manager_c;
        if (Request.Form["manager"] != null)
        {
            manager_c = "True";
        }
        else
        {
            manager_c = "False";
        }

        string tableName = "Table1";

        string sql = String.Format("UPDATE {0} SET [fName] = '{1}', [lName] = '{2}', " +
    "[mail] = '{3}', [phoneKidomet] = '{4}', [phoneNum] = '{5}', [pass1] = '{6}', " +
    "[yearOfBirth] = {7}, [sex] = '{8}', [eda] = '{9}', [manager] = {10} " +
    "WHERE [uName] = '{11}'",
    tableName, fName_c, lName_c, mail_c, phoneKidomet_c, phoneNum_c,
    pass1_c, yearOfBirth_c, sex_c, eda_c, manager_c, uName_c);
        MyAdoHelperAccess.DoQuery(sql);
        Response.Redirect("AdminPanel.aspx");
    }
}