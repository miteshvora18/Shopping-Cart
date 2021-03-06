﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ShoppingCart
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["shoppingConnection"].ConnectionString;

        protected int pid
        {
            get
            {
                if (Request.QueryString["pid"] != null)
                {
                    return Convert.ToInt32(Request.QueryString["pid"].ToString());
                }
                else
                {
                    return 0;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = null;
            string com = "";
            con.Open();

            if (!IsPostBack)
            {
                if (pid != 0)
                {
                    cmd = new SqlCommand("Select pname,pimage,pprice,pdesc,pquantity,pcolor,pbrand from Products where pvalid=1 and pid = '" + pid + "'", con);

                    SqlDataReader dr = cmd.ExecuteReader();
                    dr.Read();
                    Label1.Text = dr[0].ToString();
                    Image1.ImageUrl = "~/GetImages/" + dr[1].ToString();
                    Label3.Text = dr[2].ToString();
                    Label2.Text = dr[3].ToString();
                    Label4.Text = dr[4].ToString();
                    lblProductColor.Text = "Product Color : " + dr[5].ToString();
                    lblProductBrand.Text = "Brand : " + dr[6].ToString();

                    int quantity = Convert.ToInt32(dr[4].ToString());
                    for (int i = 1; i <= quantity; i++)
                    {
                        ddlSelectQuantity.Items.Add(i.ToString());
                    }
                    con.Close();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }

                #region Add to User Preference table
                if (Session["id"] != null)
                {
                    SqlDataAdapter da = new SqlDataAdapter("SELECT TOP (5) pid FROM UserPreference WHERE (uid = '" + Session["id"] + "') ORDER BY uspdate DESC", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    int rows = ds.Tables[0].Rows.Count;
                    string check = "new";
                    if (rows != 0)
                    {
                        for (int i = 0; i < rows; i++)
                        {
                            if (ds.Tables[0].Rows[i][0].ToString() == pid.ToString())
                            {
                                check = "again";
                                goto end;
                            }
                            else
                            {
                                check = "new";
                            }
                        }
                    }

                end:
                    if (check == "new")
                    {
                        cmd = new SqlCommand("Insert into UserPreference(uid,pid,uspdate) values(" + Convert.ToInt32(Session["id"].ToString()) + ",'" + pid + "','" + DateTime.Now.ToShortDateString().ToString() + " " + DateTime.Now.ToShortTimeString().ToString() + "')", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                #endregion

                hideAddtoCart();
            }
        }

        private void hideAddtoCart()
        {
            if (Session["id"] != null)
            {
                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Select caid from Cart where uid=@uid and pid=@pid and checkedOut=0", con);
                cmd.Parameters.AddWithValue("@uid",Convert.ToInt32((string)Session["uid"]));
                cmd.Parameters.AddWithValue("@pid",pid);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                
                if (dr.HasRows)
                {
                    dr.Read();
                    btnAddToCart.Visible = false;
                    ddlSelectQuantity.Visible = false;
                    lblAddedToCart.Visible = true;
                }
                else
                {
                    btnAddToCart.Visible = true;
                    ddlSelectQuantity.Visible = true;
                    lblAddedToCart.Visible = false;
                }
                con.Close();                    
                

            }
            else
            {
                btnAddToCart.Visible = false;
                ddlSelectQuantity.Visible = false;
                lblAddedToCart.Visible = false;
            }
        }

        protected void dlProducts_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            HyperLink hl = (HyperLink)e.Item.FindControl("hyProducts");
            HiddenField hdnPid = (HiddenField)e.Item.FindControl("hdnPid");
            hl.NavigateUrl = "ProductDetail.aspx?pid=" + hdnPid.Value;

            Image img = (Image)e.Item.FindControl("prodImg");
            
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["uid"] != null)
            {
                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("Insert into Cart values(@pid,@uid,@pquantity,@cadate,@checkedOut)", con);
                cmd.Parameters.AddWithValue("@pid", pid.ToString());
                cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
                cmd.Parameters.AddWithValue("@pquantity", ddlSelectQuantity.Text);
                cmd.Parameters.AddWithValue("@cadate", Convert.ToDateTime(DateTime.Now.ToString()));
                cmd.Parameters.AddWithValue("@checkedOut", false);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("Cart.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}