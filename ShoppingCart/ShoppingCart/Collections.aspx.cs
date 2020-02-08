using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace ShoppingCart
{
    public partial class Collection : System.Web.UI.Page
    {
        protected string cname
        {
            get
            {
                if (Request.QueryString["c"] != null)
                {
                    return Request.QueryString["c"].ToString();
                }
                else
                {
                    return "";
                }
            }
        }

        string conn = ConfigurationManager.ConnectionStrings["shoppingConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
                if (cname != "")
                {
                    lblCatName.Text = cname.ToString();
                }
                else
                {
                    catName.Visible = false;
                }
            }
        }

        private void BindProducts()
        {
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = null; 
            if(cname != "")
            {
                cmd= new SqlCommand("Select pid,pname,pimage,pprice,pdatetime from Products p join Categories c on p.cid=c.cid where pvalid=1 and cname = '" + cname + "' order by pdatetime desc", con);
            }
            SqlDataReader dr = cmd.ExecuteReader();
            dlProducts.DataSource = dr;
            dlProducts.DataBind();
            con.Close();
            if (dlProducts.Items.Count == 0)
            {
                lblNoProducts.Visible = true;
            }
            else
            {
                lblNoProducts.Visible = false;
            }
        }

        protected void dlProducts_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            HyperLink hl = (HyperLink)e.Item.FindControl("hyProducts");
            HiddenField hdnPid = (HiddenField)e.Item.FindControl("hdnPid");
            hl.NavigateUrl = "ProductDetail.aspx?pid=" + hdnPid.Value;

            Image img = (Image)e.Item.FindControl("prodImg");
            img.ImageUrl = "~/GetImages/" + img.ImageUrl;
        }
    }
}