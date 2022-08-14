using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiquidLogic.Models
{
    public class BillingCustomers : GenericResponse
    {
        public List<BillingCustomer> billingCustomers { get; set; }
    }
}
