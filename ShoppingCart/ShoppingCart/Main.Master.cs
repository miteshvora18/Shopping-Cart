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
    public partial class Main : System.Web.UI.MasterPage
    {
        string conn = ConfigurationManager.ConnectionStrings["shoppingConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if ((string)Session["role"] == "admin")
                {
                    lblUser.Visible = false;
                    Panel2.Visible = true;
                    Panel1.Visible = false;
                    basket.Visible = false;
                    buy.Visible = false;
                    basketFooter.Visible = false;
                }
                else
                {
                    Panel2.Visible = false;
                    Panel1.Visible = true;
                    basket.Visible = true;
                    buy.Visible = true;
                    basketFooter.Visible = true;
                }

                login.InnerText = "Logout";
                login.HRef = "Logout.aspx";

                loginFooter.InnerText = "Logout";
                loginFooter.HRef = "Logout.aspx";
            }
            else
            {
                Panel2.Visible = false;
                Panel1.Visible = true;
                basket.Visible = false;
                buy.Visible = false;
                basketFooter.Visible = false;
            }

            if (!IsPostBack)
            {
                if (Session["uid"] != null)
                {
                    string uid = (string)Session["uid"]; 
                    SqlConnection con = new SqlConnection(conn);
                    SqlCommand cmd = new SqlCommand("Select uname from users where uid = @uid", con);
                    cmd.Parameters.AddWithValue("@uid",uid);
                    con.Open();
                    SqlDataReader dr=cmd.ExecuteReader();
                    while(dr.Read())
                    {
                        if(dr.HasRows)
                        {
                            lblUser.Text = "Welcome " + dr[0].ToString();
                        }
                    }
                    con.Close();
                }

                if ((string)Session["role"] == "admin")
                {
                    srch.Visible = false;
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if(txtSearch.Text != "")
                Response.Redirect("Search.aspx?text=" + txtSearch.Text.Trim());
        }
    }
}