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
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=AMISH-PC;Initial Catalog=ShoppingCart;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                getUserCart();
                if (Request.QueryString["msg"] == "added")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Product has been added to cart')", true);
                }
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
            string pquantity = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "pquantity"));

            Label lblPrice = (Label)e.Row.FindControl("lblPrice");
            lblPrice.Text = (Convert.ToInt32(pprice) * Convert.ToInt32(pquantity)).ToString();
        }

        protected void gvCart_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int caid = Convert.ToInt32(e.CommandArgument);

                SqlCommand cmd = new SqlCommand("Delete from Cart where caid=@caid", con);
                cmd.Parameters.AddWithValue("@caid",caid.ToString());
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                getUserCart();
            }
        }

        private void getUserCart()
        {
            SqlCommand cmd = new SqlCommand("Select ca.caid,p.pid,cname,p.pname,p.pimage,p.pprice,ca.pquantity from Products p join Categories c on c.cid=p.cid join Cart ca on ca.pid=p.pid join Users u on u.uid=ca.uid where u.uid=@uid and ca.checkedOut=0", con);
            cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            gvCart.DataSource = dr;
            gvCart.DataBind();
            con.Close();

            if (gvCart.Rows.Count == 0)
            {
                btnCheckout.Visible = false;
                lblMsg.Visible = true;
            }
            else
            {
                btnCheckout.Visible = true;
                lblMsg.Visible = false;
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Session["amount"] = hdnPrice.Value;
            Session["caid"] = hdnCaid.Value;
            Response.Redirect("Checkout.aspx");
        }
    }
}