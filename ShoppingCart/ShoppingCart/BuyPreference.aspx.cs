using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using Agent;

namespace ShoppingCart
{
    public partial class BuyPreference : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["shoppingConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                GetCategory();
                GetColor();
                GetBrand();
                //GetRange(); //redundant
                //GetPreviousData(); //redundant

                if (Request.QueryString["msg"] == "noData")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('No products to match your preferences')", true);
                }
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetColor();
            GetBrand();
            //GetRange(); //redundant
        }

        private void GetCategory()
        {
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select cname from Categories where cvalid=1 order by cname", con);
            cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlCategory.Items.Add(dr[0].ToString());
                }
            }
            con.Close();
        }

        #region Redundant now
        private void GetPreviousData()
        {
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select top 1 ubrand,ucolor,ulowprice,uhighprice from BuyForMePreference where uid = @uid order by id desc ", con);
            cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlBrand.SelectedValue = dr[0].ToString();
                    ddlColor.SelectedValue = dr[1].ToString();
                }
            }
            con.Close();
        }
        #endregion

        #region Redundant now as no dropdown
        private void GetRange()
        {
            //ddlLowerPrice.Items.Clear();
            //ddlHighPrice.Items.Clear();
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select distinct pprice from Products", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //ddlLowerPrice.Items.Add(dr[0].ToString());
                    //ddlHighPrice.Items.Add(dr[0].ToString());
                }
            }
            con.Close();
        }
        #endregion

        private void GetColor()
        {
            ddlColor.Items.Clear();
            SqlConnection con = new SqlConnection(conn); 
            SqlCommand cmd = new SqlCommand("Select distinct pcolor from Products p join Categories c on c.cid = p.cid where cname = @cname",con);
            cmd.Parameters.AddWithValue("@cname", ddlCategory.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlColor.Items.Add(dr[0].ToString());
                }
            }
            con.Close();
        }

        private void GetBrand()
        {
            ddlBrand.Items.Clear();
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select distinct pbrand from Products p join Categories c on c.cid = p.cid where cname = @cname", con);
            cmd.Parameters.AddWithValue("@cname", ddlCategory.Text);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlBrand.Items.Add(dr[0].ToString());
                }
            }
            con.Close();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtHighPrice.Text) >= Convert.ToInt32(txtLowerPrice.Text))
            {
                //SqlConnection con = new SqlConnection(conn);
                //SqlCommand cmd = new SqlCommand("Insert into BuyForMePreference values(@uid,@ubrand,@ucolor,@ulowprice,@uhighprice)", con);
                //cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
                //cmd.Parameters.AddWithValue("@ubrand", ddlBrand.Text.ToLower());
                //cmd.Parameters.AddWithValue("@ucolor", ddlColor.Text.ToLower());
                //cmd.Parameters.AddWithValue("@ulowprice", txtLowerPrice.Text);
                //cmd.Parameters.AddWithValue("@uhighprice", txtHighPrice.Text);
                //con.Open();
                //cmd.ExecuteNonQuery();
                //con.Close();
                //ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('')", true);

                //Changes to make use of agent 
                Agent.Agent a = new Agent.Agent();
                string agentConfig = ConfigurationManager.AppSettings["agentVal"];

                int redirect = 0;
                
                if(agentConfig.ToUpper() == "X")
                    redirect = a.AgentX(ddlBrand.Text, ddlColor.Text, txtLowerPrice.Text, txtHighPrice.Text, ddlCategory.Text, conn, (string)Session["uid"]);
                if (agentConfig.ToUpper() == "Y")
                    redirect = a.AgentY(ddlBrand.Text, ddlColor.Text, txtLowerPrice.Text, txtHighPrice.Text, ddlCategory.Text, conn, (string)Session["uid"]);
                if (agentConfig.ToUpper() == "Z")
                    redirect = a.AgentZ(ddlBrand.Text, ddlColor.Text, txtLowerPrice.Text, txtHighPrice.Text, ddlCategory.Text, conn, (string)Session["uid"]);

                if (agentConfig.ToUpper() == "X" || agentConfig.ToUpper() == "Y" || agentConfig.ToUpper() == "Z")
                {
                    if (redirect == 1)
                        Response.Redirect("Cart.aspx?msg=added");
                    else if (redirect == 0)
                        Response.Redirect("BuyPreference.aspx?msg=noData");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Incorrect agent, set appropriate agent')", true);
                }

                //randomProductsForUserPref(ddlBrand.Text, ddlColor.Text, txtLowerPrice.Text, txtHighPrice.Text, ddlCategory.Text);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Higher range cannot be less than lower range')", true);
            }
        }

        private void randomProductsForUserPref(string ubrand,string ucolor,string ulowprice,string uhighprice,string ucat)
        {
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select top 1 pid from Products p join Categories c on p.cid = c.cid where pcolor = @pcolor and pbrand = @pbrand and pprice between @plowprice and @phighprice and c.cname=@cname and pid not in(select pid from Cart c where uid = @uid and checkedOut = 0) order by newid()", con);
            cmd.Parameters.AddWithValue("@pbrand", ubrand);
            cmd.Parameters.AddWithValue("@pcolor", ucolor);
            cmd.Parameters.AddWithValue("@plowprice", ulowprice);
            cmd.Parameters.AddWithValue("@phighprice", uhighprice);
            cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
            cmd.Parameters.AddWithValue("@cname", ucat);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //Search Results
            if (dr.HasRows)
            {
                string uid = (string)Session["uid"];
                //Random product id
                while (dr.Read())
                {
                    int pid = Convert.ToInt32(dr[0].ToString());
                    con.Close();
                    //Insert data to cart
                    SqlCommand cmd3 = new SqlCommand("Insert into Cart values(@pid,@uuid,@pquantity,@cadate,@checkedOut)", con);
                    cmd3.Parameters.AddWithValue("@pid", pid);
                    cmd3.Parameters.AddWithValue("@uuid", uid);
                    cmd3.Parameters.AddWithValue("@pquantity", "1");
                    cmd3.Parameters.AddWithValue("@cadate", Convert.ToDateTime(DateTime.Now.ToString()));
                    cmd3.Parameters.AddWithValue("@checkedOut", false);
                    con.Open();
                    cmd3.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("Cart.aspx?msg=added");
                }
            }
            else
            {
                Response.Redirect("BuyPreference.aspx?msg=noData");
            }
        }
    }
}