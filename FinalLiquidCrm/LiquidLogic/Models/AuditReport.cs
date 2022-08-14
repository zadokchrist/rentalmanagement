using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Models
{
    public class AuditReport
    {
        public string RecordId { get; set; }
        public string Username { get; set; }
        public string Action { get; set; }
        public string RecordDate { get; set; }
    }
}
