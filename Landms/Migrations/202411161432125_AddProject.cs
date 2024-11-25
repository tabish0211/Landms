namespace Landms.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddProject : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Lands", "Project", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Lands", "Project");
        }
    }
}
