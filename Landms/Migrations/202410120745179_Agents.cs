namespace Landms.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Agents : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Agents",
                c => new
                    {
                        AgentId = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                        Email = c.String(nullable: false),
                        PhoneNumber = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.AgentId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Agents");
        }
    }
}
