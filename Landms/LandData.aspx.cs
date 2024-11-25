using Landms.Model;
using System;
using System.Linq;
using System.Web.UI.WebControls;


namespace Landms
{
    public partial class LandData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HideControls();
            if (!IsPostBack)
            {
                BindLandDetails();
            }
        }

        // Function to bind land data to GridView
        private void BindLandDetails()
        {
            using (var context = new ApplicationDbContext())
            {
                var lands = context.Lands.ToList();
                gvLandDetails.DataSource = lands;
                gvLandDetails.DataBind();
            }
        }

        // Adding new land
        protected void btnAddLand_Click(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {
                int totalPrice = Convert.ToInt32(txtPricePerSqaurefeet.Text) * (Convert.ToInt32(txtLength.Text) * Convert.ToInt32(txtBreadth.Text));
                var newLand = new Land()
                {
                    PlotNumber = txtPlotNumber.Text,
                    Project=txtProjectName.Text,
                    Location = txtLocation.Text,
                    Length = txtLength.Text,
                    Breadth = txtBreadth.Text,
                    PricePerSqaureFeet= txtPricePerSqaurefeet.Text,
                    SquareFeet = (Convert.ToInt32(txtLength.Text) * Convert.ToInt32(txtBreadth.Text)).ToString(),
                    Price = totalPrice.ToString()
                };
                context.Lands.Add(newLand);
                context.SaveChanges();
                BindLandDetails();
            }
        }

        

        // Editing land details
        protected void gvLandDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvLandDetails.EditIndex = e.NewEditIndex;
            BindLandDetails();
        }

        // Updating land details
        protected void gvLandDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvLandDetails.Rows[e.RowIndex];
            int landId = Convert.ToInt32(gvLandDetails.DataKeys[e.RowIndex].Value);

            using (var context = new ApplicationDbContext())
            {
                var land = context.Lands.Find(landId);
                land.PlotNumber = (row.Cells[1].Controls[0] as TextBox).Text;
                land.Project = (row.Cells[2].Controls[0] as TextBox).Text;
                land.Location = (row.Cells[3].Controls[0] as TextBox).Text;
                land.Length =(row.Cells[4].Controls[0] as TextBox).Text;
                land.Breadth = (row.Cells[5].Controls[0] as TextBox).Text;
                land.SquareFeet = (Convert.ToInt32(land.Length) * Convert.ToInt32(land.Breadth)).ToString();
                land.PricePerSqaureFeet = (row.Cells[7].Controls[0] as TextBox).Text;
                land.Price = (Convert.ToInt32(land.SquareFeet) * Convert.ToInt32(land.PricePerSqaureFeet)).ToString();

                context.SaveChanges();
                gvLandDetails.EditIndex = -1;
                BindLandDetails();
            }
        }

        // Cancel editing
        protected void gvLandDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvLandDetails.EditIndex = -1;
            BindLandDetails();
        }

        // Deleting land details
        protected void gvLandDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int landId = Convert.ToInt32(gvLandDetails.DataKeys[e.RowIndex].Value);
            using (var context = new ApplicationDbContext())
            {
                var land = context.Lands.Find(landId);
                context.Lands.Remove(land);
                context.SaveChanges();
                BindLandDetails();
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
                var lands = context.Lands.Where(x => x.PlotNumber == txtSearch.Text.Trim())
                    .ToList();
                if (lands!=null && lands.Any())
                {
                    lblError.Visible=false;
                    gvLandDetails.DataSource = lands;
                    gvLandDetails.DataBind();
                }
                
            }
        }
    }
}