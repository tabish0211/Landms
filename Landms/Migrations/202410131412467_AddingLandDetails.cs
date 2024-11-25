namespace Landms.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddingLandDetails : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Lands",
                c => new
                    {
                        LandId = c.Int(nullable: false, identity: true),
                        PlotNumber = c.String(nullable: false),
                        Location = c.String(nullable: false),
                        Length = c.String(nullable: false),
                        Breadth = c.String(nullable: false),
                        SquareFeet = c.String(nullable: false),
                        Price = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.LandId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Lands");
        }
    }
}
