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
    public partial class Checkout : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["shoppingConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            int uid;
            if (Session["uid"] != null)
            {
                uid = Convert.ToInt32((string)Session["uid"]);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                txtAmount.Text = (string)Session["amount"];
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con5 = new SqlConnection(conn);
            SqlCommand cmd5 = new SqlCommand("Select ccid from CreditCards where ccname=@ccname and ccnumber=@ccnumber and cvvcode=@cvvcode and ccexpirydate=@ccexpirydate", con5);
            cmd5.Parameters.AddWithValue("ccname", txtName.Text);
            cmd5.Parameters.AddWithValue("ccnumber", txtCardNumber.Text);
            cmd5.Parameters.AddWithValue("cvvcode", txtCvvCode.Text);
            cmd5.Parameters.AddWithValue("ccexpirydate", txtExpiryDate.Text);
            con5.Open();
            SqlDataReader dr5 = cmd5.ExecuteReader();

            if (dr5.HasRows)
            {
                while (dr5.Read())
                {
                    List<string> pids = new List<string>();
                    List<string> pquantity = new List<string>();
                    List<string> pquantityCart = new List<string>();

                    SqlConnection con3 = new SqlConnection(conn);
                    SqlCommand cmd3 = new SqlCommand("Select p.pid,p.pquantity,c.pquantity from Products p join Cart c on p.pid=c.pid where uid=@uid and checkedOut=0", con3);
                    cmd3.Parameters.AddWithValue("@uid", (string)Session["uid"]);
                    con3.Open();
                    SqlDataReader dr3 = cmd3.ExecuteReader();
                    while (dr3.Read())
                    {
                        if (dr3.HasRows)
                        {
                            pids.Add(dr3[0].ToString());
                            pquantity.Add(dr3[1].ToString());
                            pquantityCart.Add(dr3[2].ToString());
                        }
                    }
                    con3.Close();

                    for (int i = 0; i < pids.Count; i++)
                    {
                        if ((Convert.ToInt32(pquantity[i]) - Convert.ToInt32(pquantityCart[i])) > 0)
                        {
                            SqlConnection con4 = new SqlConnection(conn);
                            SqlCommand cmd4 = new SqlCommand("Update products set pquantity=@pquantity where pid=@pid", con4);
                            cmd4.Parameters.AddWithValue("@pquantity", (Convert.ToInt32(pquantity[i]) - Convert.ToInt32(pquantityCart[i])));
                            cmd4.Parameters.AddWithValue("@pid", pids[i]);
                            con4.Open();
                            cmd4.ExecuteNonQuery();
                            con4.Close();
                        }
                        else
                        {
                            Response.Redirect("Default.aspx?msg=ins");
                        }
                    }

                    SqlConnection con = new SqlConnection(conn);
                    SqlCommand cmd = new SqlCommand("Update cart set checkedOut=1 where uid=@uid", con);
                    cmd.Parameters.AddWithValue("@uid", (string)Session["uid"]);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    SqlConnection con2 = new SqlConnection(conn);
                    SqlCommand cmd2 = new SqlCommand("Insert into CreditDetails values(@cdNumber,@cdexpirydate,@cdamount,@uid,@cdDate,@caid)", con2);
                    cmd2.Parameters.AddWithValue("@cdNumber", txtCardNumber.Text);
                    cmd2.Parameters.AddWithValue("@cdexpirydate", txtExpiryDate.Text);
                    cmd2.Parameters.AddWithValue("@cdamount", txtAmount.Text);
                    cmd2.Parameters.AddWithValue("@uid", (string)Session["uid"]);
                    cmd2.Parameters.AddWithValue("@cdDate", DateTime.Now.ToString());
                    cmd2.Parameters.AddWithValue("@caid", (string)Session["caid"]);
                    con2.Open();
                    cmd2.ExecuteNonQuery();
                    con2.Close();

                    Response.Redirect("Default.aspx?msg=checked");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Invalid Credentials')", true);
            }
        }
    }
}