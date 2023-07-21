using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MahikariTaiV2.Models
{
    public class ElIntegrante
    {
        public string rut { get; set; }
        public string names { get; set; }
        public string firstLastname { get; set; }
        public string secondLastname { get; set; }
        public string gender { get; set; }
        public string category { get; set; }
        public string email { get; set; }        
        public DateTime birthdate { get; set; }
        public string nacionality { get; set; }
        public string phone { get; set; }
        public string street { get; set; }
        public string number { get; set; }
        public string region { get; set; }
        public string provincia { get; set; }
        public string comuna { get; set; }
        public string hobbies { get; set; }
    }
}