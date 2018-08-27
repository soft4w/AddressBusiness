using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AddressesAndEmployesApp.Model;
using AddressesAndEmployesApp.DAL;
using System.Data.Entity;

namespace AddressesAndEmployesApp
{
   
    public partial class MainForm : Form
    {
        List<AddressName> _addressNames = new List<AddressName>();
        public MainForm()
        {
            InitializeComponent();
        }

        private async void buttonSearch_Click(object sender, EventArgs e)
        {
            DisableView();
            using (var db = new DbAccess())
            {
                _addressNames = await db.FilterBusinessAndPersonsAsync(textBoxBusiness.Text, textBoxNameSurname.Text);
            }

            List<EntytiesForDisplay> ds = _addressNames.Select(o => new EntytiesForDisplay() { Business = o.Address.AddressBusiness, Name = o.AddressFirstName, Surname = o.AddressSurname }).ToList();
            dataGridView.DataSource = ds;
            lblFindedCount.Text = "Finded: "+ds.Count().ToString()+" items";
            EnableView();
        }

        private void DisableView()
        {
            buttonSearch.Enabled = false;
        }

        private void EnableView()
        {
            buttonSearch.Enabled = true;
        }

        
        class EntytiesForDisplay
        {
            public string Name { get; set; }
            public string Surname { get; set; }
            public string Business { get; set; }

        }
    }
}
