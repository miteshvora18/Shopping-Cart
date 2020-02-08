using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace ShoppingCart
{
    public partial class _Default : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["shoppingConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                cart.Visible = false;
                pnlPref.Visible = false;
                buyForMe.Visible = false;
            }
            else
            {
                cart.Visible = true;
                pnlPref.Visible = false;
                //pnlPref.Visible = true;
                buyForMe.Visible = true;
            }

            if (!IsPostBack)
            {
                BindData();
                BindProducts();
                getCartCount();
                if (Session["uid"] != null)
                    getUserPref();
                
                if (Request.QueryString["msg"] == "checked")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('You have successfully placed order.')", true);
                }
                else if (Request.QueryString["msg"] == "ins")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Quantity not available')", true);
                }

                getRecommendedProducts();
                getBestSellerProducts();

                if (Request.QueryString["msg"] == "noProducts")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('All products are already in cart')", true);
                }

                if (Request.QueryString["msg"] == "NoSearchText")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('No products to match your search')", true);
                }
                if (Request.QueryString["msg"] == "noData")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('No products to match your preferences')", true);
                }
                
            }
        }

        private void getUserPref()
        {
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select top 1 ubrand,ucolor,ulowprice,uhighprice from BuyForMePreference where uid = @uid order by id desc",con);
            cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            string brand = "";
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    lblBrand.Text = dr[0].ToString().ToUpper();
                    brand = dr[0].ToString();
                    lblColor.Text = dr[1].ToString().ToUpper();
                    lblLowerRange.Text = dr[2].ToString().ToUpper();
                    lblHigherRange.Text = dr[3].ToString().ToUpper();
                }
                con.Close();
                SqlCommand cmd2 = new SqlCommand("Select cname from Categories c join Products p on c.cid = p.cid where pbrand=@pbrand", con);
                cmd2.Parameters.AddWithValue("@pbrand", brand);
                con.Open();
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.HasRows)
                {
                    while (dr2.Read())
                    {
                        ddlCategory.Items.Add(dr2[0].ToString());
                    }
                }
            }
            else
            {
                pnlPref.Visible = false;
            }
            

        }

        private void getBestSellerProducts()
        {
            SqlConnection con;
            con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(" Select c.pid,sum(c.pquantity),pname,pimage,pprice from cart c join products p on p.pid=c.pid where c.checkedOut=1 and pvalid=1 group by c.pid,pname,pimage,pprice order by sum(c.pquantity) desc", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            rptBestsellers.DataSource = dr;
            rptBestsellers.DataBind();
            con.Close();
            
            if (rptBestsellers.Items.Count == 0)
            {
                rptBestsellers.Visible = false;
            }
        }

        private void getCartCount()
        {
            lblCartCount.Text = "0";

            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select count(pid) from Cart where uid=@uid and checkedOut=0",con);
            cmd.Parameters.AddWithValue("@uid", Convert.ToInt32((string)Session["uid"]));
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    lblCartCount.Text = dr[0].ToString();
                }
            }
            con.Close();
        }

        private void getRecommendedProducts()
        {
            SqlConnection con;
            if (Session["role"] == null)
            {
                con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select Top 5 pid,pname,pimage,pprice from Products where pvalid=1 order by pdatetime desc", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                rptRecommended.DataSource = dr;
                rptRecommended.DataBind();
                con.Close();
            }
            else
            {
                int uid = Convert.ToInt32(Session["uid"].ToString());

                con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select Top 5 p.pid,pname,pimage,pprice from Products p join UserPreference up on p.pid=up.pid where pvalid=1 and uid=@uid order by pdatetime desc", con);
                cmd.Parameters.AddWithValue("@uid", uid);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                rptRecommended.DataSource = dr;
                rptRecommended.DataBind();
                con.Close();
            }

            if (rptRecommended.Items.Count == 0)
            {
                rptRec.Visible = false;
            }

        }

        private void BindData()
        {
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select cname from Categories where cvalid=1", con);
            SqlDataReader dr = cmd.ExecuteReader();
            dlCollections.DataSource = dr;
            dlCollections.DataBind();
            con.Close();
        }

        private void BindProducts()
        {
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select top 12 pid,pname,pimage,pprice,pdatetime from Products where pvalid=1 order by pdatetime desc", con);
            SqlDataReader dr = cmd.ExecuteReader();
            dlProducts.DataSource = dr;
            dlProducts.DataBind();
            con.Close();
        }

        protected void dlProducts_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            HyperLink hl = (HyperLink)e.Item.FindControl("hyProducts");
            HiddenField hdnPid = (HiddenField)e.Item.FindControl("hdnPid");
            hl.NavigateUrl = "ProductDetail.aspx?pid=" + hdnPid.Value;

            Image img = (Image)e.Item.FindControl("prodImg");
            img.ImageUrl = "~/GetImages/"+img.ImageUrl;
        }
        
        protected void dlCollections_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            HyperLink hl = (HyperLink)e.Item.FindControl("hyCollections");
            hl.NavigateUrl = "Collections.aspx?c=" + hl.Text;
        }

        protected void rptRecommended_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string pid = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "pid"));
                HtmlAnchor hrefRec = (HtmlAnchor)e.Item.FindControl("hrefRec");
                hrefRec.HRef = "~/ProductDetail.aspx?pid=" + pid;

                string pimage= Convert.ToString(DataBinder.Eval(e.Item.DataItem, "pimage"));
                HtmlImage imgRec = (HtmlImage)e.Item.FindControl("imgRec");
                imgRec.Src = "~/GetImages/" + pimage;

            }
        }

        protected void rptBestsellers_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string pid = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "pid"));
                HtmlAnchor hrefBestSeller = (HtmlAnchor)e.Item.FindControl("hrefBestSeller");
                hrefBestSeller.HRef = "~/ProductDetail.aspx?pid=" + pid;

                string pimage = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "pimage"));
                HtmlImage imgBestSeller = (HtmlImage)e.Item.FindControl("imgBestSeller");
                imgBestSeller.Src = "~/GetImages/" + pimage;

            }
        }
    }
}
