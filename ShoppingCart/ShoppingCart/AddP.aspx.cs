using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace ShoppingCart
{
    public partial class AddP : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=AMISH-PC;Initial Catalog=ShoppingCart;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["role"] != "admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                string com = "";
                //con.Open();
                //SqlCommand cmd = new SqlCommand(com, con);
                //object count = cmd.ExecuteScalar();
                //if (count != null)
                //{
                //    int i = Convert.ToInt32(count);
                //    i++;
                //    Pid.Text = i.ToString();
                //}
                //else
                //{
                //    Pid.Text = "10001";
                //}
                //con.Close();

                com = "Select cname from Categories ";
                SqlDataAdapter da = new SqlDataAdapter (com,con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                int rows = ds.Tables[0].Rows.Count;

                if(rows != 0)
                    for (int i = 0; i < rows; i++)
                    {
                        DropDownList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                    }
            }
        }

        public string check()
        {
            if (TextBox1.Text == "")
            {
                return "Name of Product";
            }
            else if (TextBox2.Text == "")
            {
                return "Product Description";
            }
            else if (TextBox3.Text == "")
            {
                return "Product Price";
            }
            else if (TextBox4.Text == "")
            {
                return "Product Quantity";
            }
            else if (txtProductColor.Text == "")
            {
                return "Color";
            }
            else if (txtBrand.Text == "")
            {
                return "Brand";
            }
            else
            {
                return "OK";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string c = check();
            string u = Upload();

            if (c != "OK")
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please " + c + "');", true);
            }
            else
            {
                if (u != "OK")
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please " + u + "');", true);
                }
                else
                {
                    int cid=0;
                    SqlCommand cmd2 = new SqlCommand("Select cid from Categories where cname=@cname", con);
                    cmd2.Parameters.AddWithValue("@cname",DropDownList1.Text);
                    con.Open();
                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    while (dr2.Read())
                    {
                        if (dr2.HasRows)
                        {
                            cid = Convert.ToInt32(dr2[0].ToString());
                        }
                    }
                    con.Close();
                    SqlCommand cmd = new SqlCommand("Insert into Products(cid,pname,pdesc,pcolor,pbrand,pimage,pprice,pquantity,pdatetime,pvalid) values ('" + cid + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + txtProductColor.Text + "','" + txtBrand.Text + "','" + FileUpload1.PostedFile.FileName + "','" + TextBox3.Text + "',@quantity,@time,@valid)", con);
                    cmd.Parameters.AddWithValue("@quantity", TextBox4.Text);
                    cmd.Parameters.AddWithValue("@time", Convert.ToDateTime(DateTime.Now.ToLongDateString()));
                    cmd.Parameters.AddWithValue("@valid", "1");
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Product Added Successfully');", true);
                    TextBox1.Text = TextBox2.Text = TextBox3.Text = TextBox4.Text = txtProductColor.Text = txtBrand.Text = "";
                    DropDownList1.SelectedIndex = -1;
                }
            }
        }


        protected string Upload()
        {
            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/GetImages/") + fileName);
                return "OK";
            }
            else
            {
                return "Upload Image of Product";
            }
        }
    }
}