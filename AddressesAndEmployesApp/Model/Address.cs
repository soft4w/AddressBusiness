using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace AddressesAndEmployesApp.Model
{
    [Table("tblAddress")]
    public class Address
    {
        [Key]
        public int AddressId { get; set; }
        [StringLength(50)]
        public string AddressBusiness { get; set; }

        public virtual ICollection<AddressName> AddressNames { get; set; }
    }
}
