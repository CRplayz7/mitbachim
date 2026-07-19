using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class AdminPanel : System.Web.UI.Page
{
    public string apSt = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["isAdmin"] == null || (bool)Session["isAdmin"] == false)
        {
            Session["message"] = "אין לך הרשאת צפיה.<br/>דף זה למנהלים בלבד.";
            Response.Redirect("Message.aspx");
        }

        string tableName = "Table1";
        string selectQuery = String.Format("SELECT * FROM {0}", tableName);
        DataTable table = MyAdoHelperAccess.ExecuteDataTable(selectQuery);
        int length = table.Rows.Count;
        if (length > 0)
        {
            apSt += "<table class='formTable'>";
            apSt += "<tr>";
            apSt += "<th>שם פרטי</th>";
            apSt += "<th>שם משפחה</th>";
            apSt += "<th>שם משתמש<br/><span style='font-size:18px;' class='requiredField'>(לא ניתן לערוך)</span></th>";
            apSt += "<th>כתובת דוא\"ל</th>";
            apSt += "<th>מספר טלפון</th>";
            apSt += "<th>סיסמה</th>";
            apSt += "<th>שנת לידה</th>";
            apSt += "<th>מין</th>";
            apSt += "<th>עדות<br/><span style='font-size:18px;' class='requiredField'>(לא ניתן לערוך)</span></th>";
            apSt += "<th>מנהל?</th>";
            apSt += "<th>שמירה</th>";
            apSt += "<th>מחיקה</th>";
            apSt += "</tr>";

            for (int i = 0; i < length; i++)
            {
                string uName = table.Rows[i]["uName"].ToString();
                string currentKidomet = (string)table.Rows[i]["phoneKidomet"];
                string edot = (string)table.Rows[i]["eda"];
                string edotForPrint = "";

                foreach (char x in edot)
                {
                    if (x == ',')
                    {
                        edotForPrint += ", ";
                    }
                    else
                    {
                        edotForPrint += x;
                    }
                }

                apSt += "<tr>";
                apSt += "<form method='post' action='AdminPanelEdit.aspx'>";
                apSt += "<td><input type='text' name='fName' value='" + table.Rows[i]["fName"] + "'/></td>";
                apSt += "<td><input type='text' name='lName' value='" + table.Rows[i]["lName"] + "'/></td>";
                apSt += "<td style='font-weight:500;'>" + uName + "<input type='hidden' name='uName' value='" + uName + "' /></td>";
                apSt += "<td><input type='text' name='mail' value='" + table.Rows[i]["mail"] + "'dir='ltr'/></td>";
                apSt += "<td dir='ltr'><select class='formTableSelect' name='phoneKidomet'>";
                string[] kidometList = { "050", "051", "052", "053", "054", "055", "058" };
                foreach (string kidomet in kidometList)
                {
                    string isSelected;
                    if (kidomet == currentKidomet)
                        isSelected = "selected";
                    else
                        isSelected = "";

                    apSt += "<option value='" + kidomet + "' " + isSelected + "> " + kidomet + " </option>";
                }
                apSt += "</select>";
                apSt += "<input type='text' name='phoneNum' value='" + table.Rows[i]["phoneNum"] + "'/></td>";
                apSt += "<td><input type='password' name='pass1' value='" + table.Rows[i]["pass1"] + "'/></td>";
                apSt += "<td><input type='text' name='yearOfBirth' class='yearInput' value='" + table.Rows[i]["yearOfBirth"] + "'/></td>";
                if ((string)table.Rows[i]["sex"] == "נקבה")
                {
                    apSt += "<td><input type='radio' name='sex' value='נקבה' checked /> נקבה  ";
                    apSt += "<input type='radio' name='sex' value='זכר'/> זכר</td>";
                }
                else
                {
                    apSt += "<td><input type='radio' name='sex' value='נקבה' /> נקבה  ";
                    apSt += "<input type='radio' name='sex' value='זכר' checked/>  זכר</td>";
                }

                apSt += "<td style='font-weight:500;'>" + edotForPrint + "<input type='hidden' name='eda' value='" + edot + "' /></td>";

                if ((bool)table.Rows[i]["manager"] == true)
                {
                    apSt += "<td><input type='checkbox' name='manager' value='true' checked/></td> ";
                }
                else
                {
                    apSt += "<td><input type='checkbox' name='manager' value='true'/></td>";
                }
                apSt += "<td><input type='submit' name='mySubmit' value='שמירה'/></td>";
                apSt += "<td><input type='button' name='myDelete' onclick=\"window.location.href='AdminPanelDelete.aspx?uName=" + table.Rows[i]["uName"] + "'\" value='מחיקה'/></td>";
                apSt += "</form>";
                apSt += "</tr>";
            }
            apSt += "</table>";
        }
    }
}