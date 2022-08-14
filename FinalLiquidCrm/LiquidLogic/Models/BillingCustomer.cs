using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Models
{
    public class BillingCustomer 
    {
        public string customerRef { get; set; }
        public string customerName { get; set; }
        public string phoneNo1 { get; set; }
        public string custEmail { get; set; }
        public string Area { get; set; }
        public string AreaId { get; set; }
        public string Branch { get; set; }
        public string BranchId { get; set; }
        public string Territory { get; set; }
    }
}
