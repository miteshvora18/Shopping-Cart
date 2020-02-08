using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ShoppingCart
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection("Data Source=AMISH-PC;Initial Catalog=ShoppingCart;Integrated Security=True");
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select upass,rolename,uid from Users where uname ='" + txtUsername.Text + "'",con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                string pass =Convert.ToString(dr[0]);
                if (txtPassword.Text == pass)
                {
                    if (dr[1].ToString() == "admin")
                        Session["role"] = "admin";
                    else
                    {
                        Session["role"] = "user";
                        Session["uid"] = dr[2].ToString();
                        Session["id"] = Convert.ToInt32(dr[2].ToString());
                        Response.Redirect("Default.aspx");
                    }
                    con.Close();
                    Response.Redirect("AddP.aspx");
                }
                else
                {
                    txtPassword.Text = "";
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Invalid Password');", true);
                    con.Close();
                }
            }
            else
            {
                txtUsername.Text = "";
                txtPassword.Text = "";
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Invalid UserName');", true);
                con.Close();
            }
        }
    }
}