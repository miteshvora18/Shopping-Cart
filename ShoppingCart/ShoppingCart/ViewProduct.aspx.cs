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
    public partial class ViewP : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=AMISH-PC;Initial Catalog=ShoppingCart;Integrated Security=True");
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["role"] != "admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                SqlDataAdapter da = new SqlDataAdapter("Select c.cname,pname,pdesc,pimage,pfeatures,pprice,pquantity,pcolor,pbrand from Products p join Categories c on c.cid=p.cid", con);
                DataSet ds = new DataSet();
                da.Fill(ds);

                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string productImage = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "pimage"));
            Image img = (Image)e.Row.FindControl("imgProduct");
            if (img == null)
            {
                return;
            }
            else
            {
                img.ImageUrl = "~/GetImages/" + productImage;
            }
        }
    }
}