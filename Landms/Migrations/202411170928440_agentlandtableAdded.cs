namespace Landms.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class agentlandtableAdded : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.AgentLands",
                c => new
                    {
                        AgentLandId = c.Int(nullable: false, identity: true),
                        PlotNumber = c.String(nullable: false),
                        Project = c.String(nullable: false),
                        Location = c.String(nullable: false),
                        SquareFeet = c.String(),
                        Price = c.String(nullable: false),
                        PricePerSqaureFeet = c.String(nullable: false),
                        AgentId = c.String(nullable: false),
                        AgentName = c.String(nullable: false),
                        AgentLead = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.AgentLandId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.AgentLands");
        }
    }
}
