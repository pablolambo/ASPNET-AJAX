using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    private readonly string SqlConnectionString = "Server=PAWEL\\MSSQLSERVER01;Database=master;User Id=sa;Password=admin;\r\n";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindData();
    }

    // ZADANIE 1:
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToLongTimeString();
    }

    // ZADANIE 2:
    protected void Button2_Click(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToLongTimeString();
        Label2.Text = DateTime.Now.ToLongTimeString();
    }

    // ZADANIE 3:
    private void BindData()
    {
        using (SqlConnection connection = new SqlConnection(SqlConnectionString))
        {
            connection.Open();

            SqlCommand selectCommand = connection.CreateCommand();
            selectCommand.CommandText = "SELECT * FROM Categories";

            SqlDataAdapter dataAdapter = new SqlDataAdapter(selectCommand);
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet);

            DataTable categories = dataSet.Tables[0];
            DropDownList1.DataSource = categories;
            DropDownList1.DataTextField = "CategoryName";
            DropDownList1.DataValueField = "CategoryID";
            DropDownList1.DataBind();

            connection.Close();
        }
    }

    protected void btn_Click(object sender, EventArgs e)
    {
        lbl.Text = HttpUtility.HtmlEncode(Name.Text);
    }

    // Obsługa zdarzenia zmiany wyboru w DropDownList - wyświetla opis kategorii
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(SqlConnectionString))
        {
            connection.Open();

            SqlCommand selectCommand = connection.CreateCommand();
            int id = int.Parse(DropDownList1.SelectedValue);
            selectCommand.CommandText = "SELECT Description FROM Categories WHERE CategoryID = " + id;

            string desc = (string)selectCommand.ExecuteScalar();
            connection.Close();
            Label3.Text = desc;
        }
    }
}