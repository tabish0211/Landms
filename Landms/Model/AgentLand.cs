using System;
using System.ComponentModel.DataAnnotations;

namespace Landms.Model
{


    public class AgentLand
    {
        [Key]
        public int AgentLandId { get; set; }

        [Required]
        
        public string PlotNumber { get; set; }
        [Required]

        public string Project { get; set; }

        [Required]
        
        public string Location { get; set; }
        

        public string SquareFeet { get; set; }

        [Required]

        public string Price { get; set; }
        [Required]

        public string PricePerSqaureFeet { get; set; }
        [Required]

        public string AgentId { get; set; }
        [Required]

        public string AgentName { get; set; }
        [Required]

        public string AgentLead { get; set; }


    }

}