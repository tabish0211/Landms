namespace Landms.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class agentlandtable : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.CLAMappers", "AgentId", "dbo.Agents");
            DropForeignKey("dbo.CLAMappers", "CustomerId", "dbo.Customers");
            DropForeignKey("dbo.CLAMappers", "LandId", "dbo.Lands");
            DropIndex("dbo.CLAMappers", new[] { "CustomerId" });
            DropIndex("dbo.CLAMappers", new[] { "LandId" });
            DropIndex("dbo.CLAMappers", new[] { "AgentId" });
            AlterColumn("dbo.Customers", "Name", c => c.String(nullable: false));
            AlterColumn("dbo.Customers", "Email", c => c.String(nullable: false));
            AlterColumn("dbo.Customers", "PhoneNumber", c => c.String(nullable: false));
            AlterColumn("dbo.Customers", "Address", c => c.String(nullable: false));
            DropTable("dbo.CLAMappers");
        }
        
        public override void Down()
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
                .PrimaryKey(t => t.MappingId);
            
            AlterColumn("dbo.Customers", "Address", c => c.String());
            AlterColumn("dbo.Customers", "PhoneNumber", c => c.String());
            AlterColumn("dbo.Customers", "Email", c => c.String());
            AlterColumn("dbo.Customers", "Name", c => c.String());
            CreateIndex("dbo.CLAMappers", "AgentId");
            CreateIndex("dbo.CLAMappers", "LandId");
            CreateIndex("dbo.CLAMappers", "CustomerId");
            AddForeignKey("dbo.CLAMappers", "LandId", "dbo.Lands", "LandId", cascadeDelete: true);
            AddForeignKey("dbo.CLAMappers", "CustomerId", "dbo.Customers", "CustomerId", cascadeDelete: true);
            AddForeignKey("dbo.CLAMappers", "AgentId", "dbo.Agents", "AgentId", cascadeDelete: true);
        }
    }
}
