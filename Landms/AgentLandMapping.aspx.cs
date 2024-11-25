using Landms.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;


namespace Landms
{
    public partial class AgentLandMapping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                BindLandDetails();
                BindProjectDetails();
                BindAgentDetails();
            }
        }

        // Function to bind land data to GridView
        private void BindProjectDetails()
        {
            using (var context = new ApplicationDbContext())
            {
              
                var projects = context.Lands.Select(x=>x.Project).ToList();
                projects.Insert(0, "Select Project");
                ddProject.DataSource = projects;
                ddProject.DataBind();
                
            }
        }
        private void BindAgentDetails()
        {
            using (var context = new ApplicationDbContext())
            {

                var AgentIds = context.Agents.Select(x => x.AgentId.ToString()).ToList();
                AgentIds.Insert(0, "Select Agent Id");
                ddAgentId.DataSource = AgentIds;
                ddAgentId.DataBind();

            }
        }
        private void BindLandDetails()
        {
            using (var context = new ApplicationDbContext())
            {
                var agentLands = context.AgentLands.ToList();
                gvAgentLandDetails.DataSource = agentLands;
                gvAgentLandDetails.DataBind();
            }
        }
        // Adding new land
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {
                var agentLand = new AgentLand()
                {
                    Project=ddProject.SelectedItem.Text,
                    AgentId=ddAgentId.SelectedItem.Text,
                    PlotNumber = ddPlotNumber.SelectedItem.Text,
                    Location = lblLocation.Text,                    
                    SquareFeet = lblArea.Text,
                    PricePerSqaureFeet=lblPricePerSqFeet.Text,
                    Price = lblTotalPrice.Text,
                    AgentName=lblAgentName.Text,
                    AgentLead=lblLead.Text,
                };
                context.AgentLands.Add(agentLand);
                context.SaveChanges();
                BindLandDetails();
            }
        }

        

        // Editing land details
        protected void gvAgentLandDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAgentLandDetails.EditIndex = e.NewEditIndex;
            BindLandDetails();
        }

        // Updating land details
        protected void gvAgentLandDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvAgentLandDetails.Rows[e.RowIndex];
            int agnetlandId = Convert.ToInt32(gvAgentLandDetails.DataKeys[e.RowIndex].Value);

            using (var context = new ApplicationDbContext())
            {
                var land = context.AgentLands.Find(agnetlandId);
                land.PlotNumber = (row.Cells[1].Controls[0] as TextBox).Text;
                land.Location = (row.Cells[2].Controls[0] as TextBox).Text;
                //land.Length =(row.Cells[3].Controls[0] as TextBox).Text;
                //land.Breadth = (row.Cells[4].Controls[0] as TextBox).Text;
                //land.SquareFeet = (Convert.ToInt32(land.Length) * Convert.ToInt32(land.Breadth)).ToString();
                land.Price = (row.Cells[6].Controls[0] as TextBox).Text;

                context.SaveChanges();
                gvAgentLandDetails.EditIndex = -1;
                BindLandDetails();
            }
        }

        // Cancel editing
        protected void gvAgentLandDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAgentLandDetails.EditIndex = -1;
            BindLandDetails();
        }

        // Deleting land details
        protected void gvAgentLandDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int landId = Convert.ToInt32(gvAgentLandDetails.DataKeys[e.RowIndex].Value);
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

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{            
        //    using (var context = new ApplicationDbContext())
        //    {
        //        lblError.Visible = true;
        //        var lands = "";// context.Lands.Where(x => x.PlotNumber == txtSearch.Text.Trim())
        //            //.ToList();
        //        if (lands!=null && lands.Any())
        //        {
        //            lblError.Visible=false;
        //            gvAgentLandDetails.DataSource = lands;
        //            gvAgentLandDetails.DataBind();
        //        }
                
        //    }
        //}

        protected void ddProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {

                var plots = context.Lands.Where(x=>x.Project==ddProject.SelectedItem.Text).Select(x => x.PlotNumber).ToList();
                plots.Insert(0, "Select Plot number");
                ddPlotNumber.DataSource = plots;
                ddPlotNumber.DataBind();

            }
        }

        protected void ddPlotNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {

                var plot = context.Lands.Where(x => x.PlotNumber == ddPlotNumber.SelectedItem.Text).Select(x => new { Area=x.SquareFeet,Rate=x.PricePerSqaureFeet,Price=x.Price,Location=x.Location}).SingleOrDefault();
                
                lblProject.Text=ddProject.SelectedItem.Text;
                lblPlotNumber.Text=ddPlotNumber.SelectedItem.Text;
                lblPricePerSqFeet.Text = plot.Rate;
                lblArea.Text=plot.Area;
                lblTotalPrice.Text = plot.Price;
                lblLocation.Text = plot.Location;
            }
        }

        protected void ddAgentId_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {
                var agentId = Convert.ToInt32(ddAgentId.SelectedItem.Text);
                var agent = context.Agents.Where(x=>x.AgentId==agentId).Select(x => new { Name= x.Name ,Lead=x.LeadName} ).FirstOrDefault();
                lblAgentName.Text=agent.Name;
                lblLead.Text = agent.Lead;
              

            }
        }
    }
}