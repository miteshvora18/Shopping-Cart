using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ShoppingCart
{
    public partial class ViewUP : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=AMISH-PC;Initial Catalog=ShoppingCart;Integrated Security=True");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * from UserPreference",con);
            DataSet ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}