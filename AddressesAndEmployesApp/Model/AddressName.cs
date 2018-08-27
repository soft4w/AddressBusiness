using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace AddressesAndEmployesApp.Model
{
    [Table("tblAddressNames")]
    public class AddressName
    {
        [Key]
        public int NameId { get; set; }

        [ForeignKey("Address")]
        public int AddressId { get; set; }

        // navigate property
        public Address Address { get; set; }

        [StringLength(50)]
        public string AddressFirstName { get; set; }

        [StringLength(50)]
        public string AddressSurname { get; set; }
    }
}
