using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using AddressesAndEmployesApp.Model;

namespace AddressesAndEmployesApp.DAL
{
    class DbAccess : DbContext
    {
        public DbAccess() : base("DBConnection")
        { }

        public DbSet<Address> Addresses { get; set; }
        public DbSet<AddressName> AddressNames { get; set; }

        public Task<List<AddressName>> FilterBusinessAndPersonsAsync(string business, string person)
        {
            return Task.Run(() =>
            {
                return AddressNames.Include(p => p.Address).Where(
                        o => o.AddressFirstName.StartsWith(person) || o.AddressSurname.StartsWith(person)).Where(
                                                                        u => u.Address.AddressBusiness.StartsWith(business)).ToList();
            });
        }
    }
}
