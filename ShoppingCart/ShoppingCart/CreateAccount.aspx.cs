using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ShoppingCart
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=AMISH-PC;Initial Catalog=ShoppingCart;Integrated Security=True");
        string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //string com = "select top 1 ID From Admin  ORDER BY ID Desc;";
            //con.Open();
            //SqlCommand cmd = new SqlCommand(com, con);
            //object count = cmd.ExecuteScalar();
            //if (count != null)
            //{
            //    int i = Convert.ToInt32(count);
            //    i++;
            //    id = i.ToString();
            //}
            //else
            //{
            //    id = "1001";
            //}
            //con.Close();
        }

        public string check()
        {
            if (txtName.Text == "")
            {
                return "Name";
            }
            else if (txtAddress.Text == "")
            {
                return "Address";
            }
            else if (txtEmail.Text=="")
            {
                return "EMail";
            }
            else if (txtPassword.Text == "")
            {
                return "Password";
            }
            else
            {
                return "OK";
            }
        }

        public string checkpass()
        {
            if (txtPassword.Text == txtConfirmPass.Text)
            {
                return "OK";
            }
            else
            {
                return "Not";
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string c = check();
            if (c == "OK")
            {
                if (checkpass() == "OK")
                {
                    SqlCommand cmd = new SqlCommand("Select * from Users where uname='" + txtUsername + "'", con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        con.Close();
                        txtUsername.Text = "";
                        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Username already used');", true);
                    }
                    else
                    {
                        con.Close();
                        cmd = new SqlCommand("Insert Into Users(uname,upass,ugender,uaddress,uemail,uvalid,name,rolename) values('"+txtUsername.Text+"','"+txtPassword.Text+"','"+ddlGender.Text+"','"+txtAddress.Text+"','"+txtEmail.Text+"','1','"+txtName.Text+"','user') ", con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        txtAddress.Text = txtConfirmPass.Text = txtEmail.Text = txtName.Text = txtPassword.Text = txtUsername.Text = "";
                        ddlGender.SelectedIndex = 0;
                        ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Account created.');", true);
                    }
                }
                else
                {
                    txtPassword.Text = "";
                    txtConfirmPass.Text = "";
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Password not matched');", true);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please Enter "+c+"');", true);
            }
        }
    }
}