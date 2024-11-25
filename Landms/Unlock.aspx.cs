using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Landms
{
    public partial class Unlock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = txtEmail.Text;
                string password = HashPassword(txtPassword.Text);

                using (var context = new ApplicationDbContext())
                {
                    // Check if user exists with the provided email and password (hash comparison)
                    var user = context.Users.FirstOrDefault(u => u.Email == email && u.Password == password);

                    if (user != null)
                    {
                        // Valid user - Redirect to the dashboard or another page
                        Session["UserId"] = user.UserId;
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        // Invalid login
                        lblMessage.Text = "Invalid email or password.";
                    }
                }
            }
        }
        private string HashPassword(string password)
        {
            // Example of hashing password (this is just a simple example, you can use more secure hashing algorithms)
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                var bytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}