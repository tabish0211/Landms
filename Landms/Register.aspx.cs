using Landms.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Landms
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (var context = new ApplicationDbContext())
                {
                    // Check if email already exists
                    var existingUser = context.Users.FirstOrDefault(u => u.Email == txtEmail.Text);
                    if (existingUser != null)
                    {
                        // Show error message if email already exists
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email already exists!');", true);
                        return;
                    }

                    // Create a new User object
                    var newUser = new User
                    {
                        FirstName = txtFirstName.Text,
                        LastName = txtLastName.Text,
                        Email = txtEmail.Text,
                        Password = HashPassword(txtPassword.Text), // Hash the password before saving
                        PhoneNumber = string.IsNullOrEmpty(txtPhoneNumber.Text)?"NA": txtPhoneNumber.Text,
                        Role = ddlRole.SelectedValue,
                        CreatedDate = DateTime.Now,
                        IsActive = true
                    };

                    // Add the new user to the Users table
                    context.Users.Add(newUser);
                    context.SaveChanges();

                    // Redirect to login page after successful signup
                    Response.Redirect("Unlock.aspx");
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
    }
}