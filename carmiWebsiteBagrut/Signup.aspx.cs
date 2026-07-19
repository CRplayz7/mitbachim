using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Signup : System.Web.UI.Page
{
    public string str = "";
    public string msg = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        bool loggedAdmin = Session["isAdmin"] != null && (bool)Session["isAdmin"] == true;
        bool loggedUser = Session["isUser"] != null && (bool)Session["isUser"] == true;

        if (loggedAdmin || loggedUser)
        {
            Session["message"] = "אינך יכול להירשם כאשר הינך מחובר לחשבון משתמש או מנהל. התנתק כדי לרשום ולהתחבר לחשבון אחר.";
            Response.Redirect("Message.aspx");
        }

        if (Request.Form["mySubmit"] != null)
        {
            string pass1 = Request.Form["pass1"];

            if (Request.Form["mySubmit"] != null)
            {
                string fName_c = Request.Form["fName"];
                string lName_c = Request.Form["lName"];
                string uName_c = Request.Form["uName"];
                string mail_c = Request.Form["mail"];
                string phoneKidomet_c = Request.Form["phoneKidomet"];
                string phoneNum_c = Request.Form["phoneNum"];
                string pass1_c = pass1;
                int yearOfBirth_c = int.Parse(Request.Form["yearOfBirth"]);
                string sex_c = Request.Form["sex"];
                string eda_c = Request.Form["eda"];
                string tableName = "Table1"; //שם הטבלה

                //////////
                string sqlCheckIfUsernameIsOccupied = string.Format("SELECT uName FROM {0} WHERE(uName = '{1}')", tableName, uName_c);

                if (MyAdoHelperAccess.IsExist(sqlCheckIfUsernameIsOccupied))
                {
                    msg = "שם משתמש זה הינו תפוס. אנא הירשם עם שם משתמש אחר.";
                }
                else
                {
                    string fileName = "Database.accdb";   //שם הקובץ
                    string path = HttpContext.Current.Server.MapPath("App_Data/");//מיקום מסד בפורוייקט
                    path += fileName;

                    string connString = "Provider=Microsoft.ACE.OLEDB.12.0;Data source=" + path;//נתוני ההתחברות הכוללים מיקום וסוג המסד

                    OleDbConnection conn = new OleDbConnection(connString);

                    string sqlSignup = string.Format("INSERT INTO {0} (fName, lName, uName, mail, phoneKidomet, phoneNum, pass1, yearOfBirth, sex, eda) VALUES('{1}','{2}','{3}','{4}','{5}','{6}','{7}',{8},'{9}','{10}')", tableName, fName_c, lName_c, uName_c, mail_c, phoneKidomet_c, phoneNum_c, pass1_c, yearOfBirth_c, sex_c, eda_c);

                    OleDbCommand com = new OleDbCommand(sqlSignup, conn);
                    conn.Open();
                    com.ExecuteNonQuery();

                    com.Dispose();
                    conn.Close();

                    msg = "ברוכים הבאים לאתר!";
                }
                msg += "<br/> <br/> <div class='button' style='width: 100%; margin: 0 auto'><a href = 'SignIn.aspx' >להתחברות</a></div>";
                Session["message"] = msg;
                Response.Redirect("Message.aspx");
            }
        }
    }
}