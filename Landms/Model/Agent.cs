using System;
using System.ComponentModel.DataAnnotations;

namespace Landms.Model
{


    public class Agent
    {
        [Key]
        public int AgentId { get; set; }

        [Required]
        
        public string Name { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        public string PhoneNumber { get; set; }


        [Required]

        public string LeadName { get; set; }
        //public string Password { get; set; }

    }

}