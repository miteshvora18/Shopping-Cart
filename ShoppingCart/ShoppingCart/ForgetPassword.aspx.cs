using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

namespace ShoppingCart
{
    public partial class Forgetpass : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=AMISH-PC;Initial Catalog=ShoppingCart;Integrated Security=True");
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select uemail from Users where uid='"+txtUsername+"'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Random r = new Random();
                int pass = r.Next(1000,2000);
                if (dr[0].ToString() == txtPassword.Text)
                {
                    con.Close();
                    cmd = new SqlCommand("Update Users set upass='"+pass+"'",con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    email_send(dr[0].ToString(),pass.ToString());
                }
                else
                {
                    con.Close();
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Invalid Email');", true);
                    txtPassword.Text = "";
                }
                
            }
            else
            {
                txtPassword.Text = "";
                txtUsername.Text = "";
                con.Close();
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Invalid UserName');", true);
            }
        }

        public void email_send(string mailid, string pass)
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            mail.From = new MailAddress("voramish7018@gmail.com");
            mail.To.Add(mailid);
            mail.Subject = "New Password";
            mail.Body = "New Password for Shopping is '"+pass+"' ";

            //System.Net.Mail.Attachment attachment;
            //attachment = new System.Net.Mail.Attachment("C:\\Users\\Neeraj\\Downloads\\" + TextBox2.Text + " " + TextBox3.Text + ".doc");
            //mail.Attachments.Add(attachment);

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential("voramish7018@gmail.com", "allbesst");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);

        }
    }
}