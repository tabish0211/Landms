using Landms.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;


namespace Landms
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                BindProjectDetails();
                BindCustomerDetails();
            }
        }

        private void BindCustomerDetails()
        {
            using (var context = new ApplicationDbContext())
            {

                var customers = context.Customers.Select(x => x.Name).ToList();
                customers.Insert(0, "Select Customer");
                ddCustomer.DataSource = customers;
                ddCustomer.DataBind();

            }
        }
        // Function to bind land data to GridView
        private void BindProjectDetails()
        {
            using (var context = new ApplicationDbContext())
            {
              
                var projects = context.AgentLands.Select(x=>x.Project).ToList();
                projects.Insert(0, "Select Project");
                ddProject.DataSource = projects;
                ddProject.DataBind();
                
            }
        }

        // Adding new land
        protected void btnCreateOrder_Click(object sender, EventArgs e)
        {
            //using (var context = new ApplicationDbContext())
            //{
            //    var newLand = new Land()
            //    {
            //        PlotNumber = txtPlotNumber.Text,
            //        Location = txtLocation.Text,
            //        Length = txtLength.Text,
            //        Breadth = txtBreadth.Text,
            //        SquareFeet = (Convert.ToInt32(txtLength.Text) * Convert.ToInt32(txtBreadth.Text)).ToString(),
            //        Price = txtPrice.Text
            //    };
            //    context.Lands.Add(newLand);
            //    context.SaveChanges();
            //    BindLandDetails();
            //}
        }

        

        // Editing land details
        protected void gvOrderDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvOrderDetails.EditIndex = e.NewEditIndex;
           // BindLandDetails();
        }

        // Updating land details
        protected void gvOrderDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvOrderDetails.Rows[e.RowIndex];
            int landId = Convert.ToInt32(gvOrderDetails.DataKeys[e.RowIndex].Value);

            using (var context = new ApplicationDbContext())
            {
                var land = context.Lands.Find(landId);
                land.PlotNumber = (row.Cells[1].Controls[0] as TextBox).Text;
                land.Location = (row.Cells[2].Controls[0] as TextBox).Text;
                land.Length =(row.Cells[3].Controls[0] as TextBox).Text;
                land.Breadth = (row.Cells[4].Controls[0] as TextBox).Text;
                land.SquareFeet = (Convert.ToInt32(land.Length) * Convert.ToInt32(land.Breadth)).ToString();
                land.Price = (row.Cells[6].Controls[0] as TextBox).Text;

                context.SaveChanges();
                gvOrderDetails.EditIndex = -1;
               // BindLandDetails();
            }
        }

        // Cancel editing
        protected void gvOrderDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvOrderDetails.EditIndex = -1;
            //BindLandDetails();
        }

        // Deleting land details
        protected void gvOrderDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int landId = Convert.ToInt32(gvOrderDetails.DataKeys[e.RowIndex].Value);
            using (var context = new ApplicationDbContext())
            {
                var land = context.Lands.Find(landId);
                context.Lands.Remove(land);
                context.SaveChanges();
               // BindLandDetails();
            }
        }
        private void HideControls()
        {
            lblError.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {            
            using (var context = new ApplicationDbContext())
            {
                lblError.Visible = true;
                var lands = "";// context.Lands.Where(x => x.PlotNumber == txtSearch.Text.Trim())
                    //.ToList();
                if (lands!=null && lands.Any())
                {
                    lblError.Visible=false;
                    gvOrderDetails.DataSource = lands;
                    gvOrderDetails.DataBind();
                }
                
            }
        }

        protected void ddProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {

                var plots = context.AgentLands.Where(x=>x.Project==ddProject.SelectedItem.Text).Select(x => x.PlotNumber).ToList();
                plots.Insert(0, "Select Plot number");
                ddPlotNumber.DataSource = plots;
                ddPlotNumber.DataBind();

            }
        }

        protected void ddPlotNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {

                var plot = context.AgentLands.Where(x => x.PlotNumber == ddPlotNumber.SelectedItem.Text).Select(x => 
                new { 
                    Area=x.SquareFeet,
                    Rate=x.PricePerSqaureFeet,
                    Price=x.Price,
                    Loction=x.Location,
                    AgentName=x.AgentName,
                    AgentId=x.AgentId,
                    

                }).SingleOrDefault();
                
                lblProject.Text=ddProject.SelectedItem.Text;
                lblPlotNumber.Text=ddPlotNumber.SelectedItem.Text;
                lblPricePerSqFeet.Text = plot.Rate;
                lblArea.Text=plot.Area;
                lblTotalPrice.Text = plot.Price;
                lblAgent.Text = plot.AgentName;
                lblAgentId.Text = plot.AgentId;

               

            }
        }

        protected void ddCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {

                var customer = context.Customers.Where(x => x.Name == ddCustomer.SelectedItem.Text).FirstOrDefault();
                lblCustomerId.Text = customer.CustomerId.ToString();
                lblCustomerName.Text = customer.Name;
                lblCustomerPhone.Text = customer.PhoneNumber;
                lblCustomerEmail.Text = customer.Email;

            }
        }
    }
}