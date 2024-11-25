using System;
using System.ComponentModel.DataAnnotations;

namespace Landms.Model
{


    public class Land
    {
        [Key]
        public int LandId { get; set; }

        [Required]
        
        public string PlotNumber { get; set; }
        [Required]

        public string Project { get; set; }

        [Required]
        
        public string Location { get; set; }

        [Required]
        public string Length { get; set; }


        [Required]

        public string Breadth { get; set; }
        [Required]

        public string SquareFeet { get; set; }

        [Required]

        public string Price { get; set; }
        [Required]

        public string PricePerSqaureFeet { get; set; }


    }

}