using Landms.Model;
using System;
using System.Linq;
using System.Web.UI.WebControls;
//using System.Data.Entity;

namespace Landms
{

    public partial class Middle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HideControls();
            if (!IsPostBack)
            {
                BindAgentDetails();
               // BindLeadAgents(); // Bind Lead Agents for Sub Agent Assignment
            }
        }

        // Bind Lead Agents to DropDownList for sub-agent assignment
        //private void BindLeadAgents()
        //{
        //    using (var context = new ApplicationDbContext())
        //    {
        //        var leadAgents = context.Agents.Where(a => a.AgentType == "Lead").ToList();
        //        ddlLeadAgent.DataSource = leadAgents;
        //        ddlLeadAgent.DataTextField = "Name";
        //        ddlLeadAgent.DataValueField = "AgentId";
        //        ddlLeadAgent.DataBind();
        //        ddlLeadAgent.Items.Insert(0, new ListItem("-- Select Lead Agent --", "0"));
        //    }
        //}

        // Bind Agent data to GridView
        private void BindAgentDetails()
        {
            using (var context = new ApplicationDbContext())
            {
                var agents = (from a in context.Agents
                              select new
                              {
                                  a.AgentId,
                                  a.Name,
                                  a.Email,
                                  a.PhoneNumber,
                                  a.LeadName
                                  
                              }).ToList();

                gvAgentDetails.DataSource = agents;
                gvAgentDetails.DataBind();
            }
        }

        // Handle Add Agent (Lead/Sub Agent)
        protected void btnAddAgent_Click(object sender, EventArgs e)
        {
            using (var context = new ApplicationDbContext())
            {
                var newAgent = new Agent()
                {
                    Name = txtAgentName.Text,
                    Email = txtEmail.Text,
                    PhoneNumber = txtPhoneNumber.Text,
                    LeadName=txtLeadName.Text

                };



                context.Agents.Add(newAgent);
                context.SaveChanges();
                BindAgentDetails();
            }
        }

        // Editing Agent
        protected void gvAgentDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAgentDetails.EditIndex = e.NewEditIndex;
            BindAgentDetails();
        }

        // Updating Agent
        protected void gvAgentDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvAgentDetails.Rows[e.RowIndex];
            int agentId = Convert.ToInt32(gvAgentDetails.DataKeys[e.RowIndex].Value);

            using (var context = new ApplicationDbContext())
            {
                var agent = context.Agents.Find(agentId);
                agent.Name = (row.Cells[1].Controls[0] as TextBox).Text;
                agent.Email = (row.Cells[2].Controls[0] as TextBox).Text;
                agent.PhoneNumber = (row.Cells[3].Controls[0] as TextBox).Text;
                agent.LeadName = (row.Cells[4].Controls[0] as TextBox).Text;

                //if (agent.AgentType == "Lead")
                //{
                //    agent.TeamSize = Convert.ToInt32((row.Cells[5].Controls[0] as TextBox).Text);
                //}

                context.SaveChanges();
                gvAgentDetails.EditIndex = -1;
                BindAgentDetails();
            }
        }

        protected void gvAgentDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Cancel the editing mode
            gvAgentDetails.EditIndex = -1;

            // Rebind the data to reset the GridView to its original state
            BindAgentDetails();
        }

        protected void ddlLeadAgent_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlAgentType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvAgentDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the ID of the agent to be deleted from the GridView's DataKey
            int agentId = Convert.ToInt32(gvAgentDetails.DataKeys[e.RowIndex].Value);

           // Connect to the database context
            using (var context = new ApplicationDbContext())
            {
                // Find the agent by ID
                var agentToDelete = context.Agents.Find(agentId);

                if (agentToDelete != null)
                {
                    // Remove the agent from the context
                    context.Agents.Remove(agentToDelete);

                    // Save changes to the database
                    context.SaveChanges();

                    // Rebind the GridView to reflect the deletion
                    BindAgentDetails();
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e) 
        {
            using (var context = new ApplicationDbContext())
            {
                lblError.Visible = true;
                var agents = context.Agents.Where(x => x.PhoneNumber == txtSearch.Text.Trim())
                    .ToList();
                if (agents != null && agents.Any())
                {
                    lblError.Visible = false;
                    gvAgentDetails.DataSource = agents;
                    gvAgentDetails.DataBind();
                }

            }
        }

        private void HideControls()
        {
            lblError.Visible = false;
        }

    }
}
