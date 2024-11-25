using Landms.Model;
using System.Data.Entity;

namespace Landms
{
    // Ensure EntityFramework is being used

    public class ApplicationDbContext : DbContext
    {
        // Define a constructor that uses the base DbContext constructor
        public ApplicationDbContext() : base("DefaultConnection")
        {
        }

        // Define DbSet for each entity you want to manage (e.g., Users)
        public DbSet<User> Users { get; set; }
        public DbSet<Agent> Agents { get; set; }
        public DbSet<Land> Lands { get; set; }
        public DbSet<Customer> Customers { get; set; }

        public DbSet<AgentLand> AgentLands { get; set; }

        // Other DbSets for other entities like Agents, Lands, etc.
    }

}