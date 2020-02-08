using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Agent
{
    public class Agent
    {
        //Random product  
        public int AgentX(string ubrand, string ucolor, string ulowprice, string uhighprice, string ucat,string conn, string uid)
        {
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select top 1 pid from Products p join Categories c on p.cid = c.cid where pcolor = @pcolor and pbrand = @pbrand and pprice between @plowprice and @phighprice and c.cname=@cname and pid not in(select pid from Cart c where uid = @uid and checkedOut = 0) order by newid()", con);
            cmd.Parameters.AddWithValue("@pbrand", ubrand);
            cmd.Parameters.AddWithValue("@pcolor", ucolor);
            cmd.Parameters.AddWithValue("@plowprice", ulowprice);
            cmd.Parameters.AddWithValue("@phighprice", uhighprice);
            //cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.Parameters.AddWithValue("@cname", ucat);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //Search Results
            if (dr.HasRows)
            {
                //string uid = (string)Session["uid"];
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
                    return 1;
                    //Response.Redirect("Cart.aspx?msg=added");
                }
                return 2;
            }
            else
            {
                return 0;
                //Response.Redirect("BuyPreference.aspx?msg=noData");
            }
        }

        //By price asc product
        public int AgentY(string ubrand, string ucolor, string ulowprice, string uhighprice, string ucat, string conn, string uid)
        {
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select top 1 pid from Products p join Categories c on p.cid = c.cid where pcolor = @pcolor and pbrand = @pbrand and pprice between @plowprice and @phighprice and c.cname=@cname and pid not in(select pid from Cart c where uid = @uid and checkedOut = 0) order by pprice", con);
            cmd.Parameters.AddWithValue("@pbrand", ubrand);
            cmd.Parameters.AddWithValue("@pcolor", ucolor);
            cmd.Parameters.AddWithValue("@plowprice", ulowprice);
            cmd.Parameters.AddWithValue("@phighprice", uhighprice);
            //cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.Parameters.AddWithValue("@cname", ucat);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //Search Results
            if (dr.HasRows)
            {
                //string uid = (string)Session["uid"];
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
                    return 1;
                    //Response.Redirect("Cart.aspx?msg=added");
                }
                return 2;
            }
            else
            {
                return 0;
                //Response.Redirect("BuyPreference.aspx?msg=noData");
            }
        }

        //By price desc product
        public int AgentZ(string ubrand, string ucolor, string ulowprice, string uhighprice, string ucat, string conn, string uid)
        {
            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Select top 1 pid from Products p join Categories c on p.cid = c.cid where pcolor = @pcolor and pbrand = @pbrand and pprice between @plowprice and @phighprice and c.cname=@cname and pid not in(select pid from Cart c where uid = @uid and checkedOut = 0) order by pprice desc", con);
            cmd.Parameters.AddWithValue("@pbrand", ubrand);
            cmd.Parameters.AddWithValue("@pcolor", ucolor);
            cmd.Parameters.AddWithValue("@plowprice", ulowprice);
            cmd.Parameters.AddWithValue("@phighprice", uhighprice);
            //cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.Parameters.AddWithValue("@cname", ucat);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //Search Results
            if (dr.HasRows)
            {
                //string uid = (string)Session["uid"];
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
                    return 1;
                    //Response.Redirect("Cart.aspx?msg=added");
                }
                return 2;
            }
            else
            {
                return 0;
                //Response.Redirect("BuyPreference.aspx?msg=noData");
            }
        }
    }
}