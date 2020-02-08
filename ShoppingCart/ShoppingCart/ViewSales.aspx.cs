using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ShoppingCart
{
    public partial class ViewSales : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=AMISH-PC;Initial Catalog=ShoppingCart;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != "admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                getSales();
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

            string pprice = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "pprice"));
            string pquantity = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "quantity"));

            Label lblPrice = (Label)e.Row.FindControl("lblPrice");
            lblPrice.Text = (Convert.ToInt32(pprice) * Convert.ToInt32(pquantity)).ToString();
        }

        private void getSales()
        {
            SqlCommand cmd = new SqlCommand("Select caid,cadate,pname,pimage,pprice,pcolor,pbrand,uname,c.pquantity as quantity from Cart c join Products p on p.pid= c.pid join Users u on u.uid = c.uid where checkedOut = 1 order by cadate desc", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            gvSales.DataSource = dr;
            gvSales.DataBind();
            con.Close();

            if (gvSales.Rows.Count == 0)
            {
                //btnCheckout.Visible = false;
                lblMsg.Visible = true;
            }
            else
            {
                //btnCheckout.Visible = true;
                lblMsg.Visible = false;
            }
        }
    }
}