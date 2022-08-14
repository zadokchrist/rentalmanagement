using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Models
{
    public class AppAssignment
    {
        public string ApplicationId { get; set; }
        public string FromDepart { get; set; }
        public string ToDepart { get; set; }
        public string Reason { get; set; }
        public string Status { get; set; }
        public string AssignedBy { get; set; }
        public string RecordDate { get; set; }
        public string RecordId { get; set; }
    }
}
