using System;
using System.ComponentModel.DataAnnotations;

namespace Landms.Model
{


    public class Order
    {
        [Key]
        public int OrderId { get; set; }

        [Required]
        
        public string PlotNumber { get; set; }
        [Required]

        public string LandId { get; set; }
        [Required]

        public string Date { get; set; }

        [Required]
        
        public string CustomerId { get; set; }


        [Required]

        public string AgentId { get; set; }

        [Required]
        public string Payment { get; set; }


        [Required]

        public string Mode { get; set; }
        [Required]

        public string TransactionNumber { get; set; }

        [Required]

        public string IsDeposited { get; set; }
       

    }

}