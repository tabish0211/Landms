using Landms.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Landms
{
    public partial class CustomerDtl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HideControls();
            if (!IsPostBack)
            {  
                BindCustomerDetails(); // Bind customer data to GridView on page load
            }
        }
        private void BindCustomerDetails()
        {
            using (var context = new ApplicationDbContext())
            {
                var customers = (from c in context.Customers
                                 select new
                                 {
                                     c.CustomerId,
                                     c.Name,
                                     c.Email,
                                     c.PhoneNumber,
                                     c.Address
                                 }).ToList();

                gvCustomerDetails.DataSource = customers;
                gvCustomerDetails.DataBind();
            }
        }

        // Handle Add Customer
        protected void btnAddCustomer_Click(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {
                var newCustomer = new Customer()
                {
                    Name = txtCustomerName.Text,
                    Email = txtEmail.Text,
                    PhoneNumber = txtPhoneNumber.Text,
                    Address = txtAddress.Text
                };

                context.Customers.Add(newCustomer);
                context.SaveChanges();

                // Rebind the GridView to show updated data
                BindCustomerDetails();
                ResetForm();
            }
        }

        private void ResetForm()
        {
            txtCustomerName.Text = string.Empty; 
            txtEmail.Text=string.Empty;
            txtAddress.Text=string.Empty;
            txtPhoneNumber.Text=string.Empty;
            

        }

        // Editing Customer
        protected void gvCustomerDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCustomerDetails.EditIndex = e.NewEditIndex;
            BindCustomerDetails();
        }

        // Updating Customer
        protected void gvCustomerDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvCustomerDetails.Rows[e.RowIndex];
            int customerId = Convert.ToInt32(gvCustomerDetails.DataKeys[e.RowIndex].Value);

            using (var context = new ApplicationDbContext())
            {
                var customer = context.Customers.Find(customerId);
                customer.Name = (row.Cells[1].Controls[0] as TextBox).Text;
                customer.Email = (row.Cells[2].Controls[0] as TextBox).Text;
                customer.PhoneNumber = (row.Cells[3].Controls[0] as TextBox).Text;
                customer.Address = (row.Cells[4].Controls[0] as TextBox).Text;

                context.SaveChanges();
                gvCustomerDetails.EditIndex = -1;
                BindCustomerDetails();
            }
        }

        // Cancel Editing
        protected void gvCustomerDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCustomerDetails.EditIndex = -1;
            BindCustomerDetails();
        }

        // Delete Customer
        protected void gvCustomerDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int customerId = Convert.ToInt32(gvCustomerDetails.DataKeys[e.RowIndex].Value);

            using (var context = new ApplicationDbContext())
            {
                var customer = context.Customers.Find(customerId);
                if (customer != null)
                {
                    context.Customers.Remove(customer);
                    context.SaveChanges();
                    BindCustomerDetails();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            using (var context = new ApplicationDbContext())
            {
                lblError.Visible = true;
                var customers = context.Customers.Where(x => x.PhoneNumber == txtSearchPhnNmbr.Text.Trim())
                    .Select(c => new
                    {
                        c.CustomerId,
                        c.Name,
                        c.Email,
                        c.PhoneNumber,
                        c.Address
                    }).ToList();
                if (customers != null && customers.Any())
                {
                    lblError.Visible = false;
                    gvCustomerDetails.DataSource = customers;
                    gvCustomerDetails.DataBind();
                }
                
            }
        }
        private void HideControls()
        {
            lblError.Visible = false;
        }
    }
}