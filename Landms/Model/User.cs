using System;
using System.ComponentModel.DataAnnotations;

namespace Landms.Model
{


    public class User
    {
        [Key]
        public int UserId { get; set; }

        [Required]
        
        public string FirstName { get; set; }

        [Required]
        
        public string LastName { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        
        public string Password { get; set; }

        [Required]
        public string Role { get; set; } // Admin, Agent, Customer

        [Phone]
        public string PhoneNumber { get; set; }

        [DataType(DataType.Date)]
        public DateTime? DateOfBirth { get; set; }

        public DateTime CreatedDate { get; set; } = DateTime.Now;

        public bool IsActive { get; set; } = true;
    }

}