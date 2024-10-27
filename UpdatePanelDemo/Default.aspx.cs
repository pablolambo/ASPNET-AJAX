using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // CodeBehind
    protected void Button_Click(object sender, EventArgs e)
    {
        Label.Text = "Aktualny czas: " + DateTime.Now.ToLongTimeString();
    }
}