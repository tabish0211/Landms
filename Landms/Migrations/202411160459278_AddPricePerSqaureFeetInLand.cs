namespace Landms.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddPricePerSqaureFeetInLand : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Lands", "PricePerSqaureFeet", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Lands", "PricePerSqaureFeet");
        }
    }
}
