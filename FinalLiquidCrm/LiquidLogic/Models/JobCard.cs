using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Models
{
    public class JobCard : Material
    {
        public string TicketId { get; set; }
        public string JobCardNo { get; set; }
        public string JobType { get; set; }
        public string OppArea { get; set; }
        public string Branch { get; set; }
        public string Territory { get; set; }
        public string SubTerritory { get; set; }
        public string AssetCategory { get; set; }
        public string AssetDescription { get; set; }
        public string AssetLocation { get; set; }
        public string AssetReference { get; set; }
        public string JobCategory { get; set; }
        public string Address { get; set; }
        public string AssetType { get; set; }
        public string Ycordinates { get; set; }
        public string Xcordinates { get; set; }
        public string BlockMapRef { get; set; }
        public string Status { get; set; }
        public string RecordDate { get; set; }
        
    }
}
