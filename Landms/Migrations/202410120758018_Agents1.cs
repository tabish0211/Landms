namespace Landms.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Agents1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Agents", "LeadName", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Agents", "LeadName");
        }
    }
}
