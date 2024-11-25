using System;
using System.ComponentModel.DataAnnotations;

namespace Landms.Model
{


    public class Customer
    {
        [Key]
        public int CustomerId { get; set; }

        [Required]
        
        public string Name { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        public string PhoneNumber { get; set; }


        [Required]

        public string Address { get; set; }
        //public string Password { get; set; }

    }

}