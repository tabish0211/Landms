namespace Landms.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddingCustomerLandAgentMapping : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CLAMappers",
                c => new
                    {
                        MappingId = c.Int(nullable: false, identity: true),
                        CustomerId = c.Int(nullable: false),
                        LandId = c.Int(nullable: false),
                        AgentId = c.Int(nullable: false),
                        PurchaseDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.MappingId)
                .ForeignKey("dbo.Agents", t => t.AgentId, cascadeDelete: true)
                .ForeignKey("dbo.Customers", t => t.CustomerId, cascadeDelete: true)
                .ForeignKey("dbo.Lands", t => t.LandId, cascadeDelete: true)
                .Index(t => t.CustomerId)
                .Index(t => t.LandId)
                .Index(t => t.AgentId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.CLAMappers", "LandId", "dbo.Lands");
            DropForeignKey("dbo.CLAMappers", "CustomerId", "dbo.Customers");
            DropForeignKey("dbo.CLAMappers", "AgentId", "dbo.Agents");
            DropIndex("dbo.CLAMappers", new[] { "AgentId" });
            DropIndex("dbo.CLAMappers", new[] { "LandId" });
            DropIndex("dbo.CLAMappers", new[] { "CustomerId" });
            DropTable("dbo.CLAMappers");
        }
    }
}
