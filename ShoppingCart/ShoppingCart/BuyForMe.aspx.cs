using System;
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
    public partial class BuyForMe : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["shoppingConnection"].ConnectionString;

        string ubrand, ucolor, ulowprice, uhighprice;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["uid"] != null)
                {
                    int userPrefSet = getUserPref();

                    #region No User Pref Set
                    if (userPrefSet == 0)
                    {
                        string uid = (string)Session["uid"];
                        SqlConnection con = new SqlConnection(conn);
                        SqlCommand cmd = new SqlCommand("Select top 1 pcolor,p.pid from UserPreference up join Products p on p.pid = up.pid where uid = @uid", con);
                        cmd.Parameters.AddWithValue("@uid", uid);
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        //When there is data from UserPreference table for user
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                string pcolor = dr[0].ToString();
                                string lastPid = dr[1].ToString();
                                con.Close();
                                SqlCommand cmd2 = new SqlCommand("prcGetRandomProductsForColor", con);
                                cmd2.CommandType = CommandType.StoredProcedure;
                                cmd2.Parameters.AddWithValue("@pcolor", pcolor);
                                cmd2.Parameters.AddWithValue("@uid", uid);
                                cmd2.Parameters.Add("@return", SqlDbType.Int);
                                cmd2.Parameters.Add("@pid", SqlDbType.Int);
                                cmd2.Parameters["@return"].Direction = ParameterDirection.Output;
                                cmd2.Parameters["@pid"].Direction = ParameterDirection.Output;
                                con.Open();
                                cmd2.ExecuteNonQuery();
                                con.Close();
                                int returnVal = Convert.ToInt32(cmd2.Parameters["@return"].Value.ToString());

                                if (returnVal == 1)
                                {
                                    //Random product id
                                    int pid = Convert.ToInt32(cmd2.Parameters["@pid"].Value.ToString());
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
                                else
                                {
                                    Response.Redirect("Default.aspx?msg=noProducts");
                                }

                            }
                        }
                        //When there is no data from UserPreference table for user
                        else
                        {
                            con.Close();
                            SqlCommand cmd2 = new SqlCommand("prcGetRandomProductsWithoutColor", con);
                            cmd2.CommandType = CommandType.StoredProcedure;
                            cmd2.Parameters.AddWithValue("@uid", uid);
                            cmd2.Parameters.Add("@return", SqlDbType.Int);
                            cmd2.Parameters.Add("@pid", SqlDbType.Int);
                            cmd2.Parameters["@return"].Direction = ParameterDirection.Output;
                            cmd2.Parameters["@pid"].Direction = ParameterDirection.Output;
                            con.Open();
                            cmd2.ExecuteNonQuery();
                            con.Close();
                            int returnVal = Convert.ToInt32(cmd2.Parameters["@return"].Value.ToString());

                            if (returnVal == 1)
                            {
                                //Random product id
                                int pid = Convert.ToInt32(cmd2.Parameters["@pid"].Value.ToString());
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
                            else
                            {
                                Response.Redirect("Default.aspx?msg=noProducts");
                            }
                        }
                    }
                    #endregion
                    #region User Pref Set
                    else
                    {
                        randomProductsForUserPref();
                    }
                    #endregion
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void randomProductsForUserPref()
        {
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select top 1 pid from Products p join Categories c on p.cid = c.cid where pcolor = @pcolor and pbrand = @pbrand and pprice between @plowprice and @phighprice and c.cname=@cname and pid not in(select pid from Cart c where uid = @uid and checkedOut = 0) order by newid()", con);
            cmd.Parameters.AddWithValue("@pbrand", ubrand);
            cmd.Parameters.AddWithValue("@pcolor", ucolor);
            cmd.Parameters.AddWithValue("@plowprice", ulowprice);
            cmd.Parameters.AddWithValue("@phighprice", uhighprice);
            cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
            cmd.Parameters.AddWithValue("@cname", Request.QueryString["val"]);
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
                Response.Redirect("Default.aspx?msg=noData");
            }
        }

        private int getUserPref()
        {
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select top 1 ubrand,ucolor,ulowprice,uhighprice from BuyForMePreference where uid = @uid order by id desc", con);
            cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    //User Pref Set
                    ubrand = dr[0].ToString();
                    ucolor = dr[1].ToString();
                    ulowprice = dr[2].ToString();
                    uhighprice = dr[3].ToString();
                }
                con.Close();
                return 1;
            }
            else
            {
                con.Close();
                //User Pref Set
                return 0;
            }
        }
    }
}