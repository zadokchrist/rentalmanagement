using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Models
{
    public class Property
    {
        public string PropertyId { get; set; }
        public string LandLordId { get; set; }
        public string PRN { get; set; }
        public string PropertyLoc { get; set; }
        public string Longtitude { get; set; }
        public string Latitude { get; set; }
        public string CreationDate { get; set; }
        public string NumroomsOcupied { get; set; }
        public string TotalRooms { get; set; }
    }
}
